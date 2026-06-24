package com.ats.project.model;

public class UserVO {
    private String userId;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String role;
    private String status;
    private String createdAt;

    public String getUserId()    { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getPassword()  { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getName()      { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail()     { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPhone()     { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getRole()      { return role; }
    public void setRole(String role) { this.role = role; }
    public String getStatus()    { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

}