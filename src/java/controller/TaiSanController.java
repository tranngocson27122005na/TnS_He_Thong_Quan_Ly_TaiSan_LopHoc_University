package controller;

import dal.TaiSanDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;
import model.TaiSan;

public class TaiSanController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        TaiSanDAO dao = new TaiSanDAO();
        HttpSession session = request.getSession();
        NguoiDung acc = (NguoiDung) session.getAttribute("account");

        // Roles 1-4 can view/edit. Roles 1-2 have full CRUD.
        boolean canViewEdit = (acc != null && acc.getVaiTroId() >= 1 && acc.getVaiTroId() <= 4);
        boolean canFullCRUD = (acc != null && (acc.getVaiTroId() == 1 || acc.getVaiTroId() == 2));

        if (!canViewEdit) {
            dao.close();
            response.sendRedirect("login");
            return;
        }

        try {
            switch (action) {
                case "list":
                    String keyword = request.getParameter("keyword");
                    List<TaiSan> list;
                    if (keyword != null && !keyword.trim().isEmpty()) {
                        list = dao.searchByName(keyword.trim());
                        request.setAttribute("keyword", keyword.trim());
                    } else {
                        list = dao.getAll();
                    }
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("taisan_list.jsp").forward(request, response);
                    break;
                case "delete":
                    if (!canFullCRUD) {
                        response.sendRedirect("taisan");
                        return;
                    }
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        dao.delete(id);
                    } catch (Exception e) {
                    }
                    response.sendRedirect("taisan");
                    break;
                case "edit":
                    if (!canViewEdit) {
                        response.sendRedirect("taisan");
                        return;
                    }
                    try {
                        int idEdit = Integer.parseInt(request.getParameter("id"));
                        TaiSan ts = dao.getById(idEdit);
                        request.setAttribute("ts", ts);
                        request.getRequestDispatcher("taisan_edit.jsp").forward(request, response);
                    } catch (Exception e) {
                        response.sendRedirect("taisan");
                    }
                    break;
                case "add":
                    if (!canFullCRUD) {
                        response.sendRedirect("taisan");
                        return;
                    }
                    request.getRequestDispatcher("taisan_add.jsp").forward(request, response);
                    break;
            }
        } finally {
            dao.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        TaiSanDAO dao = new TaiSanDAO();

        HttpSession session = request.getSession();
        NguoiDung acc = (NguoiDung) session.getAttribute("account");
        boolean canFullCRUD = (acc != null && (acc.getVaiTroId() == 1 || acc.getVaiTroId() == 2));

        // Security check: Authorized roles (1-4) can POST data
        if (acc == null || acc.getVaiTroId() < 1 || acc.getVaiTroId() > 4) {
            dao.close();
            response.sendRedirect("taisan");
            return;
        }

        try {
            String maTaiSan = request.getParameter("ma");
            String tenTaiSan = request.getParameter("ten");
            int loaiId = Integer.parseInt(request.getParameter("loaiId"));
            String hangSX = request.getParameter("hang");
            int namMua = Integer.parseInt(request.getParameter("nam"));
            int trangThaiId = Integer.parseInt(request.getParameter("trangThaiId"));
            String moTa = request.getParameter("moTa");

            TaiSan ts = new TaiSan();
            ts.setMaTaiSan(maTaiSan);
            ts.setTenTaiSan(tenTaiSan);
            ts.setLoaiTaiSanId(loaiId);
            ts.setHangSanXuat(hangSX);
            ts.setNamMua(namMua);
            ts.setTrangThaiId(trangThaiId);
            ts.setMoTa(moTa);

            if ("add".equals(action)) {
                if (!canFullCRUD) {
                    response.sendRedirect("taisan");
                    return;
                }
                dao.insert(ts);
            } else if ("edit".equals(action)) {
                // Everyone (including Students) can report/edit
                int id = Integer.parseInt(request.getParameter("id"));
                ts.setId(id);
                dao.update(ts);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dao.close();
        }
        response.sendRedirect("taisan");
    }
}
