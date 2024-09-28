<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách bài đăng của công ty</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .job-listing-container {
            margin: 20px;
        }
        .job-card {
            background: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .job-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .job-type {
            color: #007bff; /* Màu cho loại công việc */
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container job-listing-container">
        <h1 class="text-center mb-4">Danh sách bài đăng</h1>

        <!-- Danh sách bài đăng -->
        <c:forEach var="post" items="${postList}">
		    <div class="job-card">
		        <div class="job-type">${post.type}</div>
		        <div class="job-title">${post.title}</div>
		        <div class="company">Company ID: ${post.companyId}</div>
		        <div class="location">Địa chỉ: ${post.address}</div>
		        <div class="action-buttons">
		            <button class="btn btn-info btn-sm">Xem chi tiết</button>
		            <button class="btn btn-warning btn-sm">Cập nhật</button>
		            <button class="btn btn-danger btn-sm">Xóa</button>
		        </div>
		    </div>
		</c:forEach>


        <!-- Nút mở modal để thêm bài đăng -->
        <button class="btn btn-primary" data-toggle="modal" data-target="#addJobModal">Thêm bài đăng</button>
    </div>

    <!-- Modal thêm bài đăng -->
    <div class="modal fade" id="addJobModal" tabindex="-1" role="dialog" aria-labelledby="addJobModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addJobModalLabel">Thêm bài đăng mới</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="<%=request.getContextPath()%>/company/addJob" method="post">
					    <div class="form-group">
					        <label for="title">Tiêu đề</label>
					        <input type="text" class="form-control" id="title" name="title" required>
					    </div>
					    <div class="form-group">
					        <label for="description">Mô tả công việc</label>
					        <textarea class="form-control" id="description" name="description" required></textarea>
					    </div>
					    <div class="form-group">
					        <label for="experience">Kinh nghiệm</label>
					        <input type="text" class="form-control" id="experience" name="experience" required>
					    </div>
					    <div class="form-group">
					        <label for="quantity">Số người cần tuyển</label>
					        <input type="number" class="form-control" id="quantity" name="quantity" required>
					    </div>
					    <div class="form-group">
					        <label for="address">Địa chỉ</label>
					        <input type="text" class="form-control" id="address" name="address" required>
					    </div>
					    <div class="form-group">
					        <label for="deadline">Hạn ứng tuyển</label>
					        <input type="date" class="form-control" id="deadline" name="deadline" required>
					    </div>
					    <div class="form-group">
					        <label for="salary">Lương</label>
					        <input type="text" class="form-control" id="salary" name="salary" required>
					    </div>
					    <div class="form-group">
					        <label for="type">Loại công việc</label>
					        <select class="form-control" id="type" name="type" required>
					            <option value="fulltime">Fulltime</option>
					            <option value="parttime">Parttime</option>
					            <option value="freelancer">Freelancer</option>
					        </select>
					    </div>
					    <div class="form-group">
					        <label for="category">Danh mục công việc</label>
					        <input type="text" class="form-control" id="category" name="category" required>
					    </div>
					    <button type="submit" class="btn btn-success">Lưu</button>
					</form>

                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
