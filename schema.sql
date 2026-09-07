-- ==========================================================
-- EstateHub — Real Estate Marketplace & Recommendation System
-- Database Schema: real_estate_marketplace (MySQL 8)
-- ==========================================================



-- 1. USERS TABLE
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    role ENUM('CUSTOMER', 'SELLER', 'BROKER', 'ADMIN') NOT NULL DEFAULT 'CUSTOMER',
    status ENUM('ACTIVE', 'SUSPENDED', 'PENDING') NOT NULL DEFAULT 'ACTIVE',
    email_verified BOOLEAN NOT NULL DEFAULT FALSE,
    whatsapp_number VARCHAR(20) NULL,
    verification_status ENUM('UNVERIFIED', 'PENDING', 'VERIFIED', 'REJECTED') NOT NULL DEFAULT 'UNVERIFIED',
    verification_rejection_reason TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_user_email (email),
    INDEX idx_user_role (role),
    INDEX idx_user_verification (verification_status)
) ENGINE=InnoDB;

-- 2. OTP VERIFICATIONS TABLE
CREATE TABLE otp_verifications (
    otp_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    otp_code VARCHAR(6) NOT NULL,
    purpose ENUM('REGISTRATION', 'PASSWORD_RESET', 'PHONE_UPDATE') NOT NULL DEFAULT 'REGISTRATION',
    is_used BOOLEAN NOT NULL DEFAULT FALSE,
    expires_at DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_otp_lookup (user_id, otp_code, is_used)
) ENGINE=InnoDB;

-- 3. PROPERTY CATEGORIES TABLE
CREATE TABLE property_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    slug VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255) NULL,
    icon_class VARCHAR(50) NULL DEFAULT 'bi-building',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- 4. PROPERTIES TABLE
CREATE TABLE properties (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(14, 2) NOT NULL,
    location VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    purpose ENUM('SALE', 'RENT') NOT NULL DEFAULT 'SALE',
    area_sqft DECIMAL(10, 2) NOT NULL,
    bedrooms INT NOT NULL DEFAULT 1,
    bathrooms INT NOT NULL DEFAULT 1,
    furnishing ENUM('UNFURNISHED', 'SEMI_FURNISHED', 'FULLY_FURNISHED') NOT NULL DEFAULT 'UNFURNISHED',
    availability ENUM('IMMEDIATE', 'WITHIN_15_DAYS', 'WITHIN_30_DAYS', 'AFTER_30_DAYS') NOT NULL DEFAULT 'IMMEDIATE',
    property_status ENUM('AVAILABLE', 'SOLD', 'RENTED') NOT NULL DEFAULT 'AVAILABLE',
    verification_status ENUM('PENDING', 'VERIFIED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
    rejection_reason TEXT NULL,
    is_featured BOOLEAN NOT NULL DEFAULT FALSE,
    view_count INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES property_categories(category_id) ON DELETE RESTRICT,
    INDEX idx_prop_search (city, purpose, verification_status, property_status),
    INDEX idx_prop_price (price),
    INDEX idx_prop_bedrooms (bedrooms),
    INDEX idx_prop_area (area_sqft),
    INDEX idx_prop_verification (verification_status)
) ENGINE=InnoDB;

-- 5. PROPERTY IMAGES TABLE
CREATE TABLE property_images (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    image_url VARCHAR(500) NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    INDEX idx_image_property (property_id, is_primary)
) ENGINE=InnoDB;

-- 6. VERIFICATION REQUESTS (SELLER / BROKER)
CREATE TABLE verification_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    business_name VARCHAR(150) NULL,
    license_number VARCHAR(100) NULL,
    tax_id_or_pan VARCHAR(100) NULL,
    status ENUM('PENDING', 'APPROVED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
    admin_notes TEXT NULL,
    reviewed_by INT NULL,
    reviewed_at DATETIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_by) REFERENCES users(user_id) ON DELETE SET NULL,
    INDEX idx_verification_user (user_id, status)
) ENGINE=InnoDB;

-- 7. VERIFICATION DOCUMENTS TABLE
CREATE TABLE verification_documents (
    document_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT NOT NULL,
    document_type ENUM('GOVT_ID', 'BROKER_LICENSE', 'PROPERTY_TITLE_DEED', 'BUSINESS_REGISTRATION', 'UTILITY_BILL') NOT NULL,
    file_path VARCHAR(500) NOT NULL,
    original_file_name VARCHAR(255) NOT NULL,
    file_size_kb INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (request_id) REFERENCES verification_requests(request_id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 8. FAVORITES TABLE
CREATE TABLE favorites (
    favorite_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    UNIQUE KEY uk_user_property_fav (user_id, property_id)
) ENGINE=InnoDB;

-- 9. INQUIRIES TABLE
CREATE TABLE inquiries (
    inquiry_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    customer_id INT NOT NULL,
    message TEXT NOT NULL,
    contact_phone VARCHAR(20) NULL,
    preferred_visit_date DATE NULL,
    status ENUM('OPEN', 'RESPONDED', 'CLOSED') NOT NULL DEFAULT 'OPEN',
    seller_reply TEXT NULL,
    replied_at DATETIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_inq_property (property_id),
    INDEX idx_inq_customer (customer_id)
) ENGINE=InnoDB;

-- 10. USER PREFERENCES TABLE (FOR RECOMMENDATION ENGINE)
CREATE TABLE user_preferences (
    preference_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    preferred_location VARCHAR(200) NULL,
    preferred_city VARCHAR(100) NULL,
    min_price DECIMAL(14, 2) NOT NULL DEFAULT 0,
    max_price DECIMAL(14, 2) NOT NULL DEFAULT 10000000,
    category_id INT NULL,
    preferred_bedrooms INT NULL,
    preferred_area_sqft DECIMAL(10, 2) NULL,
    preferred_purpose ENUM('SALE', 'RENT', 'ANY') NOT NULL DEFAULT 'ANY',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES property_categories(category_id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- 11. CONVERSATIONS TABLE (INTERNAL CHAT)
CREATE TABLE conversations (
    conversation_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT NOT NULL,
    customer_id INT NOT NULL,
    provider_id INT NOT NULL, -- Seller or Broker
    status ENUM('ACTIVE', 'ARCHIVED', 'BLOCKED') NOT NULL DEFAULT 'ACTIVE',
    last_message_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (provider_id) REFERENCES users(user_id) ON DELETE CASCADE,
    UNIQUE KEY uk_chat_participants (property_id, customer_id, provider_id)
) ENGINE=InnoDB;

-- 12. MESSAGES TABLE
CREATE TABLE messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    conversation_id INT NOT NULL,
    sender_id INT NOT NULL,
    message_text TEXT NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (conversation_id) REFERENCES conversations(conversation_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    INDEX idx_conv_msg (conversation_id, created_at)
) ENGINE=InnoDB;

-- 13. PROPERTY VIEWS TRACKING
CREATE TABLE property_views (
    view_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    property_id INT NOT NULL,
    ip_address VARCHAR(45) NULL,
    viewed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    INDEX idx_view_user (user_id, viewed_at),
    INDEX idx_view_prop (property_id)
) ENGINE=InnoDB;
