package controller;

import dal.NguoiDungDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("login");
            return;
        }
        // Hiển thị trang đăng nhập
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String u = request.getParameter("user");
        String p = request.getParameter("pass");

        System.out.println("Login attempt: " + u); // Log để debug

        NguoiDungDAO d = new NguoiDungDAO();
        try {
            NguoiDung n = d.login(u, p);

            if (n == null) {
                System.out.println("Login failed for: " + u);
                request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                System.out.println("Login success: " + n.getHoTen());
                HttpSession session = request.getSession();
                session.setAttribute("account", n);
                response.sendRedirect("home");
            }
        } finally {
            d.close();
        }
    }
}
