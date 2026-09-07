package com.realestate.service;

import com.realestate.dao.VerificationDAO;
import com.realestate.model.VerificationDocument;
import com.realestate.model.VerificationRequest;
import java.util.List;

public class VerificationService {

    private final VerificationDAO verificationDAO = new VerificationDAO();

    public int submitVerificationRequest(int userId, String businessName, String licenseNumber, String taxId, List<VerificationDocument> docs) {
        VerificationRequest req = new VerificationRequest();
        req.setUserId(userId);
        req.setBusinessName(businessName);
        req.setLicenseNumber(licenseNumber);
        req.setTaxIdOrPan(taxId);
        req.setStatus(VerificationRequest.Status.PENDING);

        int requestId = verificationDAO.createRequest(req);
        if (requestId > 0 && docs != null) {
            for (VerificationDocument doc : docs) {
                doc.setRequestId(requestId);
                verificationDAO.addDocument(doc);
            }
        }
        return requestId;
    }

    public VerificationRequest getStatusForUser(int userId) {
        return verificationDAO.findLatestByUserId(userId);
    }

    public List<VerificationRequest> getAllRequests(String statusFilter) {
        return verificationDAO.findAll(statusFilter);
    }

    public boolean reviewRequest(int requestId, boolean approved, String adminNotes, int adminUserId) {
        VerificationRequest.Status status = approved ? VerificationRequest.Status.APPROVED : VerificationRequest.Status.REJECTED;
        return verificationDAO.reviewRequest(requestId, status, adminNotes, adminUserId);
    }
}
