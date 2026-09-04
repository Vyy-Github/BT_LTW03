<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }
        .card-custom {
            background: #ffffff;
            border-radius: 24px;
            padding: 35px;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>

<div class="card-custom text-center">
    <h4 class="fw-bold mb-2">Đặt Lại Mật Khẩu</h4>
    <p class="text-muted" style="font-size: 14px;">Nhập mã OTP vừa nhận trong mail và mật khẩu mới.</p>

    <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger py-2" style="font-size: 14px;"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/reset-password" method="post" class="text-start mt-3">
        <div class="mb-3">
            <label class="form-label fw-semibold" style="font-size: 13.5px;">Mã OTP (6 chữ số)</label>
            <input type="text" name="otp" class="form-control text-center fs-5" maxlength="6" placeholder="123456" required>
        </div>
        <div class="mb-4">
            <label class="form-label fw-semibold" style="font-size: 13.5px;">Mật khẩu mới</label>
            <input type="password" name="newPassword" class="form-control" placeholder="••••••••" required>
        </div>
        <button type="submit" class="btn btn-primary w-100 py-2 fw-semibold">Xác nhận Đổi mật khẩu</button>
    </form>
</div>

</body>
</html>