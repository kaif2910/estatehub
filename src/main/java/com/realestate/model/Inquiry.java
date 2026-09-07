package com.realestate.model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Inquiry implements Serializable {
    private static final long serialVersionUID = 1L;

    public enum Status { OPEN, RESPONDED, CLOSED }

    private int inquiryId;
    private int propertyId;
    private int customerId;
    private String message;
    private String contactPhone;
    private Date preferredVisitDate;
    private Status status;
    private String sellerReply;
    private Timestamp repliedAt;
    private Timestamp createdAt;

    // Joined fields
    private String propertyTitle;
    private String propertyLocation;
    private String propertyCity;
    private String propertyPrice;
    private String propertyImageUrl;
    private String customerName;
    private String customerEmail;
    private String customerPhone;
    private int sellerId;
    private String sellerName;

    public Inquiry() {
        this.status = Status.OPEN;
    }

    public int getInquiryId() { return inquiryId; }
    public void setInquiryId(int inquiryId) { this.inquiryId = inquiryId; }

    public int getPropertyId() { return propertyId; }
    public void setPropertyId(int propertyId) { this.propertyId = propertyId; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getContactPhone() { return contactPhone; }
    public void setContactPhone(String contactPhone) { this.contactPhone = contactPhone; }

    public Date getPreferredVisitDate() { return preferredVisitDate; }
    public void setPreferredVisitDate(Date preferredVisitDate) { this.preferredVisitDate = preferredVisitDate; }

    public Status getStatus() { return status; }
    public void setStatus(Status status) { this.status = status; }

    public String getSellerReply() { return sellerReply; }
    public void setSellerReply(String sellerReply) { this.sellerReply = sellerReply; }

    public Timestamp getRepliedAt() { return repliedAt; }
    public void setRepliedAt(Timestamp repliedAt) { this.repliedAt = repliedAt; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public String getPropertyTitle() { return propertyTitle; }
    public void setPropertyTitle(String propertyTitle) { this.propertyTitle = propertyTitle; }

    public String getPropertyLocation() { return propertyLocation; }
    public void setPropertyLocation(String propertyLocation) { this.propertyLocation = propertyLocation; }

    public String getPropertyCity() { return propertyCity; }
    public void setPropertyCity(String propertyCity) { this.propertyCity = propertyCity; }

    public String getPropertyPrice() { return propertyPrice; }
    public void setPropertyPrice(String propertyPrice) { this.propertyPrice = propertyPrice; }

    public String getPropertyImageUrl() { return propertyImageUrl; }
    public void setPropertyImageUrl(String propertyImageUrl) { this.propertyImageUrl = propertyImageUrl; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getCustomerEmail() { return customerEmail; }
    public void setCustomerEmail(String customerEmail) { this.customerEmail = customerEmail; }

    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }

    public int getSellerId() { return sellerId; }
    public void setSellerId(int sellerId) { this.sellerId = sellerId; }

    public String getSellerName() { return sellerName; }
    public void setSellerName(String sellerName) { this.sellerName = sellerName; }
}
