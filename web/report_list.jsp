<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Báo Cáo Thống Kê - ASSET ERP</title>
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
                    <span style="font-weight: 600; color: var(--dark);">
                        ${sessionScope.account.hoTen}
                    </span>
                </div>
            </header>
            <main class="content-body">
                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
                    <div>
                        <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Báo cáo thống kê theo phòng</h1>
                        <p style="color: var(--text-muted); margin-top: 4px;">Tổng quan số lượng thiết bị tại mỗi khu vực.</p>
                    </div>
                </div>

                <div class="card">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>Mã phòng</th>
                                    <th>Tên phòng</th>
                                    <th>Vị trí (Tầng)</th>
                                    <th>Tổng số lượng thiết bị</th>
                                    <th style="text-align: right;">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty requestScope.rooms}">
                                        <c:forEach var="r" items="${requestScope.rooms}">
                                            <tr>
                                                <td>
                                                    <span style="background: #f1f5f9; padding: 6px 12px; border-radius: 8px; font-weight: 700; color: var(--primary);">
                                                        ${r.maPhong}
                                                    </span>
                                                </td>
                                                <td>
                                                    <div style="font-weight: 700;">${r.tenPhong}</div>
                                                </td>
                                                <td>
                                                    Tầng ${r.tang}
                                                </td>
                                                <td>
                                                    <span class="badge bg-primary" style="font-size: 1rem;">
                                                        ${empty requestScope.stats[r.id] ? 0 : requestScope.stats[r.id]}
                                                    </span>
                                                </td>
                                                <td style="text-align: right;">
                                                    <a href="${pageContext.request.contextPath}/assign-asset?action=list" class="btn btn-secondary btn-sm">Chi tiết gán</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="5" style="text-align: center; padding: 40px; color: var(--text-muted);">
                                                Không có dữ liệu phòng học.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <!-- Chat Assistant -->
    <%@include file="includes/chatbox.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
