<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Danh Mục Mới</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Plus Jakarta Sans', sans-serif; }
        body { background: #f8fafc; color: #1e293b; min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 30px; }
        .form-card {
            width: 100%;
            max-width: 520px;
            background: #ffffff;
            border-radius: 24px;
            padding: 35px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.04);
        }
        .form-header { margin-bottom: 25px; }
        .form-header h2 { font-size: 22px; font-weight: 700; color: #0f172a; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-size: 13px; font-weight: 600; color: #334155; margin-bottom: 8px; }
        .form-control {
            width: 100%;
            padding: 12px 16px;
            background: #f8fafc;
            border: 1px solid #cbd5e1;
            border-radius: 12px;
            font-size: 14px;
            outline: none;
            transition: all 0.2s;
        }
        .form-control:focus { border-color: #6366f1; box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.15); }
        .radio-group { display: flex; gap: 20px; margin-top: 6px; }
        .radio-label { display: flex; align-items: center; gap: 8px; font-size: 14px; cursor: pointer; }
        .btn-group { display: flex; gap: 12px; margin-top: 30px; }
        .btn {
            flex: 1;
            padding: 12px;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: all 0.2s;
        }
        .btn-primary { background: linear-gradient(135deg, #4f46e5, #6366f1); color: white; }
        .btn-primary:hover { transform: translateY(-1px); box-shadow: 0 8px 20px -4px rgba(79, 70, 229, 0.4); }
        .btn-secondary { background: #f1f5f9; color: #475569; }
        .btn-secondary:hover { background: #e2e8f0; }
    </style>
</head>
<body>
    <div class="form-card">
        <div class="form-header">
            <h2>Thêm Mới Danh Mục</h2>
            <p style="color: #64748b; font-size: 13px; margin-top: 4px;">Điền đầy đủ thông tin để tạo mới</p>
        </div>

        <form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Tên danh mục</label>
                <input type="text" name="categoryname" class="form-control" placeholder="Ví dụ: Thiết bị di động" required>
            </div>

            <div class="form-group">
                <label>Link ảnh online (nếu có)</label>
                <input type="text" name="images" class="form-control" placeholder="https://...">
            </div>

            <div class="form-group">
                <label>Hoặc tải tệp ảnh từ máy tính</label>
                <input type="file" name="images1" class="form-control" accept="image/*">
            </div>

            <div class="form-group">
                <label>Trạng thái hiển thị</label>
                <div class="radio-group">
                    <label class="radio-label"><input type="radio" name="status" value="1" checked> Hoạt động</label>
                    <label class="radio-label"><input type="radio" name="status" value="0"> Tạm khóa</label>
                </div>
            </div>

            <div class="btn-group">
                <a href="<c:url value='/admin/categories'/>" class="btn btn-secondary">Hủy bỏ</a>
                <button type="submit" class="btn btn-primary">Lưu Danh Mục</button>
            </div>
        </form>
    </div>
</body>
</html>