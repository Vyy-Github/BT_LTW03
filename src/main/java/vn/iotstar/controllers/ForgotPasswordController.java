package vn.iotstar.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.iotstar.entity.User;
import vn.iotstar.services.IUserService;
import vn.iotstar.services.impl.UserServiceImpl;
import vn.iotstar.utils.EmailUtility;

@WebServlet(urlPatterns = { "/forgot-password", "/reset-password" })
public class ForgotPasswordController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/forgot-password")) {
            req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
        } else if (path.equals("/reset-password")) {
            req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();

        if (path.equals("/forgot-password")) {
            String email = req.getParameter("email");
            User user = userService.findByEmail(email);

            if (user != null) {
                String otp = EmailUtility.generateOTP(6);
                user.setOtp(otp);
                userService.update(user);

                try {
                    String subject = "Mã OTP khôi phục mật khẩu";
                    String content = "<h3>Mã OTP đặt lại mật khẩu: <b style='color:red; font-size: 22px;'>" + otp
                            + "</b></h3>";
                    EmailUtility.sendEmail(email, subject, content);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                HttpSession session = req.getSession();
                session.setAttribute("resetEmail", email);
                resp.sendRedirect(req.getContextPath() + "/reset-password");
            } else {
                req.setAttribute("error", "Email không tồn tại trong hệ thống!");
                req.getRequestDispatcher("/views/forgot-password.jsp").forward(req, resp);
            }
        } else if (path.equals("/reset-password")) {
            HttpSession session = req.getSession();
            String email = (String) session.getAttribute("resetEmail");
            String otp = req.getParameter("otp");
            String newPassword = req.getParameter("newPassword");

            User user = userService.findByEmail(email);
            if (user != null && otp != null && otp.equals(user.getOtp())) {
                userService.resetPassword(email, newPassword);
                session.removeAttribute("resetEmail");
                resp.sendRedirect(req.getContextPath() + "/login?msg=reset_success");
            } else {
                req.setAttribute("error", "Mã OTP không chính xác!");
                req.getRequestDispatcher("/views/reset-password.jsp").forward(req, resp);
            }
        }
    }
}