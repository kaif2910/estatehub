package com.realestate.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

public class Preference implements Serializable {
    private static final long serialVersionUID = 1L;

    public enum PurposePreference { SALE, RENT, ANY }

    private int preferenceId;
    private int userId;
    private String preferredLocation;
    private String preferredCity;
    private BigDecimal minPrice;
    private BigDecimal maxPrice;
    private Integer categoryId;
    private Integer preferredBedrooms;
    private BigDecimal preferredAreaSqft;
    private PurposePreference preferredPurpose;
    private Timestamp updatedAt;

    // Joined category name
    private String categoryName;

    public Preference() {
        this.minPrice = BigDecimal.ZERO;
        this.maxPrice = new BigDecimal("5000000");
        this.preferredPurpose = PurposePreference.ANY;
    }

    public int getPreferenceId() { return preferenceId; }
    public void setPreferenceId(int preferenceId) { this.preferenceId = preferenceId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getPreferredLocation() { return preferredLocation; }
    public void setPreferredLocation(String preferredLocation) { this.preferredLocation = preferredLocation; }

    public String getPreferredCity() { return preferredCity; }
    public void setPreferredCity(String preferredCity) { this.preferredCity = preferredCity; }

    public BigDecimal getMinPrice() { return minPrice; }
    public void setMinPrice(BigDecimal minPrice) { this.minPrice = minPrice; }

    public BigDecimal getMaxPrice() { return maxPrice; }
    public void setMaxPrice(BigDecimal maxPrice) { this.maxPrice = maxPrice; }

    public Integer getCategoryId() { return categoryId; }
    public void setCategoryId(Integer categoryId) { this.categoryId = categoryId; }

    public Integer getPreferredBedrooms() { return preferredBedrooms; }
    public void setPreferredBedrooms(Integer preferredBedrooms) { this.preferredBedrooms = preferredBedrooms; }

    public BigDecimal getPreferredAreaSqft() { return preferredAreaSqft; }
    public void setPreferredAreaSqft(BigDecimal preferredAreaSqft) { this.preferredAreaSqft = preferredAreaSqft; }

    public PurposePreference getPreferredPurpose() { return preferredPurpose; }
    public void setPreferredPurpose(PurposePreference preferredPurpose) { this.preferredPurpose = preferredPurpose; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }

    public String getCategoryName() { return categoryName; }
    public void setCategoryName(String categoryName) { this.categoryName = categoryName; }
}
