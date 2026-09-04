<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập tài khoản - TechStore</title>
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
        }
        .auth-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
            border: 1px solid #eef2f6;
            width: 100%;
            max-width: 420px;
            padding: 36px;
        }
        .brand-icon {
            width: 60px;
            height: 60px;
            background: #fff1f2;
            color: #d70018;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            margin: 0 auto 16px auto;
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
            padding: 10px 14px;
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
        <div class="brand-icon">
            <i class="fa-solid fa-mobile-screen-button"></i>
        </div>
        <h4 class="fw-bold mb-1">Đăng nhập</h4>
        <p class="text-muted small mb-0">Đăng nhập tài khoản thành viên TechStore</p>
    </div>

    <c:if test="${not empty alert}">
        <div class="alert alert-danger py-2 small rounded-3 text-center mb-3">
            <i class="fa-solid fa-circle-exclamation me-1"></i> ${alert}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="mb-3">
            <label class="form-label small fw-semibold text-secondary">Tên đăng nhập / Email</label>
            <input type="text" name="username" class="form-control" placeholder="Nhập username của bạn" required autofocus>
        </div>

        <div class="mb-3">
            <div class="d-flex justify-content-between">
                <label class="form-label small fw-semibold text-secondary">Mật khẩu</label>
                <a href="${pageContext.request.contextPath}/forgot-password" class="small text-danger text-decoration-none">Quên mật khẩu?</a>
            </div>
            <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required>
        </div>

        <div class="form-check mb-4">
            <input class="form-check-input" type="checkbox" name="remember" id="remember">
            <label class="form-check-label small text-muted" for="remember">
                Ghi nhớ đăng nhập
            </label>
        </div>

        <button type="submit" class="btn btn-brand mb-3">ĐĂNG NHẬP</button>

        <div class="text-center small text-muted">
            Chưa có tài khoản? 
            <a href="${pageContext.request.contextPath}/register" class="text-danger fw-semibold text-decoration-none">Đăng ký ngay</a>
        </div>
        <div class="text-center mt-3">
            <a href="${pageContext.request.contextPath}/home" class="small text-secondary text-decoration-none">
                <i class="fa-solid fa-arrow-left me-1"></i> Quay lại trang chủ
            </a>
        </div>
    </form>
</div>

</body>
</html>