package com.realestate.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class VerificationRequest implements Serializable {
    private static final long serialVersionUID = 1L;

    public enum Status { PENDING, APPROVED, REJECTED }

    private int requestId;
    private int userId;
    private String businessName;
    private String licenseNumber;
    private String taxIdOrPan;
    private Status status;
    private String adminNotes;
    private Integer reviewedBy;
    private Timestamp reviewedAt;
    private Timestamp createdAt;

    // Joined fields
    private String userName;
    private String userEmail;
    private String userPhone;
    private User.Role userRole;
    private List<VerificationDocument> documents = new ArrayList<>();

    public VerificationRequest() {
        this.status = Status.PENDING;
    }

    public int getRequestId() { return requestId; }
    public void setRequestId(int requestId) { this.requestId = requestId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getBusinessName() { return businessName; }
    public void setBusinessName(String businessName) { this.businessName = businessName; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public String getTaxIdOrPan() { return taxIdOrPan; }
    public void setTaxIdOrPan(String taxIdOrPan) { this.taxIdOrPan = taxIdOrPan; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public String getAdminNotes() { return adminNotes; }
    public void setAdminNotes(String adminNotes) { this.adminNotes = adminNotes; }

    public Integer getReviewedBy() { return reviewedBy; }
    public void setReviewedBy(Integer reviewedBy) { this.reviewedBy = reviewedBy; }

    public Timestamp getReviewedAt() { return reviewedAt; }
    public void setReviewedAt(Timestamp reviewedAt) { this.reviewedAt = reviewedAt; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getUserPhone() { return userPhone; }
    public void setUserPhone(String userPhone) { this.userPhone = userPhone; }

    public User.Role getUserRole() { return userRole; }
    public void setUserRole(User.Role userRole) { this.userRole = userRole; }

    public List<VerificationDocument> getDocuments() { return documents; }
    public void setDocuments(List<VerificationDocument> documents) { this.documents = documents; }
}
