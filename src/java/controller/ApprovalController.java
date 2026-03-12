package controller;

import dal.YeuCauMuonDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.YeuCauMuon;

public class ApprovalController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        YeuCauMuonDAO dao = new YeuCauMuonDAO();
        try {
            if ("approve".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.updateStatus(id, "Da duyet");
                response.sendRedirect("approval");
                return;
            } else if ("reject".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.updateStatus(id, "Tu choi");
                response.sendRedirect("approval");
                return;
            }

            List<YeuCauMuon> list = dao.getAll();
            request.setAttribute("list", list);
            request.getRequestDispatcher("approval_list.jsp").forward(request, response);
        } finally {
            dao.close();
        }
    }
}
