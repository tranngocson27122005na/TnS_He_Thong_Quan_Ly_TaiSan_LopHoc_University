<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.NguoiDung" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Thêm Tài Sản - ASSET ERP</title>
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
                        <span style="font-weight: 600; color: var(--dark);">Nhập mới thiết bị</span>
                    </div>
                </header>
                <main class="content-body">
                    <div style="max-width: 900px; margin: 0 auto;">
                        <div
                            style="margin-bottom: 40px; display: flex; align-items: center; gap: 20px; animation: slideInLeft 0.5s ease-out;">
                            <a href="taisan" class="btn btn-secondary"
                               style="border-radius: 50%; width: 48px; height: 48px; padding: 0; justify-content: center; background: white; box-shadow: var(--shadow);">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2.5">
                                <line x1="19" y1="12" x2="5" y2="12"></line>
                                <polyline points="12 19 5 12 12 5"></polyline>
                                </svg>
                            </a>
                            <div>
                                <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Đăng ký tài
                                    sản mới</h1>
                                <p style="color: var(--text-muted);">Cập nhật hồ sơ thiết bị vào kho kỹ thuật.
                                </p>
                            </div>
                        </div>

                        <div class="card" style="padding: 48px; border: none; box-shadow: var(--shadow-lg);">
                            <form action="taisan?action=add" method="post">
                                <div class="form-grid">
                                    <div class="form-group">
                                        <label>Mã tài sản (ID nhận diện)</label>
                                        <input type="text" name="ma" placeholder="VD: PC-2024-01" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên thiết bị</label>
                                        <input type="text" name="ten" placeholder="Nhập tên tài sản chính xác"
                                               required>
                                    </div>
                                    <div class="form-group">
                                        <label>Loại danh mục</label>
                                        <select name="loaiId">
                                            <option value="1">🖥️ Máy chiếu (Projector)</option>
                                            <option value="2">💻 Máy tính (PC/Laptop)</option>
                                            <option value="3">❄️ Điều hòa (Air Conditioner)</option>
                                            <option value="4">🔊 Loa & Âm thanh</option>
                                            <option value="5">🪑 Bàn ghế & Nội thất</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Nhà máy / Hãng sản xuất</label>
                                        <input type="text" name="hang"
                                               placeholder="VD: Dell, Samsung, Panasonic...">
                                    </div>
                                    <div class="form-group">
                                        <label>Năm trang bị</label>
                                        <input type="number" name="nam" min="2000" max="2026" value="2024">
                                    </div>
                                    <div class="form-group">
                                        <label>Phân loại hiện trạng</label>
                                        <select name="trangThaiId">
                                            <option value="1">🟢 Sẵn sàng bàn giao</option>
                                            <option value="2">🔵 Đang trong quá trình sử dụng</option>
                                            <option value="3">🔴 Đã lỗi / Hỏng nặng</option>
                                            <option value="4">🟠 Đang bảo trì định kỳ</option>
                                        </select>
                                    </div>
                                    <div class="form-group full-width" style="grid-column: span 2;">
                                        <label>Ghi chú & Đặc tính kỹ thuật</label>
                                        <textarea name="moTa" rows="4"
                                                  placeholder="Ví dụ: Cấu hình Ram 16GB, Room 502, Tình trạng 90%..."></textarea>
                                    </div>
                                </div>
                                <div
                                    style="margin-top: 48px; display: flex; gap: 16px; align-items: center; border-top: 1px solid #f1f5f9; padding-top: 32px;">
                                    <button type="submit" class="btn btn-primary"
                                            style="padding: 14px 40px; font-size: 1rem;">Xác nhận lưu trữ</button>
                                    <a href="taisan"
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
    </body>

</html>