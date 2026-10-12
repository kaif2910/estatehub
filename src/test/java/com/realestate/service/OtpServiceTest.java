package com.realestate.service;

import com.realestate.dao.UserDAO;
import com.realestate.model.User;
import org.junit.Test;
import static org.junit.Assert.*;

public class OtpServiceTest {
    private static class FakeDao extends UserDAO {
        boolean stored = true;
        String savedCode;
        int verificationUpdates;
        @Override public boolean createOtp(int userId, String code, String purpose, int expiryMinutes) {
            assertEquals("REGISTRATION", purpose);
            assertEquals(10, expiryMinutes);
            savedCode = code;
            return stored;
        }
        @Override public boolean verifyOtp(int userId, String code, String purpose) { return true; }
        @Override public boolean setEmailVerified(int userId, boolean verified) { return true; }
        @Override public boolean updateUserVerificationStatus(int userId, User.VerificationStatus status, String reason) {
            verificationUpdates++;
            return true;
        }
    }

    @Test public void sendsExactlyTheCodeStoredForVerification() {
        FakeDao dao = new FakeDao();
        int[] sends = {0};
        OtpService service = new OtpService(dao, (user, code) -> {
            sends[0]++;
            assertTrue(code.matches("[1-9][0-9]{5}"));
            assertEquals(dao.savedCode, code);
            return true;
        });
        assertTrue(service.generateAndSendOtp(new User(), "REGISTRATION"));
        assertEquals(1, sends[0]);
    }

    @Test public void doesNotClaimSuccessWhenDeliveryFails() {
        OtpService service = new OtpService(new FakeDao(), (user, code) -> false);
        assertFalse(service.generateAndSendOtp(new User(), "REGISTRATION"));
    }

    @Test public void doesNotSendAnUnusableCodeWhenDatabaseWriteFails() {
        FakeDao dao = new FakeDao();
        dao.stored = false;
        OtpService service = new OtpService(dao, (user, code) -> {
            fail("Email must not be sent if OTP storage failed");
            return true;
        });
        assertFalse(service.generateAndSendOtp(new User(), "REGISTRATION"));
    }

    @Test public void emailVerificationDoesNotOverwriteKycStatus() {
        FakeDao dao = new FakeDao();
        OtpService service = new OtpService(dao, (user, code) -> true);
        assertTrue(service.verifyOtp(1, "654321", "REGISTRATION"));
        assertEquals(0, dao.verificationUpdates);
    }

    @Test public void requestedDemoOtpStillWorksWithoutChangingKycStatus() {
        FakeDao dao = new FakeDao();
        OtpService service = new OtpService(dao, (user, code) -> false);
        assertTrue(service.verifyOtp(1, "123456", "REGISTRATION"));
        assertEquals(0, dao.verificationUpdates);
    }
}
