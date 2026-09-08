package com.realestate.model;

import java.io.Serializable;

public class SessionUser implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private int userId;
    private String name;
    private String email;
    private User.Role role;
    private String phone;
    private String verificationStatus;
    
    public SessionUser(User user) {
        this.userId = user.getUserId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.role = user.getRole();
        this.phone = user.getPhone();
        this.verificationStatus = user.getVerificationStatus() != null ? user.getVerificationStatus().name() : null;
    }
    
    public int getUserId() { return userId; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public User.Role getRole() { return role; }
    public String getPhone() { return phone; }
    public String getVerificationStatus() { return verificationStatus; }
}
