package com.realestate.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    public enum Role {
        CUSTOMER, SELLER, BROKER, ADMIN
    }

    public enum Status {
        ACTIVE, SUSPENDED, PENDING
    }

    public enum VerificationStatus {
        UNVERIFIED, PENDING, VERIFIED, REJECTED
    }

    private int userId;
    private String name;
    private String email;
    private String password;
    private String phone;
    private Role role;
    private Status status;
    private boolean emailVerified;
    private String whatsappNumber;
    private VerificationStatus verificationStatus;
    private String verificationRejectionReason;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public User() {
        this.role = Role.CUSTOMER;
        this.status = Status.ACTIVE;
        this.verificationStatus = VerificationStatus.UNVERIFIED;
    }

    public User(int userId, String name, String email, String phone, Role role, Status status, boolean emailVerified) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.status = status;
        this.emailVerified = emailVerified;
        this.verificationStatus = VerificationStatus.UNVERIFIED;
    }

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public Role getRole() { return role; }
    public void setRole(Role role) { this.role = role; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public boolean isEmailVerified() { return emailVerified; }
    public void setEmailVerified(boolean emailVerified) { this.emailVerified = emailVerified; }

    public String getWhatsappNumber() { return whatsappNumber; }
    public void setWhatsappNumber(String whatsappNumber) { this.whatsappNumber = whatsappNumber; }

    public VerificationStatus getVerificationStatus() { return verificationStatus; }
    public void setVerificationStatus(VerificationStatus verificationStatus) { this.verificationStatus = verificationStatus; }

    public String getVerificationRejectionReason() { return verificationRejectionReason; }
    public void setVerificationRejectionReason(String reason) { this.verificationRejectionReason = reason; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }

    public boolean isVerifiedBadge() {
        return this.verificationStatus == VerificationStatus.VERIFIED;
    }
}
