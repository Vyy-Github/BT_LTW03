<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản - TechStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #f4f6f8;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            padding: 30px 15px;
        }
        .auth-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
            border: 1px solid #eef2f6;
            width: 100%;
            max-width: 480px;
            padding: 36px;
        }
        .btn-brand {
            background-color: #d70018;
            color: #fff;
            border-radius: 12px;
            font-weight: 700;
            padding: 10px;
            border: none;
            width: 100%;
        }
        .btn-brand:hover {
            background-color: #b80015;
            color: #fff;
        }
        .form-control {
            border-radius: 10px;
            padding: 9px 13px;
            font-size: 14px;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
        }
        .form-control:focus {
            background-color: #fff;
            border-color: #d70018;
            box-shadow: 0 0 0 3px rgba(215, 0, 24, 0.15);
        }
    </style>
</head>
<body>

<div class="auth-card">
    <div class="text-center mb-4">
        <h4 class="fw-bold mb-1 text-danger">Tạo tài khoản TechStore</h4>
        <p class="text-muted small mb-0">Đăng ký để nhận hàng ngàn ưu đãi công nghệ</p>
    </div>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger py-2 small rounded-3 text-center mb-3">
            <i class="fa-solid fa-circle-exclamation me-1"></i> ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="mb-3">
            <label class="form-label small fw-semibold text-secondary">Tên đăng nhập</label>
            <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập" required>
        </div>

        <div class="mb-3">
            <label class="form-label small fw-semibold text-secondary">Họ và tên</label>
            <input type="text" name="fullname" class="form-control" placeholder="Họ và tên của bạn" required>
        </div>

        <div class="mb-3">
            <label class="form-label small fw-semibold text-secondary">Email</label>
            <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
        </div>

        <div class="mb-3">
            <label class="form-label small fw-semibold text-secondary">Số điện thoại</label>
            <input type="text" name="phone" class="form-control" placeholder="09xxxxxxx">
        </div>

        <div class="mb-4">
            <label class="form-label small fw-semibold text-secondary">Mật khẩu</label>
            <input type="password" name="password" class="form-control" placeholder="Tạo mật khẩu" required>
        </div>

        <button type="submit" class="btn btn-brand mb-3">ĐĂNG KÝ TÀI KHOẢN</button>

        <div class="text-center small text-muted">
            Đã có tài khoản? 
            <a href="${pageContext.request.contextPath}/login" class="text-danger fw-semibold text-decoration-none">Đăng nhập</a>
        </div>
    </form>
</div>

</body>
</html>