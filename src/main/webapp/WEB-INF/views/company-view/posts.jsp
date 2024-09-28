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
                <div class="deadline">Hạn ứng tuyển: ${post.deadline}</div>
                <div class="category">Danh mục: ${post.category}</div>
                <div class="action-buttons">
                    <!-- Nút Xem Chi Tiết -->
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#viewJobModal" 
                            onclick="setViewModal('${post.title}', '${post.description}', '${post.type}', '${post.salary}', '${post.deadline}', '${post.address}')">Xem chi tiết</button>
                    
                    <!-- Nút Cập Nhật -->
                    <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#updateJobModal"
                            onclick="setUpdateModal('${post.id}', '${post.title}', '${post.description}', '${post.type}', '${post.salary}', '${post.deadline}', '${post.address}', '${post.exp}', '${post.hire}', '${post.category}')">Cập nhật</button>
                    
                   <!-- Nút Xóa -->
            		<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteJobModal"
                    		onclick="setDeleteModal('${post.id}')">Xóa</button>
                </div>
            </div>
        </c:forEach>

        <!-- Nút mở modal để thêm bài đăng -->
        <button class="btn btn-primary" data-toggle="modal" data-target="#addJobModal">Thêm bài đăng</button>
    </div>

    <!-- Modal Xem Chi Tiết -->
    <div class="modal fade" id="viewJobModal" tabindex="-1" role="dialog" aria-labelledby="viewJobModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewJobModalLabel">Chi tiết công việc</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>Tiêu đề:</strong> <span id="viewTitle"></span></p>
                    <p><strong>Mô tả:</strong> <span id="viewDescription"></span></p>
                    <p><strong>Loại công việc:</strong> <span id="viewType"></span></p>
                    <p><strong>Lương:</strong> <span id="viewSalary"></span></p>
                    <p><strong>Hạn ứng tuyển:</strong> <span id="viewDeadline"></span></p>
                    <p><strong>Địa chỉ:</strong> <span id="viewAddress"></span></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Cập Nhật -->
    <div class="modal fade" id="updateJobModal" tabindex="-1" role="dialog" aria-labelledby="updateJobModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateJobModalLabel">Cập nhật công việc</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="updateJobForm" action="<%=request.getContextPath()%>/post/update" method="post">
                        <input type="hidden" id="updateId" name="id">
                        <div class="form-group">
                            <label for="updateTitle">Tiêu đề</label>
                            <input type="text" class="form-control" id="updateTitle" name="title" required>
                        </div>
                        <div class="form-group">
                            <label for="updateDescription">Mô tả công việc</label>
                            <textarea class="form-control" id="updateDescription" name="description" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="updateType">Loại công việc</label>
                            <select class="form-control" id="updateType" name="type" required>
                                <option value="fulltime">Fulltime</option>
                                <option value="parttime">Parttime</option>
                                <option value="freelancer">Freelancer</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="updateSalary">Lương</label>
                            <input type="text" class="form-control" id="updateSalary" name="salary" required>
                        </div>
                        <div class="form-group">
                            <label for="updateDeadline">Hạn ứng tuyển</label>
                            <input type="date" class="form-control" id="updateDeadline" name="deadline" required>
                        </div>
                        <div class="form-group">
                            <label for="updateAddress">Địa chỉ</label>
                            <input type="text" class="form-control" id="updateAddress" name="address" required>
                        </div>
                        <div class="form-group">
                            <label for="updateExperience">Kinh nghiệm</label>
                            <input type="text" class="form-control" id="updateExperience" name="experience" required>
                        </div>
                        <div class="form-group">
                            <label for="updateHire">Số người cần tuyển</label>
                            <input type="number" class="form-control" id="updateHire" name="quantity" required>
                        </div>
                        <div class="form-group">
                            <label for="updateCategory">Danh mục công việc</label>
                            <input type="text" class="form-control" id="updateCategory" name="category" required>
                        </div>
                        <button type="submit" class="btn btn-success">Lưu</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Thêm Bài Đăng -->
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
                            <label for="type">Loại công việc</label>
                            <select class="form-control" id="type" name="type" required>
                                <option value="fulltime">Fulltime</option>
                                <option value="parttime">Parttime</option>
                                <option value="freelancer">Freelancer</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="salary">Lương</label>
                            <input type="text" class="form-control" id="salary" name="salary" required>
                        </div>
                        <div class="form-group">
                            <label for="deadline">Hạn ứng tuyển</label>
                            <input type="date" class="form-control" id="deadline" name="deadline" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <input type="text" class="form-control" id="address" name="address" required>
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
                            <label for="category">Danh mục công việc</label>
                            <input type="text" class="form-control" id="category" name="category" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Thêm bài đăng</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	<!-- Modal Xác Nhận Xóa -->
	<div class="modal fade" id="deleteJobModal" tabindex="-1" role="dialog" aria-labelledby="deleteJobModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="deleteJobModalLabel">Xác nhận xóa</h5>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	                Bạn có chắc chắn muốn xóa bài đăng này không?
	            </div>
	            <div class="modal-footer">
	                <!-- Form để gửi yêu cầu xóa -->
	                <form action="<%=request.getContextPath()%>/post/delete" method="post">
	                    <!-- Trường ẩn chứa ID bài đăng -->
	                    <input type="hidden" id="deletePostId" name="id">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
	                    <button type="submit" class="btn btn-danger">Xóa</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
    <!-- JavaScript để truyền dữ liệu vào Modal -->
    <script>
        function setViewModal(title, description, type, salary, deadline, address) {
            document.getElementById('viewTitle').innerText = title;
            document.getElementById('viewDescription').innerText = description;
            document.getElementById('viewType').innerText = type;
            document.getElementById('viewSalary').innerText = salary;
            document.getElementById('viewDeadline').innerText = deadline;
            document.getElementById('viewAddress').innerText = address;
        }

        function setUpdateModal(id, title, description, type, salary, deadline, address, experience, hire, category) {
            document.getElementById('updateId').value = id;
            document.getElementById('updateTitle').value = title;
            document.getElementById('updateDescription').value = description;
            document.getElementById('updateType').value = type;
            document.getElementById('updateSalary').value = salary;
            document.getElementById('updateDeadline').value = deadline;
            document.getElementById('updateAddress').value = address;
            document.getElementById('updateExperience').value = experience;
            document.getElementById('updateHire').value = hire;
            document.getElementById('updateCategory').value = category;
        }
        
        function setDeleteModal(postId) {
            // Đặt giá trị ID của bài đăng vào trường ẩn trong modal
            document.getElementById('deletePostId').value = postId;
        }
    </script>

    <!-- Bootstrap and jQuery JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
