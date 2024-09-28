<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Seeker Home</title>
    <!-- Add your CSS stylesheets and other head elements here -->
</head>
<body>

    <h2>Tìm việc làm</h2>

    <!-- Display user information, you can customize this part based on your needs -->
    <c:choose>
	     <c:when test="${empty user}">
	        <button><a href = "<%=request.getContextPath()%>/page/register">Đăng ký</a></button>
	        <button><a href = "<%=request.getContextPath()%>/page/login">Đăng nhập</a></button>
	    </c:when>
	    <c:otherwise>
    		<p>Hello ${user.getFullName()}</p>
    	</c:otherwise>
    </c:choose>
    	
    <c:if test = "${not empty msg}">
    	<p>${msg}</p>
    </c:if>
	<br>
	
	<form action="<%=request.getContextPath()%>/jobPostings/search" method="post">
	    <label for="jobTitle">Job Title:</label>
	    <input type="text" id="jobTitle" name="jobTitle" />
	
	    <label for="companyName">Company Name:</label>
	    <input type="text" id="companyName" name="companyName" />
	
	    <label for="location">Location:</label>
	    <input type="text" id="location" name="location" />
	
	    <button type="submit">Search</button>
	</form>

    <!-- Logout link -->
    <c:if  test="${not empty user}">
    	<c:choose>
    		<c:when test = "${not empty company}">
    			<a href="<%=request.getContextPath()%>/company/page/profile">Hồ sơ</a>
    			<a href="<%=request.getContextPath()%>/company/page/posts">Danh sách bài đăng</a>
    		</c:when>
    		<c:otherwise>
    		    <a href="<%=request.getContextPath()%>/user/page/profile">Hồ sơ</a>
    		</c:otherwise>
    	</c:choose>
    	<a href="<%=request.getContextPath()%>/logout">Logout</a>
    </c:if>
    <!-- Add your additional content or links here -->

</body>
</html>
