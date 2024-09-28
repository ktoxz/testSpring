<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .register-container {
            width: 300px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-container input[type="text"],
        .register-container input[type="email"],
        .register-container input[type="password"],
        .register-container select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .register-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        .register-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Register</h2>
	    <c:if test="${not empty error}">
	        <div class="error">${error}</div>
	    </c:if>

        <form action="<%=request.getContextPath()%>/register" method="post">
            
            <!-- Họ và Tên -->
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
            
            <!-- Email -->
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <!-- Mật khẩu -->
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <!-- Nhập lại Mật khẩu -->
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            
            <!-- Vai trò -->
            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="1">User</option>
                <option value="3">Company</option>
            </select>
            
            <!-- Nút Đăng ký -->
            <input type="submit" value="Register">
        </form>
        <a href = "<%=request.getContextPath()%>/page/login">Đăng nhập</a>
    </div>
</body>
</html>
