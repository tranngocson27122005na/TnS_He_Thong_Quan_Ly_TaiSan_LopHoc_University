<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@page import="model.NguoiDung" %>
        <% NguoiDung account=(NguoiDung) session.getAttribute("account"); String currentUri=request.getRequestURI(); %>
            <div class="sidebar">
                <div class="sidebar-header">
                    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"
                        stroke-linecap="round" stroke-linejoin="round" style="color: var(--primary)">
                        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    <h2>ASSET ERP</h2>
                </div>
                <div class="sidebar-menu">
                    <a href="${pageContext.request.contextPath}/home" class="menu-item <%= currentUri.endsWith("home") ? "active" : "" %>">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="3" width="7" height="7"></rect>
                            <rect x="14" y="3" width="7" height="7"></rect>
                            <rect x="14" y="14" width="7" height="7"></rect>
                            <rect x="3" y="14" width="7" height="7"></rect>
                        </svg>
                        Tổng quan
                    </a>
                    <a href="${pageContext.request.contextPath}/taisan" class="menu-item <%= currentUri.contains("taisan") ? "active" : "" %>">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path
                                d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z">
                            </path>
                            <polyline points="3.27 6.96 12 12.01 20.73 6.96"></polyline>
                            <line x1="12" y1="22.08" x2="12" y2="12"></line>
                        </svg>
                        Tài sản
                    </a>
                    <a href="${pageContext.request.contextPath}/phonghoc" class="menu-item <%= currentUri.contains("phonghoc") ? "active" : "" %>">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                            <line x1="3" y1="9" x2="21" y2="9"/>
                            <line x1="9" y1="21" x2="9" y2="9"/>
                        </svg>
                        Phòng học
                    </a>
                    <a href="${pageContext.request.contextPath}/assign-asset" class="menu-item <%= currentUri.contains("assign-asset") ? "active" : "" %>">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="8.5" cy="7" r="4"></circle>
                            <polyline points="17 11 19 13 23 9"></polyline>
                        </svg>
                        Gán tài sản
                    </a>
                    <a href="${pageContext.request.contextPath}/approval" class="menu-item <%= currentUri.contains("approval") ? "active" : "" %>">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                            <polyline points="14 2 14 8 20 8"></polyline>
                            <line x1="16" y1="13" x2="8" y2="13"></line>
                            <line x1="16" y1="17" x2="8" y2="17"></line>
                            <polyline points="10 9 9 9 8 9"></polyline>
                        </svg>
                        Phê duyệt
                    </a>
                    <a href="${pageContext.request.contextPath}/history" class="menu-item <%= currentUri.contains("history") ? "active" : "" %>">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"></circle>
                            <polyline points="12 6 12 12 16 14"></polyline>
                        </svg>
                        Lịch sử di chuyển
                    </a>
                    <a href="${pageContext.request.contextPath}/report" class="menu-item <%= currentUri.contains("report") ? "active" : "" %>">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path>
                            <path d="M22 12A10 10 0 0 0 12 2v10z"></path>
                        </svg>
                        Báo cáo thống kê
                    </a>
                </div>
                <div style="padding: 24px; border-top: 1px solid rgba(255, 255, 255, 0.05);">
                    <% if (account !=null) { %>
                        <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 20px;">
                            <div
                                style="width: 40px; height: 40px; border-radius: 50%; background: var(--primary); display: flex; align-items: center; justify-content: center; font-weight: 700;">
                                <%= account.getHoTen().substring(0, 1) %>
                            </div>
                            <div>
                                <p style="font-size: 0.875rem; font-weight: 600;">
                                    <%= account.getHoTen() %>
                                </p>
                                <p style="font-size: 0.75rem; color: var(--text-muted);">
                                    <%= account.getTenVaiTro() %>
                                </p>
                            </div>
                        </div>
                        <% } %>
                            <a href="login?action=logout" class="btn btn-danger"
                                style="width: 100%; justify-content: center;">
                                Đăng xuất
                            </a>
                </div>
            </div>