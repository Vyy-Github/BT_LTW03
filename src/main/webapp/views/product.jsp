<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm - TechStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    
    <style>
        :root {
            --brand-color: #d70018;
            --bg-body: #f4f6f8;
        }

        body {
            background-color: var(--bg-body);
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        .cps-header {
            background-color: var(--brand-color);
            box-shadow: 0 4px 12px rgba(215, 0, 24, 0.15);
        }

        .product-card {
            background: #fff;
            border-radius: 16px;
            padding: 16px;
            transition: all 0.25s ease;
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

        .product-img-wrap {
            height: 180px;
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
            transform: scale(1.05);
        }

        .product-title {
            font-size: 15px;
            font-weight: 600;
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

        .price-current {
            color: var(--brand-color);
            font-size: 17px;
            font-weight: 700;
        }

        /* Phân trang số trang */
        .pagination .page-link {
            color: #334155;
            border-radius: 8px;
            margin: 0 3px;
            border: 1px solid #e2e8f0;
            font-weight: 600;
        }

        .pagination .page-item.active .page-link {
            background-color: var(--brand-color);
            border-color: var(--brand-color);
            color: #fff;
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="cps-header py-2 text-white sticky-top">
    <div class="container d-flex align-items-center justify-content-between">
        <a class="text-white text-decoration-none fw-bold fs-4" href="${pageContext.request.contextPath}/home">
            <i class="fa-solid fa-mobile-screen-button me-2"></i> TECHSTORE
        </a>
        <div>
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-light btn-sm rounded-pill px-3 me-2">Trang chủ</a>
            <c:choose>
                <c:when test="${not empty sessionScope.account}">
                    <span class="me-2 small">Xin chào, <b>${sessionScope.account.fullname}</b></span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-light btn-sm rounded-pill px-3">Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-sm rounded-pill px-3">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>

<main class="container py-4">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-3">
        <ol class="breadcrumb small">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/home" class="text-decoration-none text-muted"><i class="fa-solid fa-house"></i> Trang chủ</a></li>
            <li class="breadcrumb-item active text-danger fw-semibold">Tất cả sản phẩm</li>
        </ol>
    </nav>

    <!-- Grid danh sách sản phẩm -->
    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-3 mb-4">
        <c:forEach items="${listProducts}" var="p">
            <div class="col">
                <div class="product-card">
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="product-img-wrap">
                        <c:choose>
                            <c:when test="${not empty p.images && p.images.startsWith('http')}">
                                <img src="${p.images}" alt="${p.productname}">
                            </c:when>
                            <c:when test="${not empty p.images}">
                                <img src="${pageContext.request.contextPath}/image?fname=${p.images}" alt="${p.productname}">
                            </c:when>
                            <c:otherwise>
                                <i class="fa-solid fa-box fa-3x text-secondary"></i>
                            </c:otherwise>
                        </c:choose>
                    </a>

                    <span class="badge bg-light text-secondary border w-auto align-self-start mb-2">${p.category.categoryname}</span>

                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="product-title" title="${p.productname}">
                        ${p.productname}
                    </a>

                    <div class="mt-auto">
                        <div class="price-current mb-3">
                            <fmt:formatNumber value="${p.price}" pattern="#,###"/>₫
                        </div>
                        <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="btn btn-danger w-100 btn-sm rounded-pill fw-semibold">
                            Xem chi tiết
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Phân trang Pagination -->
    <c:if test="${totalPages > 1}">
        <nav class="d-flex justify-content-center mt-4">
            <ul class="pagination">
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product?page=${currentPage - 1}"><i class="fa-solid fa-chevron-left"></i></a>
                </li>
                <c:forEach begin="1" end="${totalPages}" var="i">
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/product?page=${i}">${i}</a>
                    </li>
                </c:forEach>
                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/product?page=${currentPage + 1}"><i class="fa-solid fa-chevron-right"></i></a>
                </li>
            </ul>
        </nav>
    </c:if>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>