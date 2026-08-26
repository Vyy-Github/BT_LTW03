<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lỗi Đăng Nhập</title>
</head>
<body style="font-family: Arial, sans-serif; padding: 30px;">
    <h2 style="color: red;">Đăng nhập thất bại!</h2>
    <p>Tài khoản hoặc mật khẩu không chính xác.</p>
    <a href="${pageContext.request.contextPath}/login" style="color: blue;">Thử đăng nhập lại</a> | 
    <a href="${pageContext.request.contextPath}/" style="color: blue;">Về trang chủ</a>
</body>
</html>