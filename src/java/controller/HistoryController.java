package controller;

import dal.PhongTaiSanDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LichSuDiChuyen;

public class HistoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PhongTaiSanDAO dao = new PhongTaiSanDAO();
        try {
            List<LichSuDiChuyen> list = dao.getAllMovementHistory();
            request.setAttribute("history", list);
            request.getRequestDispatcher("history_list.jsp").forward(request, response);
        } finally {
            dao.close();
        }
    }
}
