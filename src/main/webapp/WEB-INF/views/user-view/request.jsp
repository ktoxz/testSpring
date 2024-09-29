<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Các bài đăng đã ứng tuyển</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* Tạo khoảng cách giữa các card */
        .job-card {
            margin-bottom: 20px;
        }
        .company-logo {
            max-height: 100px;
            object-fit: cover;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .card-description {
            max-height: 60px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="my-4 text-center">Các bài đăng công việc bạn đã ứng tuyển</h2>
    
    <div class="row">
        <!-- Sử dụng c:forEach để hiển thị danh sách bài đăng -->
        <c:forEach var="post" items="${appliedPosts}">
            <div class="col-md-6 job-card">
                <div class="card shadow-sm">
                    <div class="row no-gutters">
                        <div class="col-md-4 text-center p-3">
                            <img src="https://healthjade.net/wp-content/uploads/2017/09/kiwi-fruit.jpg" class="company-logo" alt="Company Logo">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">${post.title}</h5>
                                <p class="card-description">${post.description}</p>
                                <p class="text-muted">${post.getCompanyName()} - ${post.address}</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <span class="text-muted">Lương: ${post.getSalary()} VND</span>
                        <a href="<%=request.getContextPath()%>/jobPostings/details?id=${post.id}" class="btn btn-primary">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<!-- Bootstrap JS và các plugin cần thiết -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
