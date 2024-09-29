<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách ứng viên</title>
    <!-- Link Bootstrap -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="mt-4">Danh sách ứng viên ứng tuyển</h2>
        
        <c:forEach var="candidate" items="${candidates}">
            <div class="card mt-3">
                <div class="card-body d-flex align-items-center">
                    <!-- Ảnh đại diện -->
                    <div class="mr-3">
                        <img src="https://via.placeholder.com/100" alt="Avatar" class="rounded-circle">
                    </div>
                    <!-- Thông tin ứng viên -->
                    <div class="flex-grow-1">
                        <h5 class="card-title">${candidate.fullName}</h5>
                        <p class="card-text">${candidate.email}</p>
                    </div>
                    <!-- Nút xem CV và duyệt -->
                    <div>
                        <a href="" class="btn btn-primary mr-2">Xem CV</a>
                        <button class="btn btn-success">Duyệt</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Link Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
