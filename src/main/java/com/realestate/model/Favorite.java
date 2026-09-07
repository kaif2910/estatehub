package com.realestate.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Favorite implements Serializable {
    private static final long serialVersionUID = 1L;

    private int favoriteId;
    private int userId;
    private int propertyId;
    private Timestamp createdAt;

    // Joined property
    private Property property;

    public Favorite() {}

    public Favorite(int favoriteId, int userId, int propertyId) {
        this.favoriteId = favoriteId;
        this.userId = userId;
        this.propertyId = propertyId;
    }

    public int getFavoriteId() { return favoriteId; }
    public void setFavoriteId(int favoriteId) { this.favoriteId = favoriteId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getPropertyId() { return propertyId; }
    public void setPropertyId(int propertyId) { this.propertyId = propertyId; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Property getProperty() { return property; }
    public void setProperty(Property property) { this.property = property; }
}
