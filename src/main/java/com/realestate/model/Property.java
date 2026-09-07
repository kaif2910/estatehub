package com.realestate.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Property implements Serializable {
    private static final long serialVersionUID = 1L;

    public enum Purpose { SALE, RENT }
    public enum Furnishing { UNFURNISHED, SEMI_FURNISHED, FULLY_FURNISHED }
    public enum Availability { IMMEDIATE, WITHIN_15_DAYS, WITHIN_30_DAYS, AFTER_30_DAYS }
    public enum PropertyStatus { AVAILABLE, SOLD, RENTED }
    public enum VerificationStatus { PENDING, VERIFIED, REJECTED }

    private int propertyId;
    private int userId;
    private int categoryId;
    private String title;
    private String description;
    private BigDecimal price;
    private String location;
    private String city;
    private String state;
    private Purpose purpose;
    private BigDecimal areaSqft;
    private int bedrooms;
    private int bathrooms;
    private Furnishing furnishing;
    private Availability availability;
    private PropertyStatus propertyStatus;
    private VerificationStatus verificationStatus;
    private String rejectionReason;
    private boolean isFeatured;
    private int viewCount;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Joined helper fields
    private String categoryName;
    private String ownerName;
    private String ownerEmail;
    private String ownerPhone;
    private String ownerWhatsapp;
    private User.Role ownerRole;
    private User.VerificationStatus ownerVerificationStatus;
    private String primaryImageUrl;
    private List<PropertyImage> images = new ArrayList<>();
    private boolean isFavoriteByUser;

    public Property() {
        this.purpose = Purpose.SALE;
        this.furnishing = Furnishing.UNFURNISHED;
        this.availability = Availability.IMMEDIATE;
        this.propertyStatus = PropertyStatus.AVAILABLE;
        this.verificationStatus = VerificationStatus.PENDING;
    }

    // Getters and Setters
    public int getPropertyId() { return propertyId; }
    public void setPropertyId(int propertyId) { this.propertyId = propertyId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public Purpose getPurpose() { return purpose; }
    public void setPurpose(Purpose purpose) { this.purpose = purpose; }

    public BigDecimal getAreaSqft() { return areaSqft; }
    public void setAreaSqft(BigDecimal areaSqft) { this.areaSqft = areaSqft; }

    public int getBedrooms() { return bedrooms; }
    public void setBedrooms(int bedrooms) { this.bedrooms = bedrooms; }

    public int getBathrooms() { return bathrooms; }
    public void setBathrooms(int bathrooms) { this.bathrooms = bathrooms; }

    public Furnishing getFurnishing() { return furnishing; }
    public void setFurnishing(Furnishing furnishing) { this.furnishing = furnishing; }

    public Availability getAvailability() { return availability; }
    public void setAvailability(Availability availability) { this.availability = availability; }

    public PropertyStatus getPropertyStatus() { return propertyStatus; }
    public void setPropertyStatus(PropertyStatus propertyStatus) { this.propertyStatus = propertyStatus; }

    public VerificationStatus getVerificationStatus() { return verificationStatus; }
    public void setVerificationStatus(VerificationStatus verificationStatus) { this.verificationStatus = verificationStatus; }

    public String getRejectionReason() { return rejectionReason; }
    public void setRejectionReason(String rejectionReason) { this.rejectionReason = rejectionReason; }

    public boolean isFeatured() { return isFeatured; }
    public void setFeatured(boolean featured) { isFeatured = featured; }

    public int getViewCount() { return viewCount; }
    public void setViewCount(int viewCount) { this.viewCount = viewCount; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }

    public String getOwnerName() { return ownerName; }
    public void setOwnerName(String ownerName) { this.ownerName = ownerName; }

    public String getOwnerEmail() { return ownerEmail; }
    public void setOwnerEmail(String ownerEmail) { this.ownerEmail = ownerEmail; }

    public String getOwnerPhone() { return ownerPhone; }
    public void setOwnerPhone(String ownerPhone) { this.ownerPhone = ownerPhone; }

    public String getOwnerWhatsapp() { return ownerWhatsapp; }
    public void setOwnerWhatsapp(String ownerWhatsapp) { this.ownerWhatsapp = ownerWhatsapp; }

    public User.Role getOwnerRole() { return ownerRole; }
    public void setOwnerRole(User.Role ownerRole) { this.ownerRole = ownerRole; }

    public User.VerificationStatus getOwnerVerificationStatus() { return ownerVerificationStatus; }
    public void setOwnerVerificationStatus(User.VerificationStatus ownerVerificationStatus) { this.ownerVerificationStatus = ownerVerificationStatus; }

    public String getPrimaryImageUrl() {
        if (primaryImageUrl != null && !primaryImageUrl.isEmpty()) return primaryImageUrl;
        if (images != null && !images.isEmpty()) return images.get(0).getImageUrl();
        return "https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=800&q=80";
    }
    public void setPrimaryImageUrl(String primaryImageUrl) { this.primaryImageUrl = primaryImageUrl; }

    public List<PropertyImage> getImages() { return images; }
    public void setImages(List<PropertyImage> images) { this.images = images; }

    public boolean isFavoriteByUser() { return isFavoriteByUser; }
    public void setFavoriteByUser(boolean favoriteByUser) { isFavoriteByUser = favoriteByUser; }

    public boolean isVerifiedBadge() {
        return this.verificationStatus == VerificationStatus.VERIFIED;
    }
}
