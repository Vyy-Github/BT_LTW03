<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Danh Mục</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
        body { background-color: #f1f5f9; min-height: 100vh; padding: 40px 20px; }
        .wrapper { max-width: 1000px; margin: 0 auto; }
        
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
        }
        .header-title h1 { font-size: 24px; font-weight: 700; color: #1e293b; }
        .header-title p { font-size: 13px; color: #64748b; margin-top: 4px; }
        
        .btn-add {
            background: #2563eb;
            color: #ffffff;
            padding: 10px 18px;
            border-radius: 12px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
            transition: 0.2s;
        }
        .btn-add:hover { background: #1d4ed8; transform: translateY(-1px); }

        .table-card {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }
        table { width: 100%; border-collapse: collapse; text-align: left; }
        thead { background: #f8fafc; border-bottom: 1px solid #e2e8f0; }
        th { padding: 14px 20px; font-size: 12px; font-weight: 700; color: #475569; text-transform: uppercase; }
        td { padding: 14px 20px; font-size: 14px; border-bottom: 1px solid #f1f5f9; vertical-align: middle; }
        tr:last-child td { border-bottom: none; }
        
        .thumb-img { width: 50px; height: 50px; border-radius: 10px; object-fit: cover; border: 1px solid #e2e8f0; }
        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }
        .badge-active { background: #eff6ff; color: #2563eb; border: 1px solid #bfdbfe; }
        .badge-locked { background: #fef2f2; color: #dc2626; border: 1px solid #fecaca; }

        .action-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 32px;
            height: 32px;
            border-radius: 8px;
            text-decoration: none;
            margin-left: 4px;
            transition: 0.2s;
        }
        .btn-edit { background: #f1f5f9; color: #2563eb; }
        .btn-edit:hover { background: #e0e7ff; }
        .btn-del { background: #fef2f2; color: #dc2626; }
        .btn-del:hover { background: #fee2e2; }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="header-section">
            <div class="header-title">
                <h1>Quản Lý Danh Mục</h1>
                <p>Danh sách các danh mục hệ thống</p>
            </div>
            <a href="<c:url value='/admin/category/add'/>" class="btn-add">
                <i class="bi bi-plus-lg"></i> Thêm mới
            </a>
        </div>

        <div class="table-card">
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Hình Ảnh</th>
                        <th>Tên Danh Mục</th>
                        <th>Trạng Thái</th>
                        <th style="text-align: right;">Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listcate}" var="cate" varStatus="STT">
                        <tr>
                            <td style="color: #64748b; font-weight: 600;">${STT.index + 1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${cate.images != null && cate.images.startsWith('https')}">
                                        <img src="${cate.images}" class="thumb-img" alt="Ảnh" />
                                    </c:when>
                                    <c:when test="${cate.images != null}">
                                        <img src="<c:url value='/image?fname=${cate.images}'/>" class="thumb-img" alt="Ảnh" />
                                    </c:when>
                                    <c:otherwise>
                                        <div class="thumb-img" style="background:#f1f5f9; display:flex; align-items:center; justify-content:center; color:#94a3b8;"><i class="bi bi-image"></i></div>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td style="font-weight: 600; color: #0f172a;">${cate.categoryname}</td>
                            <td>
                                <c:if test="${cate.status == 1}">
                                    <span class="badge badge-active">Hoạt động</span>
                                </c:if>
                                <c:if test="${cate.status != 1}">
                                    <span class="badge badge-locked">Đã khóa</span>
                                </c:if>
                            </td>
                            <td style="text-align: right;">
                                <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>" class="action-link btn-edit" title="Sửa"><i class="bi bi-pencil"></i></a>
                                <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>" class="action-link btn-del" onclick="return confirm('Bạn có chắc muốn xóa?')" title="Xóa"><i class="bi bi-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>