package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserDao;
import utils.StringUtils;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.USER_PASSWORD_SERVLET)

public class UserPasswordUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() throws ServletException {
        super.init();
        try {
            this.userDao = new UserDao();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        // Validation for Empty Field
        if((oldPassword == null || oldPassword.trim().isEmpty())|| (newPassword == null || newPassword.trim().isEmpty()) || (confirmPassword == null || confirmPassword.trim().isEmpty()) ) {
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.EMPTY_FIELD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
            return;
        }
        System.out.println(oldPassword);
        System.out.println(newPassword);
        System.out.println(confirmPassword);

        // Validation for new password and confirm password
        if(!newPassword.equals(confirmPassword)) {
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.CONFIRM_PASSWORD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
            return;
        }
    }
}
