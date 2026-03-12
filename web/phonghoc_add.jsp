<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@page import="model.NguoiDung" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Thêm Phòng Học - ASSET ERP</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                rel="stylesheet">
        </head>

        <body>
            <div class="app-container">
                <%@include file="includes/sidebar.jsp" %>
                    <div class="main-content">
                        <header class="top-bar">
                            <div style="display: flex; align-items: center; gap: 12px;">
                                <span style="font-weight: 600; color: var(--dark);">Nhập mới phòng học</span>
                            </div>
                        </header>
                        <main class="content-body">
                            <div style="max-width: 900px; margin: 0 auto;">
                                <div
                                    style="margin-bottom: 40px; display: flex; align-items: center; gap: 20px; animation: slideInLeft 0.5s ease-out;">
                                    <a href="phonghoc" class="btn btn-secondary"
                                        style="border-radius: 50%; width: 48px; height: 48px; padding: 0; justify-content: center; background: white; box-shadow: var(--shadow);">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="2.5">
                                            <line x1="19" y1="12" x2="5" y2="12"></line>
                                            <polyline points="12 19 5 12 12 5"></polyline>
                                        </svg>
                                    </a>
                                    <div>
                                        <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Đăng ký phòng
                                            mới</h1>
                                        <p style="color: var(--text-muted);">Cập nhật hồ sơ phòng học/khu vực</p>
                                    </div>
                                </div>

                                <div class="card" style="padding: 48px; border: none; box-shadow: var(--shadow-lg);">
                                    <form action="phonghoc?action=add" method="post">
                                        <div class="form-grid">
                                            <div class="form-group">
                                                <label>Mã phòng</label>
                                                <input type="text" name="maPhong" placeholder="VD: P501" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Tên phòng</label>
                                                <input type="text" name="tenPhong"
                                                    placeholder="Tên hiện thị (vd: Phòng Lab 1)" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Tầng</label>
                                                <input type="number" name="tang" required value="1">
                                            </div>
                                            <div class="form-group">
                                                <label>Loại phòng</label>
                                                <select name="loaiPhongId">
                                                    <option value="1">🏢 Phòng lý thuyết</option>
                                                    <option value="2">💻 Phòng thực hành</option>
                                                    <option value="3">🏢 Phòng họp</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label>Sức chứa (Người)</label>
                                                <input type="number" name="sucChua" min="0" required value="30">
                                            </div>
                                            <div class="form-group full-width" style="grid-column: span 2;">
                                                <label>Ghi chú & Đặc tính</label>
                                                <textarea name="moTa" rows="4"
                                                    placeholder="VD: Phòng chuyên dụng IT..."></textarea>
                                            </div>
                                        </div>
                                        <div
                                            style="margin-top: 48px; display: flex; gap: 16px; align-items: center; border-top: 1px solid #f1f5f9; padding-top: 32px;">
                                            <button type="submit" class="btn btn-primary"
                                                style="padding: 14px 40px; font-size: 1rem;">Xác nhận lưu trữ</button>
                                            <a href="phonghoc"
                                                style="color: var(--secondary); font-weight: 600; text-decoration: none; margin-left: 12px;">Hủy
                                                bỏ thay đổi</a>
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
                        from {
                            opacity: 0;
                            transform: translateX(-30px);
                        }

                        to {
                            opacity: 1;
                            transform: translateX(0);
                        }
                    }
                </style>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>