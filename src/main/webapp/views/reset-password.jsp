<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu - TechStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body { background-color: #f4f6f8; min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: system-ui; }
        .auth-card { background: #fff; border-radius: 20px; box-shadow: 0 10px 30px rgba(0,0,0,0.06); width: 100%; max-width: 420px; padding: 36px; }
        .btn-brand { background-color: #d70018; color: #fff; border-radius: 12px; font-weight: 700; padding: 10px; width: 100%; border: none; }
        .btn-brand:hover { background-color: #b80015; color: #fff; }
    </style>
</head>
<body>
<div class="auth-card">
    <div class="text-center mb-4">
        <i class="fa-solid fa-key fa-2x text-danger mb-2"></i>
        <h4 class="fw-bold mb-1">Quên mật khẩu</h4>
        <p class="text-muted small">Nhập email đăng ký để nhận mã xác thực OTP</p>
    </div>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger py-2 small rounded-3 text-center mb-3">${alert}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        <div class="mb-4">
            <label class="form-label small fw-semibold text-secondary">Email nhận mã</label>
            <input type="email" name="email" class="form-control" placeholder="name@gmail.com" required>
        </div>
        <button type="submit" class="btn btn-brand mb-3">GỬI MÃ OTP</button>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/login" class="small text-secondary text-decoration-none">Quay lại đăng nhập</a>
        </div>
    </form>
</div>
</body>
</html>