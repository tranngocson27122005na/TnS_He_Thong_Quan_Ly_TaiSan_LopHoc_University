package controller;

import dal.PhongHocDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;
import model.PhongHoc;

public class PhongHocController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        PhongHocDAO dao = new PhongHocDAO();
        HttpSession session = request.getSession();
        NguoiDung acc = (NguoiDung) session.getAttribute("account");

        // Assuming roles 1-2 have full CRUD for Room
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
                    List<PhongHoc> list = dao.getAll();
                    request.setAttribute("list", list);
                    request.getRequestDispatcher("phonghoc_list.jsp").forward(request, response);
                    break;
                case "delete":
                    if (!canFullCRUD) {
                        response.sendRedirect("phonghoc");
                        return;
                    }
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        dao.delete(id);
                    } catch (Exception e) {
                    }
                    response.sendRedirect("phonghoc");
                    break;
                case "edit":
                    if (!canFullCRUD) { // Only admin/staff edit room
                        response.sendRedirect("phonghoc");
                        return;
                    }
                    try {
                        int idEdit = Integer.parseInt(request.getParameter("id"));
                        PhongHoc ph = dao.getById(idEdit);
                        request.setAttribute("ph", ph);
                        request.getRequestDispatcher("phonghoc_edit.jsp").forward(request, response);
                    } catch (Exception e) {
                        response.sendRedirect("phonghoc");
                    }
                    break;
                case "add":
                    if (!canFullCRUD) {
                        response.sendRedirect("phonghoc");
                        return;
                    }
                    request.getRequestDispatcher("phonghoc_add.jsp").forward(request, response);
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
        PhongHocDAO dao = new PhongHocDAO();

        HttpSession session = request.getSession();
        NguoiDung acc = (NguoiDung) session.getAttribute("account");
        boolean canFullCRUD = (acc != null && (acc.getVaiTroId() == 1 || acc.getVaiTroId() == 2));

        if (!canFullCRUD) {
            dao.close();
            response.sendRedirect("phonghoc");
            return;
        }

        try {
            String maPhong = request.getParameter("maPhong");
            String tenPhong = request.getParameter("tenPhong");
            int tang = Integer.parseInt(request.getParameter("tang"));
            int loaiPhongId = Integer.parseInt(request.getParameter("loaiPhongId"));
            int sucChua = Integer.parseInt(request.getParameter("sucChua"));
            String moTa = request.getParameter("moTa");

            PhongHoc p = new PhongHoc();
            p.setMaPhong(maPhong);
            p.setTenPhong(tenPhong);
            p.setTang(tang);
            p.setLoaiPhongId(loaiPhongId);
            p.setSucChua(sucChua);
            p.setMoTa(moTa);

            if ("add".equals(action)) {
                dao.insert(p);
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                p.setId(id);
                dao.update(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dao.close();
        }
        response.sendRedirect("phonghoc");
    }
}
