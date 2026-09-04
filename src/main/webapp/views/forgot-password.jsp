<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }
        .forgot-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 35px;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }
        .header-icon {
            width: 60px;
            height: 60px;
            background: #ffffff;
            color: #2563eb;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            margin: 0 auto 12px auto;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }
        .form-control {
            background-color: #f1f5f9;
            border: 1.5px solid transparent;
            border-radius: 12px;
            padding: 12px 16px;
            font-size: 15px;
        }
        .form-control:focus {
            background-color: #ffffff;
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }
        .btn-primary-custom {
            background: #2563eb;
            border: none;
            border-radius: 12px;
            padding: 12px;
            font-weight: 600;
            color: white;
            transition: all 0.2s;
        }
        .btn-primary-custom:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }
    </style>
</head>
<body>

<div>
    <div class="text-center text-white mb-3">
        <div class="header-icon">
            <i class="fa-solid fa-key"></i>
        </div>
        <h4 class="fw-bold mb-1">Khôi Phục Mật Khẩu</h4>
        <p class="mb-0 text-white-50" style="font-size: 14px;">Nhập email để nhận mã xác minh OTP</p>
    </div>

    <div class="forgot-card">
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger py-2 text-center" style="font-size: 14px; border-radius: 10px;">
                <i class="fa-solid fa-circle-exclamation me-1"></i> <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/forgot-password" method="post">
            <div class="mb-4">
                <label class="form-label fw-semibold text-secondary" style="font-size: 14px;">Địa chỉ Email</label>
                <input type="email" name="email" class="form-control" placeholder="name@example.com" required>
            </div>
            <button type="submit" class="btn btn-primary-custom w-100 mb-3">Gửi mã xác thực OTP</button>
        </form>

        <div class="text-center mt-3 pt-2 border-top">
            <a href="${pageContext.request.contextPath}/login" class="text-secondary text-decoration-none" style="font-size: 14px;">
                <i class="fa-solid fa-arrow-left me-1"></i> Quay lại Đăng nhập
            </a>
        </div>
    </div>
</div>

</body>
</html>