<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productname} - Chi tiết sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .detail-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: 1px solid #e2e8f0;
        }
        .detail-img {
            width: 100%;
            max-height: 420px;
            object-fit: contain;
            border-radius: 16px;
            background-color: #f8fafc;
            padding: 15px;
        }
        .price-tag {
            color: #dc2626;
            font-size: 2rem;
            font-weight: 700;
        }
    </style>
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">
            <i class="fa-solid fa-store me-2"></i>MyShop
        </a>
        <div class="d-flex align-items-center">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-light btn-sm me-2">
                <i class="fa-solid fa-house me-1"></i> Trang chủ
            </a>
            <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-light btn-sm me-3">
                <i class="fa-solid fa-list me-1"></i> Tất cả sản phẩm
            </a>
            <c:choose>
                <c:when test="${not empty sessionScope.account}">
                    <span class="text-white me-3">Xin chào, <strong>${sessionScope.account.fullname}</strong></span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-sm">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>

<div class="container pb-5">
    <div class="mb-3">
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-secondary btn-sm">
            <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
        </a>
    </div>

    <div class="detail-card">
        <c:choose>
            <c:when test="${not empty product}">
                <div class="row align-items-center">
                    <!-- Cột hình ảnh -->
                    <div class="col-md-5 text-center mb-4 mb-md-0">
                        <c:choose>
                            <c:when test="${not empty product.images && product.images.startsWith('http')}">
                                <img src="${product.images}" class="detail-img" alt="${product.productname}">
                            </c:when>
                            <c:when test="${not empty product.images}">
                                <img src="${pageContext.request.contextPath}/image?fname=${product.images}" class="detail-img" alt="${product.productname}">
                            </c:when>
                            <c:otherwise>
                                <div class="detail-img d-flex align-items-center justify-content-center text-muted" style="min-height: 300px;">
                                    <i class="fa-regular fa-image fa-4x"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Cột thông tin chi tiết -->
                    <div class="col-md-7 ps-md-4">
                        <span class="badge bg-primary px-3 py-2 rounded-pill mb-2">
                            ${not empty product.category ? product.category.categoryname : 'Chưa phân loại'}
                        </span>
                        
                        <h2 class="fw-bold text-dark mb-3">${product.productname}</h2>
                        
                        <div class="price-tag mb-4">
                            <fmt:formatNumber value="${product.price}" pattern="#,###"/> ₫
                        </div>

                        <div class="mb-4">
                            <h6 class="fw-bold text-secondary text-uppercase" style="font-size: 13px;">Mô tả sản phẩm:</h6>
                            <p class="text-secondary lh-lg mb-0" style="font-size: 15px;">
                                ${not empty product.description ? product.description : 'Đang cập nhật mô tả chi tiết cho sản phẩm này.'}
                            </p>
                        </div>

                        <div class="d-flex gap-3 pt-3 border-top">
                            <button class="btn btn-primary px-4 py-2 fw-semibold">
                                <i class="fa-solid fa-cart-shopping me-2"></i>Thêm vào giỏ hàng
                            </button>
                            <button class="btn btn-danger px-4 py-2 fw-semibold">
                                Mua ngay
                            </button>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center py-5 text-muted">
                    <i class="fa-solid fa-box-open fa-3x mb-3 text-secondary"></i>
                    <h5>Không tìm thấy thông tin sản phẩm!</h5>
                    <a href="${pageContext.request.contextPath}/product" class="btn btn-primary mt-2">Xem danh sách sản phẩm</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>