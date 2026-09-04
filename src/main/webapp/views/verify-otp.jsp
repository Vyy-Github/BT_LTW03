<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP - TechStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f6f8; min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: system-ui; }
        .auth-card { background: #fff; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); width: 100%; max-width: 400px; padding: 36px; }
        .otp-input { letter-spacing: 8px; font-size: 24px; text-align: center; font-weight: 700; }
        .btn-brand { background-color: #d70018; color: #fff; border-radius: 12px; font-weight: 700; padding: 10px; width: 100%; border: none; }
    </style>
</head>
<body>
<div class="auth-card text-center">
    <h4 class="fw-bold mb-1">Nhập mã OTP</h4>
    <p class="text-muted small mb-3">Mã gồm 6 chữ số đã được gửi qua email của bạn</p>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger py-2 small rounded-3 mb-3">${alert}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/verify-otp" method="post">
        <div class="mb-4">
            <input type="text" name="otp" class="form-control otp-input" maxlength="6" placeholder="------" required autofocus>
        </div>
        <button type="submit" class="btn btn-brand mb-3">XÁC THỰC</button>
    </form>
</div>
</body>
</html>