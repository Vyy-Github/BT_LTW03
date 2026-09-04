<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechStore - Điện thoại, Laptop, Phụ kiện chính hãng</title>
    <!-- Bootstrap 5 & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        :root {
            --brand-color: #d70018; /* Màu đỏ CellphoneS/TGDĐ */
            --brand-dark: #b80015;
            --bg-body: #f4f6f8;
            --text-main: #1e293b;
        }

        body {
            background-color: var(--bg-body);
            color: var(--text-main);
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        /* Header phong cách TGDĐ / CellphoneS */
        .cps-header {
            background-color: var(--brand-color);
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 12px rgba(215, 0, 24, 0.15);
        }

        .cps-logo {
            font-size: 24px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .cps-search-box {
            position: relative;
            max-width: 500px;
            width: 100%;
        }

        .cps-search-box input {
            border-radius: 25px;
            padding-left: 45px;
            height: 42px;
            border: none;
            font-size: 14px;
        }

        .cps-search-box i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #64748b;
        }

        .header-btn {
            background: rgba(255, 255, 255, 0.15);
            color: #fff !important;
            border-radius: 12px;
            padding: 8px 14px;
            font-size: 13px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .header-btn:hover {
            background: rgba(255, 255, 255, 0.25);
        }

        /* Banner quảng cáo */
        .banner-main {
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.06);
            height: 320px;
            object-fit: cover;
            width: 100%;
        }

        /* Card sản phẩm đặc trưng bán lẻ */
        .product-card {
            background: #fff;
            border-radius: 16px;
            padding: 16px;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            position: relative;
            display: flex;
            flex-direction: column;
            height: 100%;
            border: 1px solid #eef2f6;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08);
            border-color: #fecdd3;
        }

        .product-badge-discount {
            position: absolute;
            top: 12px;
            left: 12px;
            background: var(--brand-color);
            color: #fff;
            font-size: 11px;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 8px;
            z-index: 2;
        }

        .product-img-wrap {
            height: 190px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
            overflow: hidden;
        }

        .product-img-wrap img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
            transition: transform 0.3s ease;
        }

        .product-card:hover .product-img-wrap img {
            transform: scale(1.06);
        }

        .product-title {
            font-size: 15px;
            font-weight: 600;
            line-height: 1.4;
            color: #1e293b;
            text-decoration: none;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 42px;
            margin-bottom: 8px;
        }

        .product-title:hover {
            color: var(--brand-color);
        }

        .product-price-box {
            margin-top: auto;
            display: flex;
            align-items: baseline;
            gap: 8px;
            flex-wrap: wrap;
        }

        .price-current {
            color: var(--brand-color);
            font-size: 17px;
            font-weight: 700;
        }

        .price-old {
            color: #94a3b8;
            font-size: 13px;
            text-decoration: line-through;
        }

        .installment-tag {
            background-color: #f1f5f9;
            color: #475569;
            font-size: 11px;
            font-weight: 600;
            padding: 2px 6px;
            border-radius: 6px;
            display: inline-block;
            margin-bottom: 8px;
        }

        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .section-title {
            font-size: 20px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .section-title i {
            color: var(--brand-color);
        }
    </style>
</head>
<body>

<!-- Header Top Bar -->
<header class="cps-header py-2 text-white">
    <div class="container d-flex align-items-center justify-content-between gap-3">
        <!-- Logo -->
        <a class="cps-logo text-white text-decoration-none d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/home">
            <i class="fa-solid fa-mobile-screen-button"></i> TECHSTORE
        </a>

        <!-- Search Bar -->
        <div class="cps-search-box d-none d-md-block">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" class="form-control" placeholder="Bạn cần tìm điện thoại, laptop gì hôm nay?">
        </div>

        <!-- Utility Buttons -->
        <div class="d-flex align-items-center gap-2">
            <a href="${pageContext.request.contextPath}/product" class="header-btn">
                <i class="fa-solid fa-layer-group"></i>
                <span class="d-none d-lg-inline">Sản phẩm</span>
            </a>

            <c:choose>
                <c:when test="${not empty sessionScope.account}">
                    <div class="dropdown">
                        <a class="header-btn dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fa-solid fa-circle-user"></i> ${sessionScope.account.fullname}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2">
                            <li><a class="dropdown-item py-2" href="#"><i class="fa-solid fa-id-card me-2 text-muted"></i>Trang cá nhân</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item py-2 text-danger" href="${pageContext.request.contextPath}/logout"><i class="fa-solid fa-right-from-bracket me-2"></i>Đăng xuất</a></li>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="header-btn">
                        <i class="fa-solid fa-circle-user"></i>
                        <span>Đăng nhập</span>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>

<!-- Main Body -->
<main class="container py-4">
    <!-- Hero Banner Section -->
    <div class="row g-3 mb-4">
        <div class="col-lg-8">
            <img src="https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=1200&q=80" 
                 class="banner-main" alt="Banner Khuyến Mãi">
        </div>
        <div class="col-lg-4 d-none d-lg-flex flex-column gap-3">
            <img src="https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=600&q=80" 
                 style="height: 152px; border-radius: 16px; object-fit: cover;" alt="Banner 2">
            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80" 
                 style="height: 152px; border-radius: 16px; object-fit: cover;" alt="Banner 3">
        </div>
    </div>

    <!-- Product Grid: 10 Sản phẩm mới nhất -->
    <div class="section-header">
        <div class="section-title">
            <i class="fa-solid fa-fire"></i> SẢN PHẨM NỔI BẬT NHẤT
        </div>
        <a href="${pageContext.request.contextPath}/product" class="text-decoration-none fw-semibold text-danger">
            Xem tất cả <i class="fa-solid fa-chevron-right ms-1"></i>
        </a>
    </div>

    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-5 g-3">
        <c:forEach items="${top10Products}" var="p">
            <div class="col">
                <div class="product-card">
                    <span class="product-badge-discount">Giảm 15%</span>
                    
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="product-img-wrap">
                        <c:choose>
                            <c:when test="${not empty p.images && p.images.startsWith('http')}">
                                <img src="${p.images}" alt="${p.productname}">
                            </c:when>
                            <c:when test="${not empty p.images}">
                                <img src="${pageContext.request.contextPath}/image?fname=${p.images}" alt="${p.productname}">
                            </c:when>
                            <c:otherwise>
                                <i class="fa-solid fa-mobile-screen fa-4x text-light"></i>
                            </c:otherwise>
                        </c:choose>
                    </a>

                    <div class="installment-tag">Trả góp 0%</div>

                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="product-title" title="${p.productname}">
                        ${p.productname}
                    </a>

                    <div class="product-price-box">
                        <span class="price-current">
                            <fmt:formatNumber value="${p.price}" pattern="#,###"/>₫
                        </span>
                        <span class="price-old">
                            <fmt:formatNumber value="${p.price * 1.15}" pattern="#,###"/>₫
                        </span>
                    </div>

                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="btn btn-outline-danger btn-sm w-100 mt-3 rounded-pill fw-semibold">
                        Xem chi tiết
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</main>

<!-- Footer chuẩn E-commerce -->
<footer class="bg-white border-top mt-5 py-4">
    <div class="container text-center text-muted small">
        <p class="mb-1 fw-bold text-dark">© 2026 TECHSTORE - Hệ thống bán lẻ thiết bị công nghệ chính hãng</p>
        <p class="mb-0">Dự án môn học Lập trình Web - Khoa CNTT HCMUTE</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>