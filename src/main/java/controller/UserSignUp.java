package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import service.UserDao;
import utils.SignUpValidation;
import utils.StringUtils;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.SIGNUP_SERVLET)
public class UserSignUp extends HttpServlet {
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
        req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Retrieving data from form
        String firstName = req.getParameter(StringUtils.FIRST_NAME);
        String lastName = req.getParameter(StringUtils.LAST_NAME);
        String email = req.getParameter(StringUtils.EMAIL_ADDRESS);
        String password = req.getParameter(StringUtils.PASSWORD);
        String confirmPassword = req.getParameter(StringUtils.CONFIRM_PASSWORD);
        String phoneNumber = req.getParameter(StringUtils.PHONE_NUMBER);
        String username = req.getParameter(StringUtils.USERNAME);


        // Validation Check for First Name
        if(!SignUpValidation.isValidFirstName(firstName)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.FIRST_NAME_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Last Name
        if(!SignUpValidation.isValidLastName(lastName)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.LAST_NAME_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Email Address
        if(!SignUpValidation.isValidEmail(email)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.EMAIL_ADDRESS_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Strong Password
        if(!SignUpValidation.isValidPassword(password)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.PASSWORD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Phone Number
        if(!SignUpValidation.isValidNumber(phoneNumber)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.PHONE_NUMBER_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Password Confirmation
        if (!password.equals(confirmPassword)) {
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.CONFIRM_PASSWORD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
            return;
        }

        User user = new User(firstName, lastName, email, password, phoneNumber, username);
        int result = userDao.registerUser(user);
        switch (result){
            case 1:
                req.getSession().setAttribute(StringUtils.SUCCESS_MESSAGE_KEY, StringUtils.USER_SUCCESS_REGISTER_MESSAGE);
                resp.sendRedirect(req.getContextPath() + StringUtils.LOGIN_SERVLET);
                break;

            case 0:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.USER_REGISTRATION_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
                break;

            case -1:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.DUPLICATE_EMAIL_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
                break;

            case -2:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.DUPLICATE_PHONE_NUMBER_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
                break;

            case -3:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.DUPLICATE_USERNAME_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
                break;

            case -4:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.SERVER_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.SIGN_UP_PAGE).forward(req, resp);
                break;
        }
    }

}
