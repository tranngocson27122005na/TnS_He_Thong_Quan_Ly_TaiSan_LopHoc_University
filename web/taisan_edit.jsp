<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.TaiSan" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Sửa Tài Sản - ASSET ERP</title>
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
                        <span style="font-weight: 600; color: var(--dark);">Cập nhật thông tin thiết bị</span>
                    </div>
                </header>
                <main class="content-body">
                    <% TaiSan ts=(TaiSan) request.getAttribute("ts"); %>
                    <% if (ts !=null) { %>
                    <div style="max-width: 900px; margin: 0 auto;">
                        <div
                            style="margin-bottom: 40px; display: flex; align-items: center; gap: 20px;">
                            <a href="taisan" class="btn btn-secondary"
                               style="border-radius: 50%; width: 48px; height: 48px; padding: 0; justify-content: center; background: white; box-shadow: var(--shadow);">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2.5">
                                <line x1="19" y1="12" x2="5" y2="12"></line>
                                <polyline points="12 19 5 12 12 5"></polyline>
                                </svg>
                            </a>
                            <div>
                                <% NguoiDung accEdit=(NguoiDung)session.getAttribute("account"); boolean
                                    isStaffOrAdmin=(accEdit !=null && (accEdit.getVaiTroId()==1 ||
                                    accEdit.getVaiTroId()==2)); %>
                                <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">
                                    <%= isStaffOrAdmin ? "Hiệu chỉnh: " : "Báo cáo: " %>
                                    <%= ts.getTenTaiSan() %>
                                </h1>
                                <p style="color: var(--text-muted);">
                                    <%= isStaffOrAdmin
                                        ? "Thay đổi các thông số kỹ thuật hoặc tình trạng tài sản."
                                        : "Cập nhật hiện trạng thực tế của thiết bị." %>
                                </p>
                            </div>
                        </div>

                        <div class="card"
                             style="padding: 48px; border: none; box-shadow: var(--shadow-lg);">
                            <form action="taisan?action=edit" method="post">
                                <input type="hidden" name="id" value="<%= ts.getId() %>">
                                <div class="form-grid">
                                    <div class="form-group">
                                        <label>Mã nhận diện (Không thay đổi nếu không cần thiết)</label>
                                        <input type="text" name="ma" value="<%= ts.getMaTaiSan() %>"
                                               <%=!isStaffOrAdmin
                                               ? "readonly style='background: #f1f5f9; cursor: not-allowed;'"
                                               : "" %>
                                               required>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên thiết bị</label>
                                        <input type="text" name="ten" value="<%= ts.getTenTaiSan() %>"
                                               <%=!isStaffOrAdmin
                                               ? "readonly style='background: #f1f5f9; cursor: not-allowed;'"
                                               : "" %>
                                               required>
                                    </div>
                                    <div class="form-group">
                                        <label>Danh mục</label>
                                        <select name="loaiId" <%=!isStaffOrAdmin
                                            ? "disabled style='background: #f1f5f9; cursor: not-allowed;'"
                                            : "" %>>
                                            <option value="1" <%=(ts.getLoaiTaiSanId()==1) ? "selected"
                                                                : "" %>>Máy chiếu</option>
                                            <option value="2" <%=(ts.getLoaiTaiSanId()==2) ? "selected"
                                                                : "" %>>Máy tính</option>
                                            <option value="3" <%=(ts.getLoaiTaiSanId()==3) ? "selected"
                                                                : "" %>>Điều hòa</option>
                                            <option value="4" <%=(ts.getLoaiTaiSanId()==4) ? "selected"
                                                                : "" %>>Loa</option>
                                            <option value="5" <%=(ts.getLoaiTaiSanId()==5) ? "selected"
                                                                : "" %>>Bàn ghế</option>
                                        </select>
                                        <% if (!isStaffOrAdmin) { %>
                                        <input type="hidden" name="loaiId"
                                               value="<%= ts.getLoaiTaiSanId() %>">
                                        <% } %>
                                    </div>
                                    <div class="form-group">
                                        <label>Nhà sản xuất</label>
                                        <input type="text" name="hang"
                                               value="<%= (ts.getHangSanXuat() != null) ? ts.getHangSanXuat() : "" %>"
                                               <%=!isStaffOrAdmin
                                               ? "readonly style='background: #f8fafc; cursor: not-allowed;'"
                                               : "" %>>
                                    </div>
                                    <div class="form-group">
                                        <label>Năm mua / Trang bị</label>
                                        <input type="number" name="nam" min="2000" max="2026"
                                               value="<%= ts.getNamMua() %>" <%=!isStaffOrAdmin
                                               ? "readonly style='background: #f8fafc; cursor: not-allowed;'"
                                               : "" %>>
                                    </div>
                                    <div class="form-group">
                                        <label>Tình trạng hiện tại</label>
                                        <select name="trangThaiId">
                                            <option value="1" <%=(ts.getTrangThaiId()==1) ? "selected"
                                                                : "" %>>Sẵn sàng</option>
                                            <option value="2" <%=(ts.getTrangThaiId()==2) ? "selected"
                                                                : "" %>>Đang sử dụng</option>
                                            <option value="3" <%=(ts.getTrangThaiId()==3) ? "selected"
                                                                : "" %>>Hỏng</option>
                                            <option value="4" <%=(ts.getTrangThaiId()==4) ? "selected"
                                                                : "" %>>Bảo trì</option>
                                        </select>
                                    </div>
                                    <div class="form-group full-width" style="grid-column: span 2;">
                                        <label>Thông tin bổ sung</label>
                                        <textarea name="moTa"
                                                  rows="4"><%= (ts.getMoTa() != null) ? ts.getMoTa() : "" %></textarea>
                                    </div>
                                </div>
                                <div
                                    style="margin-top: 48px; display: flex; gap: 16px; border-top: 1px solid #f1f5f9; padding-top: 32px;">
                                    <button type="submit" class="btn btn-primary"
                                            style="padding: 14px 40px;">
                                        <%= isStaffOrAdmin ? "Cập nhật hồ sơ" : "Gửi báo cáo tình trạng"
                                        %>
                                    </button>
                                    <a href="taisan"
                                       style="color: var(--secondary); font-weight: 600; text-decoration: none; margin-left: 12px;">Hủy
                                        thay đổi</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <% } else { %>
                    <div style="padding: 40px; text-align: center;">
                        <h2 style="color: var(--danger);">Lỗi!</h2>
                        <p>Dữ liệu tài sản này không tồn tại trong hệ thống.</p>
                        <a href="taisan" class="btn btn-primary" style="margin-top: 20px;">Quay lại
                            danh mục</a>
                    </div>
                    <% } %>
                </main>
            </div>
        </div>
        <!-- Chat Assistant -->
        <%@include file="includes/chatbox.jsp" %>
    </body>

</html>