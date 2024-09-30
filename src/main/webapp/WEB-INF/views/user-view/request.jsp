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
        .status-approved {
            color: green;
        }
        .status-pending {
            color: red;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="my-4 text-center">Các bài đăng công việc bạn đã ứng tuyển</h2>
    
    <div class="row">
        <!-- Hiển thị các bài đăng đã duyệt (ACapplyPosts) -->
        <c:forEach var="post" items="${ACappliedPosts}">
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
                                <!-- Thêm thông báo trạng thái -->
                                <p class="status-approved">Trạng thái: Đã duyệt</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <span class="text-muted">Lương: ${post.salary} VND</span>
                        <!-- Nút để mở modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal${post.id}">
                            Xem chi tiết
                        </button>
                    </div>
                </div>
            </div>

            <!-- Modal hiển thị thông tin chi tiết -->
            <div class="modal fade" id="postModal${post.id}" tabindex="-1" role="dialog" aria-labelledby="postModalLabel${post.id}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="postModalLabel${post.id}">${post.title}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p><strong>Mô tả công việc:</strong> ${post.description}</p>
                            <p><strong>Kinh nghiệm yêu cầu:</strong> ${post.exp}</p>
                            <p><strong>Địa chỉ:</strong> ${post.address}</p>
                            <p><strong>Hạn ứng tuyển:</strong> ${post.deadline}</p>
                            <p><strong>Lương:</strong> ${post.salary} VND</p>
                            <p><strong>Loại công việc:</strong> ${post.type}</p>
                            <p><strong>Danh mục:</strong> ${post.category}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Hiển thị các bài đăng chưa duyệt (NOTRDappliedPosts) -->
        <c:forEach var="post" items="${NOTRDappliedPosts}">
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
                                <!-- Thêm thông báo trạng thái -->
                                <p class="status-pending">Trạng thái: Chưa duyệt</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <span class="text-muted">Lương: ${post.salary} VND</span>
                        <!-- Nút để mở modal -->
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postModal${post.id}">
                            Xem chi tiết
                        </button>
                    </div>
                </div>
            </div>

            <!-- Modal hiển thị thông tin chi tiết -->
            <div class="modal fade" id="postModal${post.id}" tabindex="-1" role="dialog" aria-labelledby="postModalLabel${post.id}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="postModalLabel${post.id}">${post.title}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p><strong>Mô tả công việc:</strong> ${post.description}</p>
                            <p><strong>Kinh nghiệm yêu cầu:</strong> ${post.exp}</p>
                            <p><strong>Địa chỉ:</strong> ${post.address}</p>
                            <p><strong>Hạn ứng tuyển:</strong> ${post.deadline}</p>
                            <p><strong>Lương:</strong> ${post.salary} VND</p>
                            <p><strong>Loại công việc:</strong> ${post.type}</p>
                            <p><strong>Danh mục:</strong> ${post.category}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
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
