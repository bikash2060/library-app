package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.UserDao;
import utils.SignUpValidation;
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

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute(StringUtils.USER_OBJECT);
        String dbPassword = user.getPassword();

        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        // Validation for Empty Field
        if(oldPassword == null || newPassword == null || confirmPassword == null ) {
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.EMPTY_FIELD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
            return;
        }

        // Validation for strong password
        if(!SignUpValidation.isValidPassword(newPassword)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.PASSWORD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
            return;
        }

        // Validation for new password and confirm password
        if(!newPassword.equals(confirmPassword)) {
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.CONFIRM_PASSWORD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
            return;
        }

        // Validation for old password and database password
        if(!dbPassword.equals(oldPassword)) {
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.OLD_PASSWORD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
            return;
        }

        int result = userDao.updateUserPassword(user, newPassword);
        switch (result) {
            case 1:
                req.getSession().setAttribute(StringUtils.SUCCESS_MESSAGE_KEY, StringUtils.USER_PASSWORD_UPDATE_SUCCESS_MESSAGE);
                resp.sendRedirect(req.getContextPath() + StringUtils.USER_PASSWORD_SERVLET);
                break;

            case 0:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.USER_UPDATE_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
                break;

            case -4:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.SERVER_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.USER_PASSWORD_PAGE).forward(req, resp);
                break;
        }
    }
}
