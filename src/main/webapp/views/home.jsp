<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ - Cửa Hàng Trực Tuyến</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .product-card {
            transition: transform 0.2s, box-shadow 0.2s;
            border-radius: 12px;
            overflow: hidden;
            border: 1px solid #e2e8f0;
        }
        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }
        .product-img {
            height: 200px;
            object-fit: cover;
            width: 100%;
            background-color: #f8fafc;
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
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h3 class="fw-bold mb-1 text-dark">Sản Phẩm Mới Nhất</h3>
            <p class="text-muted mb-0">Top 10 sản phẩm vừa được cập nhật trên hệ thống</p>
        </div>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-primary">
            Xem tất cả &rarr;
        </a>
    </div>

    <!-- Danh sách 10 sản phẩm mới nhất -->
    <div class="row g-4">
        <c:choose>
            <c:when test="${empty top10Products}">
                <div class="col-12 text-center py-5">
                    <div class="text-muted fs-5">Chưa có sản phẩm nào trong hệ thống.</div>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${top10Products}" var="p">
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                        <div class="card h-100 product-card">
                            <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}">
                                <c:choose>
                                    <c:when test="${not empty p.images && p.images.startsWith('http')}">
                                        <img src="${p.images}" class="product-img" alt="${p.productname}">
                                    </c:when>
                                    <c:when test="${not empty p.images}">
                                        <img src="${pageContext.request.contextPath}/image?fname=${p.images}" class="product-img" alt="${p.productname}">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="product-img d-flex align-items-center justify-content-center text-muted">
                                            <i class="fa-regular fa-image fa-2x"></i>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </a>
                            <div class="card-body d-flex flex-column">
                                <span class="badge bg-secondary mb-2 align-self-start" style="font-size: 11px;">
                                    ${not empty p.category ? p.category.categoryname : 'Chưa phân loại'}
                                </span>
                                <h6 class="card-title fw-bold mb-2">
                                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="text-dark text-decoration-none">
                                        ${p.productname}
                                    </a>
                                </h6>
                                <div class="mt-auto pt-2">
                                    <div class="text-danger fw-bold fs-5 mb-2">
                                        <fmt:formatNumber value="${p.price}" pattern="#,###"/> ₫
                                    </div>
                                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="btn btn-outline-primary btn-sm w-100">
                                        Xem chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>