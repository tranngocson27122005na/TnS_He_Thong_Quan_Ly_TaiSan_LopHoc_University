package controller;

import dal.NguoiDungDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NguoiDung;
import utils.EmailUtil;

public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String step = request.getParameter("step");

        if ("verify".equals(step)) {
            request.getRequestDispatcher("verify_otp.jsp").forward(request, response);
            return;
        } else if ("reset".equals(step)) {
            request.getRequestDispatcher("reset_password.jsp").forward(request, response);
            return;
        }

        // Mặc định hiển thị trang yêu cầu otp
        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

        if ("requestOTP".equals(action)) {
            String email = request.getParameter("email");
            NguoiDungDAO dao = new NguoiDungDAO();
            try {
                NguoiDung user = dao.checkEmailExists(email);

                if (user == null) {
                    request.setAttribute("error", "Email không tồn tại trong hệ thống hoặc tài khoản đã bị khóa!");
                    request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
                } else {
                    String otp = EmailUtil.generateOTP();

                    boolean isSent = EmailUtil.sendEmail(email, "Mã xác thực lấy lại mật khẩu",
                            "Mã xác thực (OTP) của bạn là: " + otp);

                    if (isSent) {
                        session.setAttribute("otp", otp);
                        session.setAttribute("resetEmail", email);
                        session.setMaxInactiveInterval(10 * 60); // OTP có hiệu lực 10 phút

                        response.sendRedirect("forgot-password?step=verify");
                    } else {
                        request.setAttribute("error", "Không thể gửi email lúc này. Vui lòng thử lại sau!");
                        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
                    }
                }
            } finally {
                dao.close();
            }
        } else if ("verifyOTP".equals(action)) {
            String enteredOTP = request.getParameter("otp");
            String sessionOTP = (String) session.getAttribute("otp");

            if (sessionOTP != null && sessionOTP.equals(enteredOTP)) {
                // OTP đúng, chuyển hướng sang trang reset mật khẩu
                response.sendRedirect("forgot-password?step=reset");
            } else {
                request.setAttribute("error", "Mã OTP không hợp lệ hoặc đã hết hạn!");
                request.getRequestDispatcher("verify_otp.jsp").forward(request, response);
            }
        } else if ("resetPassword".equals(action)) {
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            String email = (String) session.getAttribute("resetEmail");

            if (email == null) {
                // Session expired hoặc người dùng trực tiếp truy cập trang
                response.sendRedirect("forgot-password");
                return;
            }

            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
                request.getRequestDispatcher("reset_password.jsp").forward(request, response);
            } else {
                NguoiDungDAO dao = new NguoiDungDAO();
                try {
                    boolean isUpdated = dao.updatePassword(email, newPassword);

                    if (isUpdated) {
                        session.removeAttribute("otp");
                        session.removeAttribute("resetEmail");
                        request.setAttribute("success", "Lấy lại mật khẩu thành công. Bạn có thể đăng nhập!");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        request.setAttribute("error", "Có lỗi xảy ra khi đổi mật khẩu. Vui lòng thử lại!");
                        request.getRequestDispatcher("reset_password.jsp").forward(request, response);
                    }
                } finally {
                    dao.close();
                }
            }
        }
    }
}
