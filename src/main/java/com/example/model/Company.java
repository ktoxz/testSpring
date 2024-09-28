package com.example.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Company {
    private int id;
    private String address;
    private String description;
    private String email;
    private String logo;
    private String nameCompany;
    private String phoneNumber;
    private int status;
    private int userId;

    // Constructor đầy đủ
    public Company(int id, String address, String description, String email, String logo,
                   String nameCompany, String phoneNumber, int status, int userId) {
        this.id = id;
        this.address = address;
        this.description = description;
        this.email = email;
        this.logo = logo;
        this.nameCompany = nameCompany;
        this.phoneNumber = phoneNumber;
        this.status = status;
        this.userId = userId;
    }

    // Constructor từ ResultSet (khi lấy dữ liệu từ database)
    public Company(ResultSet rs) throws SQLException {
        this.id = rs.getInt("id");

        // Kiểm tra và xử lý các giá trị có thể null
        this.address = rs.getString("address") != null ? rs.getString("address") : "";
        this.description = rs.getString("description") != null ? rs.getString("description") : "";
        this.email = rs.getString("email") != null ? rs.getString("email") : "";
        this.logo = rs.getString("logo") != null ? rs.getString("logo") : "";
        this.nameCompany = rs.getString("name_company") != null ? rs.getString("name_company") : "";
        this.phoneNumber = rs.getString("phone_number") != null ? rs.getString("phone_number") : "";
        this.status = rs.getInt("status");
        this.userId = rs.getInt("user_id");
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

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getNameCompany() {
        return nameCompany;
    }

    public void setNameCompany(String nameCompany) {
        this.nameCompany = nameCompany;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
