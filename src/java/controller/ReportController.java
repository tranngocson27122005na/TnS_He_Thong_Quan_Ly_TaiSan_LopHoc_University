package controller;

import dal.PhongHocDAO;
import dal.PhongTaiSanDAO;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PhongHoc;

public class ReportController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PhongHocDAO phDao = new PhongHocDAO();
        PhongTaiSanDAO ptsDao = new PhongTaiSanDAO();
        try {
            List<PhongHoc> rooms = phDao.getAll();
            Map<Integer, Integer> stats = ptsDao.getAssetStatistics();
            request.setAttribute("rooms", rooms);
            request.setAttribute("stats", stats);
            request.getRequestDispatcher("report_list.jsp").forward(request, response);
        } finally {
            phDao.close();
            ptsDao.close();
        }
    }
}
