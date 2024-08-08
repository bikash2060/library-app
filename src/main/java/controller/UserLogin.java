package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.UserDao;
import utils.StringUtils;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.LOGIN_SERVLET)
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao;

    @Override
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
        req.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Retrieving data from form
        String username = req.getParameter(StringUtils.USERNAME);
        String password = req.getParameter(StringUtils.PASSWORD);

        User user = new User(username, password);
        int result = userDao.geUserInfo(user);

        switch (result){
            case 1:
                HttpSession session = req.getSession();
                session.setMaxInactiveInterval(300);
                session.setAttribute(StringUtils.USER_OBJECT, user);
                session.setAttribute(StringUtils.SUCCESS_LOGIN_MESSAGE_KEY, StringUtils.USER_SUCCESS_LOGIN_MESSAGE);
                resp.sendRedirect(req.getContextPath() + StringUtils.HOME_PAGE);
                break;

            case 0:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.INCORRECT_PASSWORD_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(req, resp);
                break;

            case -1:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.USERNAME_NOT_FOUND_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(req, resp);
                break;

            case -2:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.SERVER_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.LOGIN_PAGE).forward(req, resp);
                break;
        }
    }
}
