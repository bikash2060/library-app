package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import utils.SignUpValidation;
import utils.StringUtils;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.USER_PROFILE_UPDATE_SERVLET)
public class UserUpdateProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userID = req.getParameter("userID");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String emailAddress = req.getParameter("emailAddress");
        String phoneNumber = req.getParameter("phoneNumber");
        String username = req.getParameter("username");

        // Validation Check for First Name
        if(!SignUpValidation.isValidFirstName(firstName)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.FIRST_NAME_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Last Name
        if(!SignUpValidation.isValidLastName(lastName)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.LAST_NAME_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Email Address
        if(!SignUpValidation.isValidEmail(emailAddress)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.EMAIL_ADDRESS_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
            return;
        }

        // Validation Check for Phone Number
        if(!SignUpValidation.isValidNumber(phoneNumber)){
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.PHONE_NUMBER_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
            return;
        }

        User newDetails = new User();
        newDetails.setFirstName(firstName);
        newDetails.setLastName(lastName);
        newDetails.setEmailAddress(emailAddress);
        newDetails.setPhoneNumber(phoneNumber);
        newDetails.setUsername(username);

    }
}
