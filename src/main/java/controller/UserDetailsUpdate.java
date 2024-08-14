package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;
import service.UserDao;
import utils.SignUpValidation;
import utils.StringUtils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

@WebServlet(asyncSupported = true, urlPatterns = StringUtils.USER_PROFILE_DETAILS_SERVLET)
@MultipartConfig
public class UserDetailsUpdate extends HttpServlet {
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
        req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute(StringUtils.USER_OBJECT);
        String previousImageName = user.getUserImage();

        String userID = req.getParameter("userID");
        int userId = Integer.parseInt(userID);
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String emailAddress = req.getParameter("emailAddress");
        String phoneNumber = req.getParameter("phoneNumber");
        String username = req.getParameter("username");
        Part userImage = req.getPart("image");

        String imageFileName = null;

        if(userImage != null && userImage.getSize() > 0) {
            imageFileName = userImage.getSubmittedFileName();

            try{
                FileOutputStream fos = new FileOutputStream(StringUtils.USER_PROFILE_IMAGE_DIRECTORY+imageFileName);
                InputStream is = userImage.getInputStream();

                byte[] buffer = new byte[is.available()];
                is.read(buffer);
                fos.write(buffer);
                fos.close();
            }
            catch(IOException e){
                e.printStackTrace();
            }
        }
        else{
            imageFileName = previousImageName;
        }

        // Validation for Empty Field
        if((firstName == null || firstName.isEmpty())|| (lastName == null || lastName.isEmpty()) || (phoneNumber == null || phoneNumber.isEmpty()) ||
            (emailAddress == null || emailAddress.isEmpty()) || (username == null || username.isEmpty())) {
            req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.EMPTY_FIELD_ERROR_MESSAGE);
            req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
            return;
        }

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
        newDetails.setUserID(userId);
        newDetails.setFirstName(firstName);
        newDetails.setLastName(lastName);
        newDetails.setEmailAddress(emailAddress);
        newDetails.setPhoneNumber(phoneNumber);
        newDetails.setUsername(username);
        newDetails.setUserImage(imageFileName);

        int result = userDao.updateUserInfo(newDetails);
        switch (result){
            case 1:
                req.getSession().setAttribute(StringUtils.SUCCESS_MESSAGE_KEY, StringUtils.USER_UPDATE_SUCCESS_MESSAGE);
                resp.sendRedirect(req.getContextPath() + StringUtils.USER_PROFILE_DETAILS_SERVLET);
                break;

            case 0:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.USER_UPDATE_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
                break;

            case -1:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.DUPLICATE_EMAIL_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
                break;

            case -2:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.DUPLICATE_PHONE_NUMBER_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
                break;

            case -3:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.DUPLICATE_USERNAME_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
                break;

            case -4:
                req.setAttribute(StringUtils.ERROR_MESSAGE_KEY, StringUtils.SERVER_ERROR_MESSAGE);
                req.getRequestDispatcher(StringUtils.USER_PROFILE_PAGE).forward(req, resp);
                break;
        }
    }
}
