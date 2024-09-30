<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Seeker Home</title>

    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Add custom CSS if necessary -->
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        h2 {
            margin-bottom: 20px;
        }
        .form-label {
            margin-top: 10px;
        }
        .header-buttons a {
            margin-right: 10px;
        }
        .job-listings {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Tìm việc làm</h2>

    <!-- Display user information or login/register buttons -->
    <div class="text-end header-buttons">
        <c:choose>
            <c:when test="${empty user}">
                <a href="<%=request.getContextPath()%>/page/register" class="btn btn-primary">Đăng ký</a>
                <a href="<%=request.getContextPath()%>/page/login" class="btn btn-secondary">Đăng nhập</a>
            </c:when>
            <c:otherwise>
                <!-- Dropdown for user actions -->
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                        Xin chào, <strong>${user.getFullName()}</strong>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
                        <c:choose>
                            <c:when test="${not empty company}">
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/company/page/profile">Hồ sơ công ty</a></li>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/company/page/posts">Danh sách bài đăng</a></li>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/company/page/requests">Xem đơn ứng tuyển</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user/page/profile">Hồ sơ cá nhân</a></li>
                                <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user/page/requests">Xem đơn ứng tuyển</a></li>
                            </c:otherwise>
                        </c:choose>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/logout">Đăng xuất</a></li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Display any message -->
    <c:if test="${not empty msg}">
        <div class="alert alert-info mt-3">
            ${msg}
        </div>
    </c:if>

    <!-- Search form with dropdown -->
    <div class="mt-4">
        <h4>Tìm kiếm công việc</h4>
        <form action="<%=request.getContextPath()%>/search" method="post" class="mt-3">
            <div class="mb-3">
                <label for="searchType" class="form-label">Tìm kiếm theo:</label>
                <select id="searchType" name="searchType" class="form-select" required>
                    <option value="" disabled selected>Chọn loại tìm kiếm</option>
                    <option value="title">Tiêu đề công việc</option>
                    <option value="company">Tên công ty</option>
                    <option value="location">Địa điểm</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="searchValue" class="form-label">Giá trị tìm kiếm:</label>
                <input type="text" id="searchValue" name="searchValue" class="form-control" placeholder="Nhập giá trị tìm kiếm" required>
            </div>
            <button type="submit" class="btn btn-success">Tìm kiếm</button>
        </form>
    </div>

    <!-- Job Listings (You can dynamically display jobs here using c:forEach) -->
    <div class="job-listings mt-5">
        <h4>Các công việc hiện có:</h4>
        <c:forEach var="post" items="${posts}">
		    <div class="card my-3">
		        <div class="card-body">
		            <h5 class="card-title">${post.title}</h5>
		            <p class="card-text">
		                <strong>Công ty:</strong> ${post.companyId} <br>
		                <strong>Địa điểm:</strong> ${post.address} <br>
		                <strong>Lương:</strong> ${post.salary} VNĐ <br>
		                <strong>Loại công việc:</strong> ${post.type} <br>
		                <strong>Hạn ứng tuyển:</strong> ${post.deadline} <br>
		            </p>
		            <!-- Nút Ứng tuyển ngay nếu không có công ty -->
		            <c:if test="${empty company}">
		                <a href="<%=request.getContextPath()%>/applicant/request?id=${post.id}" class="btn btn-primary">Ứng tuyển ngay</a>
		            </c:if>
		            <!-- Nút Xem chi tiết -->
		            <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#jobDetailModal${post.id}">
		                Xem chi tiết
		            </button>
		
		            <!-- Modal -->
		            <div class="modal fade" id="jobDetailModal${post.id}" tabindex="-1" aria-labelledby="jobDetailModalLabel" aria-hidden="true">
		                <div class="modal-dialog">
		                    <div class="modal-content">
		                        <div class="modal-header">
		                            <h5 class="modal-title" id="jobDetailModalLabel">${post.title}</h5>
		                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                        </div>
		                        <div class="modal-body">
		                            <strong>Mô tả:</strong> ${post.description} <br>
		                            <strong>Kinh nghiệm:</strong> ${post.exp} <br>
		                            <strong>Số lượng tuyển:</strong> ${post.hire} <br>
		                            <strong>Địa chỉ:</strong> ${post.address} <br>
		                            <strong>Hạn ứng tuyển:</strong> ${post.deadline} <br>
		                            <strong>Lương:</strong> ${post.salary} VNĐ <br>
		                            <strong>Loại công việc:</strong> ${post.type} <br>
		                            <strong>Danh mục:</strong> ${post.category} <br>
		                        </div>
		                        <div class="modal-footer">
		                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</c:forEach>

    </div>
</div>

<!-- Include Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>