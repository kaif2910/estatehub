package com.realestate.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class PropertyCategory implements Serializable {
    private static final long serialVersionUID = 1L;

    private int categoryId;
    private String name;
    private String slug;
    private String description;
    private String iconClass;
    private Timestamp createdAt;

    public PropertyCategory() {}

    public PropertyCategory(int categoryId, String name, String slug, String description, String iconClass) {
        this.categoryId = categoryId;
        this.name = name;
        this.slug = slug;
        this.description = description;
        this.iconClass = iconClass;
    }

    public int getCategoryId() { return categoryId; }
    public void setCategoryId(int categoryId) { this.categoryId = categoryId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getSlug() { return slug; }
    public void setSlug(String slug) { this.slug = slug; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getIconClass() { return iconClass; }
    public void setIconClass(String iconClass) { this.iconClass = iconClass; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
