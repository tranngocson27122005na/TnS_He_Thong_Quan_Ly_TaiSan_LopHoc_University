package controller;

import dal.PhongHocDAO;
import dal.PhongTaiSanDAO;
import dal.TaiSanDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;
import model.PhongHoc;
import model.PhongTaiSan;
import model.TaiSan;

public class AssignAssetController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        PhongTaiSanDAO ptsDao = new PhongTaiSanDAO();
        try {
            if ("list".equals(action)) {
                List<PhongTaiSan> list = ptsDao.getAllWithInfo();
                request.setAttribute("list", list);
                request.getRequestDispatcher("assign_asset_list.jsp").forward(request, response);
            } else if ("add".equals(action)) {
                PhongHocDAO phDao = new PhongHocDAO();
                TaiSanDAO tsDao = new TaiSanDAO();
                try {
                    List<PhongHoc> rooms = phDao.getAll();
                    List<TaiSan> assets = tsDao.getAll();
                    request.setAttribute("rooms", rooms);
                    request.setAttribute("assets", assets);
                    request.getRequestDispatcher("assign_asset_add.jsp").forward(request, response);
                } finally {
                    phDao.close();
                    tsDao.close();
                }
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                ptsDao.deleteAssignment(id);
                response.sendRedirect("assign-asset");
            }
        } finally {
            ptsDao.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int phongId = Integer.parseInt(request.getParameter("phongId"));
        int taiSanId = Integer.parseInt(request.getParameter("taiSanId"));
        int soLuong = Integer.parseInt(request.getParameter("soLuong"));
        String ghiChu = request.getParameter("ghiChu");

        HttpSession session = request.getSession();
        NguoiDung acc = (NguoiDung) session.getAttribute("account");
        
        if (acc == null) {
            response.sendRedirect("login");
            return;
        }

        PhongTaiSan pts = new PhongTaiSan();
        pts.setPhongId(phongId);
        pts.setTaiSanId(taiSanId);
        pts.setSoLuong(soLuong);
        pts.setGhiChu(ghiChu);
        pts.setNguoiGan(acc.getId());

        PhongTaiSanDAO dao = new PhongTaiSanDAO();
        try {
            dao.assignAsset(pts);
        } finally {
            dao.close();
        }
        response.sendRedirect("assign-asset");
    }
}
