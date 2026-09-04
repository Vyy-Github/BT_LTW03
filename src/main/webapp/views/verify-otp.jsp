<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Xác thực OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5" style="max-width: 400px;">
    <div class="card shadow p-4 text-center">
        <h4>Nhập mã OTP</h4>
        <p class="text-muted">Mã xác thực đã được gửi tới email của bạn.</p>
        <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="${pageContext.request.contextPath}/verify-otp" method="post">
            <div class="mb-3">
                <input type="text" name="otp" class="form-control text-center fs-4" placeholder="6 chữ số" maxlength="6" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Kích hoạt tài khoản</button>
        </form>
    </div>
</div>
</body>
</html>