<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.model.User" %>
<%@ page import="com.example.model.Company" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    User user = (User) session.getAttribute("user");
    Company company = (Company) session.getAttribute("company"); // Assuming company object is stored in session
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thay Đổi Thông Tin Cá Nhân và Công Ty</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 0 auto;
        }
        .form-container {
            width: 48%;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="tel"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group textarea {
            resize: vertical;
        }
        .btn {
            background-color: #5cb85c;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Form cập nhật thông tin cá nhân -->
        <div class="form-container">
            <h2>Thay Đổi Thông Tin Cá Nhân</h2>
            <form action="/springmvc/user/update-profile" method="post">
                <div class="form-group">
                    <label for="email">Email cá nhân:</label>
                    <input type="email" id="email" name="email" value="<%= user != null ? user.getEmail() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="fullName">Họ và tên:</label>
                    <input type="text" id="fullName" name="fullName" value="<%= user != null ? user.getFullName() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="address">Địa chỉ thường trú:</label>
                    <input type="text" id="address" name="address" value="<%= user != null ? user.getAddress() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="tel" id="phone" name="phone" value="<%= user != null ? user.getPhoneNumber() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="description">Mô tả bản thân:</label>
                    <textarea id="description" name="description" rows="4"><%= user != null ? user.getDescription() : "" %></textarea>
                </div>
                <button type="submit" class="btn">Cập nhật thông tin cá nhân</button>
            </form>
        </div>

        <!-- Form cập nhật thông tin công ty -->
        <div class="form-container">
            <h2>Cập Nhật Thông Tin Công Ty</h2>
            <form action="/springmvc/company/update-profile" method="post">
                <div class="form-group">
                    <label for="nameCompany">Tên Công Ty:</label>
                    <input type="text" id="nameCompany" name="nameCompany" value="<%= company != null ? company.getNameCompany() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="companyEmail">Email Công Ty:</label>
                    <input type="email" id="companyEmail" name="companyEmail" value="<%= company != null ? company.getEmail() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="companyPhone">Số Điện Thoại Công Ty:</label>
                    <input type="tel" id="companyPhone" name="companyPhone" value="<%= company != null ? company.getPhoneNumber() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="companyAddress">Địa Chỉ Công Ty:</label>
                    <input type="text" id="companyAddress" name="companyAddress" value="<%= company != null ? company.getAddress() : "" %>" required>
                </div>
                <div class="form-group">
                    <label for="companyDescription">Mô Tả Công Ty:</label>
                    <textarea id="companyDescription" name="companyDescription" rows="4"><%= company != null ? company.getDescription() : "" %></textarea>
                </div>
                <button type="submit" class="btn">Cập nhật thông tin công ty</button>
            </form>
        </div>
    </div>
</body>
</html>
