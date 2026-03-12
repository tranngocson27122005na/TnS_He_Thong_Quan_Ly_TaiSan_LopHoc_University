<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="my" uri="/WEB-INF/tlds/mytags" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Phê Duyệt Yêu Cầu - ASSET ERP</title>
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
                        <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Danh sách chờ phê duyệt</h1>
                        <p style="color: var(--text-muted); margin-top: 4px;">Quản lý các yêu cầu mượn thiết bị từ cán bộ/giáo viên.</p>
                    </div>
                </div>

                <div class="card">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Người yêu cầu</th>
                                    <th>Tài sản</th>
                                    <th>Số lượng</th>
                                    <th>Ngày yêu cầu</th>
                                    <th>Trạng thái</th>
                                    <th style="text-align: right;">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty requestScope.list}">
                                        <c:forEach var="y" items="${requestScope.list}">
                                            <tr>
                                                <td>#${y.id}</td>
                                                <td>
                                                    <div style="font-weight: 700;">${y.tenNguoiYeuCau}</div>
                                                </td>
                                                <td>${y.tenTaiSan}</td>
                                                <td>${y.soLuong}</td>
                                                <td>
                                                    <my:formatDate value="${y.ngayYeuCau}" pattern="dd/MM/yyyy HH:mm"/>
                                                </td>
                                                <td>
                                                    <span class="badge ${y.trangThai == 'Da duyet' ? 'bg-success' : (y.trangThai == 'Tu choi' ? 'bg-danger' : 'bg-warning')}">
                                                        ${y.trangThai}
                                                    </span>
                                                </td>
                                                <td style="text-align: right;">
                                                    <c:if test="${y.trangThai == 'Cho phe duyet'}">
                                                        <div style="display: flex; gap: 8px; justify-content: flex-end;">
                                                            <a href="${pageContext.request.contextPath}/approval?action=approve&id=${y.id}" class="btn btn-success btn-sm">Duyệt</a>
                                                            <a href="${pageContext.request.contextPath}/approval?action=reject&id=${y.id}" class="btn btn-danger btn-sm">Từ chối</a>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="7" style="text-align: center; padding: 40px; color: var(--text-muted);">
                                                Không có yêu cầu nào đang chờ.
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
