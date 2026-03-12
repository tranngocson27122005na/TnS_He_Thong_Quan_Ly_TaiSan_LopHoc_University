<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="my" uri="/WEB-INF/tlds/mytags" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Gán Tài Sản - ASSET ERP</title>
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
                        <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Danh sách Gán tài sản</h1>
                        <p style="color: var(--text-muted); margin-top: 4px;">Quản lý vị trí của các thiết bị trong phòng học.</p>
                    </div>
                    <div style="display: flex; gap: 16px; align-items: center;">
                        <c:if test="${not empty sessionScope.account && (sessionScope.account.vaiTroId == 1 || sessionScope.account.vaiTroId == 2)}">
                            <a href="${pageContext.request.contextPath}/assign-asset?action=add" class="btn btn-primary" style="padding: 10px 20px;">
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                    stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                                    stroke-linejoin="round" style="margin-right: 6px;">
                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                </svg>
                                Thực hiện gán mới
                            </a>
                        </c:if>
                    </div>
                </div>

                <div class="card">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>Phòng học</th>
                                    <th>Tài sản</th>
                                    <th>Số lượng</th>
                                    <th>Người thực hiện</th>
                                    <th>Ngày gán</th>
                                    <th>Ghi chú</th>
                                    <th style="text-align: right;">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty requestScope.list}">
                                        <c:forEach var="pts" items="${requestScope.list}">
                                            <tr>
                                                <td>
                                                    <span style="font-weight: 700; color: var(--primary);">
                                                        ${pts.tenPhong}
                                                    </span>
                                                </td>
                                                <td>
                                                    <div style="font-weight: 700;">${pts.tenTaiSan}</div>
                                                </td>
                                                <td>
                                                    <strong>${pts.soLuong}</strong>
                                                </td>
                                                <td>
                                                    ${pts.tenNguoiGan}
                                                </td>
                                                <td>
                                                    <my:formatDate value="${pts.ngayGan}" pattern="dd/MM/yyyy HH:mm"/>
                                                </td>
                                                <td>
                                                    <div style="font-size: 0.85rem; color: var(--text-muted);">
                                                        ${pts.ghiChu}
                                                    </div>
                                                </td>
                                                <td style="text-align: right;">
                                                    <c:if test="${not empty sessionScope.account && (sessionScope.account.vaiTroId == 1 || sessionScope.account.vaiTroId == 2)}">
                                                        <button onclick="if (confirm('Xác nhận thu hồi gán tài sản này?')) window.location.href = '${pageContext.request.contextPath}/assign-asset?action=delete&id=${pts.id}'"
                                                            class="btn btn-danger"
                                                            style="padding: 8px 16px;">
                                                            Thu hồi
                                                        </button>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="7" style="text-align: center; padding: 40px; color: var(--text-muted);">
                                                Chưa có tài sản nào được gán vào phòng.
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
