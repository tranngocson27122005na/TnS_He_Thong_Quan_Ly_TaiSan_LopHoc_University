<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib prefix="my" uri="/WEB-INF/tlds/mytags" %>
            <%@page import="java.util.ArrayList" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <title>Danh Sách Tài Sản - ASSET ERP</title>
                    <!-- Import Bootstrap CDN -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet">
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
                                        <span style="font-weight: 600; color: var(--dark);">
                                            ${sessionScope.account.hoTen}
                                        </span>
                                    </div>
                                </header>
                                <main class="content-body">
                                    <div
                                        style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
                                        <div>
                                            <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Kho tài
                                                sản
                                                kỹ thuật</h1>
                                            <p style="color: var(--text-muted); margin-top: 4px;">Dữ liệu thiết bị được
                                                cập
                                                nhật theo thời gian thực.</p>
                                        </div>
                                        <div style="display: flex; gap: 16px; align-items: center;">
                                            <form action="taisan" method="GET"
                                                style="display: flex; gap: 8px; margin: 0;">
                                                <input type="hidden" name="action" value="list">
                                                <input type="text" id="quickFilter" name="keyword"
                                                    placeholder="Tìm tên tài sản nhanh..."
                                                    value="${requestScope.keyword}"
                                                    style="padding: 10px 16px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 0.95rem; min-width: 250px; outline: none; transition: border-color 0.2s;"
                                                    onfocus="this.style.borderColor='var(--primary)'"
                                                    onblur="this.style.borderColor='#e2e8f0'" onkeyup="filterTable()">
                                                <button type="submit" class="btn btn-secondary"
                                                    style="padding: 10px 20px; font-weight: 600;">
                                                    Tìm Server
                                                </button>
                                            </form>
                                            <c:if
                                                test="${not empty sessionScope.account && (sessionScope.account.vaiTroId == 1 || sessionScope.account.vaiTroId == 2)}">
                                                <a href="taisan?action=add" class="btn btn-primary"
                                                    style="padding: 10px 20px;">
                                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                                        stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                                                        stroke-linejoin="round" style="margin-right: 6px;">
                                                        <line x1="12" y1="5" x2="12" y2="19"></line>
                                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                                    </svg>
                                                    Thêm tài sản mới
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>

                                    <div class="card">
                                        <div class="table-wrapper">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>Mã nhận diện</th>
                                                        <th>Tên thiết bị & Mô tả</th>
                                                        <th>Loại tài sản</th>
                                                        <th>Nhãn hiệu</th>
                                                        <th>Trạng thái</th>
                                                        <th>Ngày Tạo (Custom Tag)</th>
                                                        <th style="text-align: right;">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:choose>
                                                        <c:when test="${not empty requestScope.list}">
                                                            <c:forEach var="ts" items="${requestScope.list}">
                                                                <tr>
                                                                    <td>
                                                                        <span
                                                                            style="background: #f1f5f9; padding: 6px 12px; border-radius: 8px; font-weight: 700; color: var(--primary);">
                                                                            ${ts.maTaiSan}
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <div style="font-weight: 700;">
                                                                            ${ts.tenTaiSan}
                                                                        </div>
                                                                        <div
                                                                            style="font-size: 0.75rem; color: var(--text-muted);">
                                                                            ${empty ts.moTa ? 'Chưa có mô tả' : ts.moTa}
                                                                        </div>
                                                                    </td>
                                                                    <td>
                                                                        <span
                                                                            style="color: var(--secondary); font-weight: 500;">
                                                                            ${ts.tenLoaiTaiSan}
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <strong>${ts.hangSanXuat}</strong>
                                                                    </td>
                                                                    <td>
                                                                        <span
                                                                            class="badge ${ts.trangThaiId == 1 ? 'badge-ready' : (ts.trangThaiId == 2 ? 'badge-used' : 'badge-broken')}">
                                                                            <div
                                                                                style="width: 6px; height: 6px; border-radius: 50%; background: currentColor;">
                                                                            </div>
                                                                            ${ts.tenTrangThai}
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <span
                                                                            style="font-size: 0.85rem; color: #64748b;">
                                                                            <my:formatDate value="${ts.ngayTao}"
                                                                                pattern="dd/MM/yyyy" />
                                                                        </span>
                                                                    </td>
                                                                    <td style="text-align: right;">
                                                                        <c:choose>
                                                                            <c:when
                                                                                test="${not empty sessionScope.account && sessionScope.account.vaiTroId >= 1 && sessionScope.account.vaiTroId <= 4}">
                                                                                <div
                                                                                    style="display: flex; gap: 8px; justify-content: flex-end;">
                                                                                    <a href="taisan?action=edit&id=${ts.id}"
                                                                                        class="btn btn-secondary"
                                                                                        style="padding: 8px 16px;">
                                                                                        ${sessionScope.account.vaiTroId
                                                                                        <= 2 ? 'Sửa' : 'Báo cáo' } </a>
                                                                                            <c:if
                                                                                                test="${sessionScope.account.vaiTroId <= 2}">
                                                                                                <button
                                                                                                    onclick="if (confirm('Xác nhận xóa tài sản này?')) window.location.href = 'taisan?action=delete&id=${ts.id}'"
                                                                                                    class="btn btn-danger"
                                                                                                    style="padding: 8px 16px;">
                                                                                                    Xóa
                                                                                                </button>
                                                                                            </c:if>
                                                                                </div>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span
                                                                                    style="color: var(--text-muted); font-size: 0.8rem; font-style: italic;">Chỉ
                                                                                    xem</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr>
                                                                <td colspan="6"
                                                                    style="text-align: center; padding: 40px; color: var(--text-muted);">
                                                                    Không có dữ liệu tài sản nào được tìm thấy.
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
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                        <script>
                            function filterTable() {
                                var input, filter, table, tr, td, i, txtValue;
                                input = document.getElementById("quickFilter");
                                filter = input.value.toUpperCase();
                                table = document.querySelector(".table-wrapper table");
                                tr = table.getElementsByTagName("tr");
                                for (i = 1; i < tr.length; i++) {
                                    // Check item name column
                                    td = tr[i].getElementsByTagName("td")[1];
                                    if (td) {
                                        txtValue = td.textContent || td.innerText;
                                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                            tr[i].style.display = "";
                                        } else {
                                            tr[i].style.display = "none";
                                        }
                                    }
                                }
                            }
                        </script>
                </body>

                </html>