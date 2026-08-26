<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ</title>
</head>
<body style="font-family: Arial, sans-serif; padding: 30px;">
    <h2>Chào mừng đến với trang chủ!</h2>
    <p>Hệ thống hoạt động với kiến trúc 3 tầng và Tomcat 11.</p>
    <a href="${pageContext.request.contextPath}/login" style="font-size: 18px; color: blue;">Đăng nhập (Login)</a>
    <p><a href="${pageContext.request.contextPath}/admin/categories" style="font-weight: bold; color: green;">👉 Quản lý Danh mục (CRUD Category)</a></p>
</body>
</html>