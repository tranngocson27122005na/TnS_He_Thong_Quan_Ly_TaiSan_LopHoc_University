<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="my" uri="/WEB-INF/tlds/mytags" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Lịch Sử Di Chuyển - ASSET ERP</title>
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
                        <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Lịch sử di chuyển tài sản</h1>
                        <p style="color: var(--text-muted); margin-top: 4px;">Theo dõi mọi biến động vị trí của thiết bị.</p>
                    </div>
                </div>

                <div class="card">
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên tài sản</th>
                                    <th>Mô tả di chuyển</th>
                                    <th>Thời gian</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty requestScope.history}">
                                        <c:forEach var="h" items="${requestScope.history}">
                                            <tr>
                                                <td>
                                                    <span style="background: #f1f5f9; padding: 4px 8px; border-radius: 4px; font-size: 0.85rem;">
                                                        #${h.id}
                                                    </span>
                                                </td>
                                                <td>
                                                    <div style="font-weight: 700;">${h.tenTaiSan}</div>
                                                </td>
                                                <td>
                                                    <div style="color: var(--secondary); font-weight: 500;">
                                                        ${h.moTaDiChuyen}
                                                    </div>
                                                </td>
                                                <td>
                                                    <my:formatDate value="${h.ngayThayDoi}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="4" style="text-align: center; padding: 40px; color: var(--text-muted);">
                                                Chưa có dữ liệu lịch sử nào.
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
