package com.realestate.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class PropertyImage implements Serializable {
    private static final long serialVersionUID = 1L;

    private int imageId;
    private int propertyId;
    private String imageUrl;
    private String fileName;
    private boolean isPrimary;
    private Timestamp createdAt;

    public PropertyImage() {}

    public PropertyImage(int imageId, int propertyId, String imageUrl, String fileName, boolean isPrimary) {
        this.imageId = imageId;
        this.propertyId = propertyId;
        this.imageUrl = imageUrl;
        this.fileName = fileName;
        this.isPrimary = isPrimary;
    }

    public int getImageId() { return imageId; }
    public void setImageId(int imageId) { this.imageId = imageId; }

    public int getPropertyId() { return propertyId; }
    public void setPropertyId(int propertyId) { this.propertyId = propertyId; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }

    public boolean isPrimary() { return isPrimary; }
    public void setPrimary(boolean primary) { isPrimary = primary; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
