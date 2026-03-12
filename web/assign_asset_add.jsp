<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Thực hiện Gán Tài Sản - ASSET ERP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
</head>

<body>
    <div class="app-container">
        <%@include file="includes/sidebar.jsp" %>
        <div class="main-content">
            <header class="top-bar">
                <div style="display: flex; align-items: center; gap: 12px;">
                    <span style="font-weight: 600; color: var(--dark);">Gán tài sản vào phòng học</span>
                </div>
            </header>
            <main class="content-body">
                <div style="max-width: 900px; margin: 0 auto;">
                    <div style="margin-bottom: 40px; display: flex; align-items: center; gap: 20px; animation: slideInLeft 0.5s ease-out;">
                        <a href="${pageContext.request.contextPath}/assign-asset" class="btn btn-secondary"
                            style="border-radius: 50%; width: 48px; height: 48px; padding: 0; justify-content: center; background: white; box-shadow: var(--shadow);">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                stroke="currentColor" stroke-width="2.5">
                                <line x1="19" y1="12" x2="5" y2="12"></line>
                                <polyline points="12 19 5 12 12 5"></polyline>
                            </svg>
                        </a>
                        <div>
                            <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Gán thiết bị mới</h1>
                            <p style="color: var(--text-muted);">Chọn phòng học và thiết bị để phân phối.</p>
                        </div>
                    </div>

                    <div class="card" style="padding: 48px; border: none; box-shadow: var(--shadow-lg);">
                        <form action="${pageContext.request.contextPath}/assign-asset" method="post">
                            <div class="form-grid">
                                <div class="form-group">
                                    <label>Chọn phòng học</label>
                                    <select name="phongId" required>
                                        <c:forEach var="r" items="${requestScope.rooms}">
                                            <option value="${r.id}">${r.tenPhong} (${r.maPhong})</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Chọn thiết bị</label>
                                    <select name="taiSanId" required>
                                        <c:forEach var="a" items="${requestScope.assets}">
                                            <option value="${a.id}">${a.tenTaiSan} (${a.maTaiSan})</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <input type="number" name="soLuong" min="1" value="1" required>
                                </div>
                                <div class="form-group full-width" style="grid-column: span 2;">
                                    <label>Ghi chú gán</label>
                                    <textarea name="ghiChu" rows="4" placeholder="VD: Bàn giao trực tiếp cho phòng..."></textarea>
                                </div>
                            </div>
                            <div style="margin-top: 48px; display: flex; gap: 16px; align-items: center; border-top: 1px solid #f1f5f9; padding-top: 32px;">
                                <button type="submit" class="btn btn-primary" style="padding: 14px 40px; font-size: 1rem;">Xác nhận gán</button>
                                <a href="${pageContext.request.contextPath}/assign-asset" style="color: var(--secondary); font-weight: 600; text-decoration: none; margin-left: 12px;">Hủy bỏ</a>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <!-- Chat Assistant -->
    <%@include file="includes/chatbox.jsp" %>
    <style>
        @keyframes slideInLeft {
            from { opacity: 0; transform: translateX(-30px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
