<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Danh Sách Phòng Học - ASSET ERP</title>
            <!-- Import Bootstrap CDN -->
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
                                <span style="font-weight: 600; color: var(--dark);">
                                    ${sessionScope.account.hoTen}
                                </span>
                            </div>
                        </header>
                        <main class="content-body">
                            <div
                                style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px;">
                                <div>
                                    <h1 style="font-size: 2rem; font-weight: 800; color: var(--dark);">Quản lý phòng học
                                    </h1>
                                    <p style="color: var(--text-muted); margin-top: 4px;">Dữ liệu phòng học cập nhật
                                        theo thời gian thực.</p>
                                </div>
                                <div style="display: flex; gap: 16px; align-items: center;">
                                    <input type="text" id="quickFilter" placeholder="Tìm kiếm phòng..."
                                        style="padding: 10px 16px; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 0.95rem; min-width: 250px; outline: none; transition: border-color 0.2s;"
                                        onfocus="this.style.borderColor='var(--primary)'"
                                        onblur="this.style.borderColor='#e2e8f0'" onkeyup="filterTable()">
                                    <c:if
                                        test="${not empty sessionScope.account && (sessionScope.account.vaiTroId == 1 || sessionScope.account.vaiTroId == 2)}">
                                        <a href="phonghoc?action=add" class="btn btn-primary"
                                            style="padding: 10px 20px;">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                                stroke="currentColor" stroke-width="2.5" stroke-linecap="round"
                                                stroke-linejoin="round" style="margin-right: 6px;">
                                                <line x1="12" y1="5" x2="12" y2="19"></line>
                                                <line x1="5" y1="12" x2="19" y2="12"></line>
                                            </svg>
                                            Thêm phòng mới
                                        </a>
                                    </c:if>
                                </div>
                            </div>

                            <div class="card">
                                <div class="table-wrapper">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Mã phòng</th>
                                                <th>Tên phòng</th>
                                                <th>Tầng / Khu vực</th>
                                                <th>Sức chứa</th>
                                                <th>Mô tả</th>
                                                <th style="text-align: right;">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${not empty requestScope.list}">
                                                    <c:forEach var="ph" items="${requestScope.list}">
                                                        <tr>
                                                            <td>
                                                                <span
                                                                    style="background: #f1f5f9; padding: 6px 12px; border-radius: 8px; font-weight: 700; color: var(--primary);">
                                                                    ${ph.maPhong}
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <div style="font-weight: 700;">${ph.tenPhong}</div>
                                                            </td>
                                                            <td>
                                                                <span
                                                                    style="color: var(--secondary); font-weight: 500;">
                                                                    Tầng ${ph.tang}
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <strong>${ph.sucChua} người</strong>
                                                            </td>
                                                            <td>
                                                                <div
                                                                    style="font-size: 0.85rem; color: var(--text-muted);">
                                                                    ${empty ph.moTa ? 'Không có mô tả' : ph.moTa}
                                                                </div>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <c:choose>
                                                                    <c:when
                                                                        test="${not empty sessionScope.account && (sessionScope.account.vaiTroId == 1 || sessionScope.account.vaiTroId == 2)}">
                                                                        <div
                                                                            style="display: flex; gap: 8px; justify-content: flex-end;">
                                                                            <a href="phonghoc?action=edit&id=${ph.id}"
                                                                                class="btn btn-secondary"
                                                                                style="padding: 8px 16px;">Sửa</a>
                                                                            <button
                                                                                onclick="if (confirm('Xác nhận xóa phòng học này?')) window.location.href = 'phonghoc?action=delete&id=${ph.id}'"
                                                                                class="btn btn-danger"
                                                                                style="padding: 8px 16px;">
                                                                                Xóa
                                                                            </button>
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
                                                            Không có dữ liệu phòng học nào được tìm thấy.
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
                <script>
                    function filterTable() {
                        var input, filter, table, tr, td, i, txtValue;
                        input = document.getElementById("quickFilter");
                        filter = input.value.toUpperCase();
                        table = document.querySelector(".table-wrapper table");
                        tr = table.getElementsByTagName("tr");
                        for (i = 1; i < tr.length; i++) {
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