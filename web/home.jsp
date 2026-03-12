<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.NguoiDung" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tổng Quan - ASSET ERP</title>
        <link href="css/style.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
              rel="stylesheet">
    </head>

    <body>
        <div class="app-container">
            <%@include file="includes/sidebar.jsp" %>
            <div class="main-content">
                <header class="top-bar">
                    <div style="display: flex; align-items: center; gap: 16px;">
                        <div style="text-align: right;">
                            <% NguoiDung acc=(NguoiDung) session.getAttribute("account"); %>
                            <div style="font-weight: 700; color: var(--dark);">
                                <%= acc !=null ? acc.getHoTen() : "Guest" %>
                            </div>
                            <div style="font-size: 0.75rem; color: var(--text-muted);">
                                <%= acc !=null ? acc.getTenVaiTro() : "Member" %>
                            </div>
                        </div>
                        <div
                            style="width: 40px; height: 40px; border-radius: 12px; background: var(--primary); display: flex; align-items: center; justify-content: center; color: white; font-weight: 700;">
                            <%= (acc !=null && acc.getHoTen() !=null) ? acc.getHoTen().substring(0,1) : "U" %>
                        </div>
                    </div>
                </header>
                <main class="content-body">
                    <div style="margin-bottom: 48px;">
                        <h1
                            style="font-size: 2.25rem; font-weight: 800; color: var(--dark); letter-spacing: -1px;">
                            Hệ thống Quản lý Tài sản</h1>
                        <p style="color: var(--text-muted); margin-top: 8px; font-size: 1.125rem;">Chào mừng bạn
                            quay trở lại 👋. Đây là tóm tắt tình trạng tài sản hôm nay.</p>
                    </div>

                    <div class="stats-container">
                        <div class="stat-card">
                            <div class="label">Tổng thiết bị</div>
                            <div class="value">2,840</div>
                            <div
                                style="display: flex; align-items: center; gap: 4px; color: var(--success); font-size: 0.875rem; font-weight: 600;">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="3">
                                <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline>
                                <polyline points="17 6 23 6 23 12"></polyline>
                                </svg>
                                +12% tháng này
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="label">Phòng tích hợp</div>
                            <div class="value">48</div>
                            <div style="color: var(--text-muted); font-size: 0.875rem;">Đã kiểm kê 100%</div>
                        </div>
                        <div class="stat-card">
                            <div class="label">Cần bảo trì</div>
                            <div class="value" style="color: var(--danger)">14</div>
                            <div
                                style="display: flex; align-items: center; gap: 4px; color: var(--danger); font-size: 0.875rem; font-weight: 600;">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="3">
                                <path
                                    d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z">
                                </path>
                                <line x1="12" y1="9" x2="12" y2="13"></line>
                                <line x1="12" y1="17" x2="12.01" y2="17"></line>
                                </svg>
                                Mức độ trung bình
                            </div>
                        </div>
                    </div>

                    <div class="card"
                         style="padding: 40px; background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%); color: white; border: none;">
                        <h2 style="font-size: 1.5rem; margin-bottom: 12px;">Báo cáo tổng hợp nhanh</h2>
                        <p style="color: #94a3b8; margin-bottom: 24px;">Bạn có 3 yêu cầu mượn thiết bị mới đang
                            chờ phê duyệt từ các khoa.</p>
                        <a href="${pageContext.request.contextPath}/approval" class="btn btn-primary">Xem chi tiết phê duyệt</a>
                    </div>
                </main>
            </div>
        </div>
        <!-- Chat Assistant -->
        <%@include file="includes/chatbox.jsp" %>
    </body>

</html>