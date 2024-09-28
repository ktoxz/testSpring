package com.example.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class Post {
    private int id;
    private String title;
    private String description;
    private String exp;
    private int hire;
    private String address;
    private Date deadline;
    private double salary;
    private String type;
    private String category;
    private int companyId;
    private int userId;

    // Constructor đầy đủ
    public Post(int id, String title, String description, String exp, int hire, String address, 
                Date deadline, double salary, String type, String category, int companyId, int userId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.exp = exp;
        this.hire = hire;
        this.address = address;
        this.deadline = deadline;
        this.salary = salary;
        this.type = type;
        this.category = category;
        this.companyId = companyId;
        this.userId = userId;
    }

    // Constructor từ ResultSet
    public Post(ResultSet rs) throws SQLException {
        this.id = rs.getInt("id");
        this.title = rs.getString("title");
        this.description = rs.getString("description");
        this.exp = rs.getString("exp");
        this.hire = rs.getInt("hire");
        this.address = rs.getString("address");
        this.deadline = rs.getDate("deadline");
        this.salary = rs.getDouble("salary");
        this.type = rs.getString("type");
        this.category = rs.getString("category");
        this.companyId = rs.getInt("company_id");
        this.userId = rs.getInt("user_id");
    }

    // Getter và Setter cho từng thuộc tính
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getExp() {
        return exp;
    }

    public void setExp(String exp) {
        this.exp = exp;
    }

    public int getHire() {
        return hire;
    }

    public void setHire(int hire) {
        this.hire = hire;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
