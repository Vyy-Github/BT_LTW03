<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập Tài Khoản</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(180deg, #2563eb 0%, #3b82f6 45%, #1d4ed8 100%);
            padding: 24px;
        }

        .container {
            width: 100%;
            max-width: 440px;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Top Brand Logo */
        .top-brand {
            text-align: center;
            margin-bottom: 24px;
        }

        .brand-badge {
            width: 52px;
            height: 52px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 26px;
            color: #2563eb;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
            margin-bottom: 12px;
        }

        .top-brand h1 {
            color: #ffffff;
            font-size: 22px;
            font-weight: 700;
            letter-spacing: -0.3px;
        }

        .top-brand .sub-title {
            color: rgba(255, 255, 255, 0.9);
            font-size: 13px;
            font-weight: 500;
            margin-top: 4px;
        }

        .top-brand .welcome-text {
            color: rgba(255, 255, 255, 0.7);
            font-size: 12px;
            margin-top: 2px;
        }

        /* Form Card */
        .auth-card {
            width: 100%;
            background: #ffffff;
            border-radius: 28px;
            padding: 36px 32px;
            box-shadow: 0 20px 40px -15px rgba(0, 0, 0, 0.25);
        }

        .card-title {
            text-align: center;
            font-size: 18px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 24px;
        }

        /* Form Fields */
        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            color: #475569;
            margin-bottom: 6px;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            background: #ffffff;
            border: 1.5px solid #e2e8f0;
            border-radius: 12px;
            font-size: 13px;
            color: #1e293b;
            outline: none;
            transition: all 0.2s ease;
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .form-control:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }

        /* Submit Button */
        .btn-submit {
            width: 100%;
            padding: 13px;
            background: #2563eb;
            color: #ffffff;
            border: none;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 8px;
            box-shadow: 0 6px 16px rgba(37, 99, 235, 0.35);
            transition: all 0.2s ease;
        }

        .btn-submit:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.45);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* Error Notification */
        .alert-error {
            background: #fef2f2;
            border: 1px solid #fee2e2;
            color: #dc2626;
            padding: 10px 14px;
            border-radius: 10px;
            font-size: 12px;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Brand Info -->
        <div class="top-brand">
            <div class="brand-badge">
                <i class="bi bi-mortarboard-fill"></i>
            </div>
            <h1>Cổng Thông Tin Đăng Nhập</h1>
            <p class="sub-title">Hệ Thống Quản Trị Trực Tuyến</p>
            <p class="welcome-text">Vui lòng đăng nhập để tiếp tục</p>
        </div>

        <!-- Card Form -->
        <div class="auth-card">
            <h2 class="card-title">Đăng nhập tài khoản</h2>

            <c:if test="${not empty error}">
                <div class="alert-error">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <form action="<c:url value='/login'/>" method="post">
                <div class="form-group">
                    <label>Tên đăng nhập</label>
                    <input type="text" name="username" class="form-control" placeholder="Nhập tên đăng nhập" required autofocus>
                </div>

                <div class="form-group">
                    <label>Mật khẩu</label>
                    <input type="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required>
                </div>

                <button type="submit" class="btn-submit">Đăng nhập</button>
            </form>
        </div>
    </div>
</body>
</html>