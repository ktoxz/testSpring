package com.example.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private int id;
    private String address;
    private String description;
    private String email;
    private String fullName;
    private String image;
    private String password;
    private String phoneNumber;
    private int roleId;
    private Boolean status;
    private String roleName;

    // Constructor đầy đủ
    public User(int id, String address, String description, String email, String fullName, String image,
                String password, String phoneNumber, int roleId, Boolean status) {
        this.id = id;
        this.address = address;
        this.description = description;
        this.email = email;
        this.fullName = fullName;
        this.image = image;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.roleId = roleId;
        this.status = status;
        this.roleName = Role.getNameById(roleId);  // Assuming Role.getNameById exists
    }

 // Constructor từ ResultSet (khi lấy dữ liệu từ database)
    public User(ResultSet rs) throws SQLException {
        this.id = rs.getInt("id");
        
        // Kiểm tra và xử lý các giá trị có thể null
        this.address = rs.getString("address") != null ? rs.getString("address") : "";
        this.description = rs.getString("description") != null ? rs.getString("description") : "";
        this.email = rs.getString("email");
        this.fullName = rs.getString("full_name") != null ? rs.getString("full_name") : "";
        this.image = rs.getString("image") != null ? rs.getString("image") : "";
        this.password = rs.getString("password");
        this.phoneNumber = rs.getString("phone_number") != null ? rs.getString("phone_number") : "";
        
        // Trường status cần kiểm tra null một cách đặc biệt vì nó là Boolean
        if (rs.getObject("status") != null) {
            this.status = rs.getBoolean("status");
        } else {
            this.status = null;  // Status có thể là null
        }

        this.roleId = rs.getInt("role_id");
        this.roleName = Role.getNameById(roleId);  // Assuming Role.getNameById exists
    }


    // Getter và Setter cho từng thuộc tính
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getRoleName() {
        return roleName;
    }
}
