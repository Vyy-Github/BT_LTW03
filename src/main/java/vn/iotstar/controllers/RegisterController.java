package vn.iotstar.controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.iotstar.services.IUserService;
import vn.iotstar.services.impl.UserServiceImpl;

@WebServlet(urlPatterns = { "/register", "/verify-otp" })
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/register")) {
            req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
        } else if (path.equals("/verify-otp")) {
            req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();

        if (path.equals("/register")) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String email = req.getParameter("email");
            String fullname = req.getParameter("fullname");

            boolean isSuccess = userService.register(username, password, email, fullname);
            if (isSuccess) {
                req.getSession().setAttribute("verifyEmail", email);
                resp.sendRedirect(req.getContextPath() + "/verify-otp");
            } else {
                req.setAttribute("error", "Username hoặc Email đã tồn tại!");
                req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
            }
        } else if (path.equals("/verify-otp")) {
            String email = (String) req.getSession().getAttribute("verifyEmail");
            String otp = req.getParameter("otp");

            if (userService.verifyOTP(email, otp)) {
                req.getSession().removeAttribute("verifyEmail");
                resp.sendRedirect(req.getContextPath() + "/login?msg=active_success");
            } else {
                req.setAttribute("error", "Mã OTP không hợp lệ!");
                req.getRequestDispatcher("/views/verify-otp.jsp").forward(req, resp);
            }
        }
    }
}