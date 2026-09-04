<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.productname} - TechStore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        :root {
            --brand-color: #d70018;
            --brand-dark: #b80015;
            --bg-body: #f4f6f8;
        }
        body {
            background-color: var(--bg-body);
            font-family: system-ui, -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            color: #1e293b;
        }
        .cps-header {
            background-color: var(--brand-color);
            box-shadow: 0 4px 12px rgba(215, 0, 24, 0.15);
        }
        .detail-box {
            background: #fff;
            border-radius: 16px;
            padding: 24px;
            border: 1px solid #eef2f6;
            box-shadow: 0 4px 20px rgba(0,0,0,0.04);
        }
        .main-img-wrap {
            height: 380px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #fafafa;
            border-radius: 14px;
            padding: 20px;
        }
        .main-img-wrap img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
        }
        .price-huge {
            color: var(--brand-color);
            font-size: 28px;
            font-weight: 800;
        }
        .price-old-huge {
            color: #94a3b8;
            font-size: 16px;
            text-decoration: line-through;
        }
        .promo-box {
            border: 1px dashed var(--brand-color);
            border-radius: 12px;
            padding: 16px;
            background: #fff5f5;
        }
        .promo-header {
            color: var(--brand-color);
            font-weight: 700;
            font-size: 14px;
            margin-bottom: 8px;
        }
        .policy-item {
            font-size: 13px;
            color: #475569;
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .btn-buy-now {
            background: linear-gradient(180deg, #fd475a 0%, #d70018 100%);
            color: #fff;
            border: none;
            border-radius: 12px;
            padding: 12px;
            font-weight: 700;
            text-align: center;
            width: 100%;
            text-transform: uppercase;
        }
        .btn-buy-now:hover {
            color: #fff;
            opacity: 0.95;
        }
        .btn-installment {
            background: #2b80ff;
            color: #fff;
            border: none;
            border-radius: 12px;
            padding: 12px;
            font-weight: 700;
            width: 100%;
            text-transform: uppercase;
        }
        .btn-installment:hover {
            color: #fff;
            opacity: 0.95;
        }
    </style>
</head>
<body>

<header class="cps-header py-2 text-white sticky-top">
    <div class="container d-flex align-items-center justify-content-between">
        <a class="text-white text-decoration-none fw-bold fs-4" href="${pageContext.request.contextPath}/home">
            <i class="fa-solid fa-mobile-screen-button me-2"></i> TECHSTORE
        </a>
        <div class="d-flex align-items-center gap-2">
            <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-light btn-sm rounded-pill px-3">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-light btn-sm rounded-pill px-3">Sản phẩm</a>
        </div>
    </div>
</header>

<main class="container py-4">
    <nav class="mb-3 small">
        <a href="${pageContext.request.contextPath}/home" class="text-muted text-decoration-none">Trang chủ</a>
        <span class="mx-2 text-muted">/</span>
        <a href="${pageContext.request.contextPath}/product" class="text-muted text-decoration-none">Sản phẩm</a>
        <span class="mx-2 text-muted">/</span>
        <span class="text-danger fw-semibold">${product.productname}</span>
    </nav>

    <div class="detail-box">
        <c:choose>
            <c:when test="${not empty product}">
                <div class="row g-4">
                    <div class="col-lg-5">
                        <div class="main-img-wrap mb-3">
                            <c:choose>
                                <c:when test="${not empty product.images && product.images.startsWith('http')}">
                                    <img src="${product.images}" alt="${product.productname}">
                                </c:when>
                                <c:when test="${not empty product.images}">
                                    <img src="${pageContext.request.contextPath}/image?fname=${product.images}" alt="${product.productname}">
                                </c:when>
                                <c:otherwise>
                                    <i class="fa-solid fa-mobile-screen fa-6x text-secondary"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                        <div class="p-3 bg-light rounded-3">
                            <h6 class="fw-bold mb-2 small text-uppercase">Chính sách cam kết:</h6>
                            <div class="d-flex flex-column gap-2">
                                <div class="policy-item"><i class="fa-solid fa-shield-halved text-success"></i> Hàng chính hãng 100%, bảo hành 12 tháng.</div>
                                <div class="policy-item"><i class="fa-solid fa-rotate-left text-danger"></i> 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng.</div>
                                <div class="policy-item"><i class="fa-solid fa-truck-fast text-primary"></i> Giao siêu tốc toàn quốc trong 2 giờ.</div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-7">
                        <span class="badge bg-danger-subtle text-danger border border-danger-subtle px-3 py-1 rounded-pill mb-2">
                            ${not empty product.category ? product.category.categoryname : 'Thiết bị công nghệ'}
                        </span>
                        
                        <h1 class="fw-bold fs-3 mb-3">${product.productname}</h1>

                        <div class="d-flex align-items-baseline gap-3 mb-3 p-3 bg-light rounded-3">
                            <span class="price-huge">
                                <fmt:formatNumber value="${product.price}" pattern="#,###"/>₫
                            </span>
                            <span class="price-old-huge">
                                <fmt:formatNumber value="${product.price * 1.15}" pattern="#,###"/>₫
                            </span>
                            <span class="badge bg-danger">-15%</span>
                        </div>

                        <!-- Khuyến mãi -->
                        <div class="promo-box mb-4">
                            <div class="promo-header"><i class="fa-solid fa-gift me-2"></i>KHUYẾN MÃI ĐẶC BIỆT</div>
                            <ul class="small mb-0 ps-3">
                                <li>Tặng củ sạc nhanh 25W chính hãng kèm máy.</li>
                                <li>Giảm thêm 500.000₫ khi thanh toán qua mã QR ngân hàng.</li>
                                <li>Trợ giá lên đời đến 1.000.000₫ khi thu cũ đổi mới.</li>
                            </ul>
                        </div>

                        <!-- Mô tả tóm tắt -->
                        <div class="mb-4">
                            <h6 class="fw-bold text-dark">Mô tả sản phẩm:</h6>
                            <p class="text-secondary small lh-lg">
                                ${not empty product.description ? product.description : 'Sản phẩm chính hãng với thiết kế tinh xảo, hiệu năng vượt trội và thời lượng pin ấn tượng.'}
                            </p>
                        </div>

                        <!-- Nút mua hàng -->
                        <div class="row g-2">
                            <div class="col-6">
                                <button class="btn btn-buy-now">
                                    <div>MUA NGAY</div>
                                    <div style="font-size: 11px; font-weight: normal;">Giao tận nơi hoặc nhận tại cửa hàng</div>
                                </button>
                            </div>
                            <div class="col-6">
                                <button class="btn btn-installment">
                                    <div>TRẢ GÓP 0%</div>
                                    <div style="font-size: 11px; font-weight: normal;">Duyệt hồ sơ online chỉ 5 phút</div>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="text-center py-5">
                    <i class="fa-solid fa-box-open fa-3x text-muted mb-3"></i>
                    <h5 class="text-muted">Không tìm thấy thông tin sản phẩm!</h5>
                    <a href="${pageContext.request.contextPath}/product" class="btn btn-danger btn-sm rounded-pill mt-2">Xem sản phẩm khác</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>