package org.bookez.utils;

public class StringUtils {

    // Database Configuration
    public static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://localhost:3306/library_app";
    public static final String USER = "root";
    public static final String PASS = "Bishal@123";

    // Parameter
    public static final String FIRST_NAME = "firstName";
    public static final String LAST_NAME = "lastName";
    public static final String EMAIL_ADDRESS = "emailAddress";
    public static final String PASSWORD = "password";
    public static final String CONFIRM_PASSWORD = "confirmPassword";
    public static final String PHONE_NUMBER = "phoneNumber";
    public static final String USERNAME = "username";
    public static final String USER_OBJECT = "user";


    // SQL Queries
    public static final String GET_USER_BY_EMAIL = "SELECT * FROM user WHERE EmailAddress = ?";
    public static final String GET_USER_BY_PHONE = "SELECT * FROM user WHERE PhoneNumber = ?";
    public static final String GET_USER_BY_USERNAME = "SELECT * FROM user WHERE Username = ?";
    public static final String INSERT_USER = "INSERT INTO user (FirstName, LastName, EmailAddress, Password, PhoneNumber, Username) VALUES" +
            "(?,?,?,?,?,?)";

    // Servlets Mapping
    public static final String SIGNUP_SERVLET = "/signup";
    public static final String LOGIN_SERVLET = "/login";
    public static final String LOGOUT_SERVLET = "/logout";
    public static final String INDEX_SERVLET = "/index";
    public static final String BOOK_DETAILS_SERVLET = "/bookDetails";

    // JSP Route
    public static final String LOGIN_PAGE = "/view/Login.jsp";
    public static final String SIGN_UP_PAGE = "/view/SignUp.jsp";
    public static final String HOME_PAGE = "/Index.jsp";
    public static final String BOOK_DETAILS_PAGE = "/view/BookDetails.jsp";

    // Error Message Key - Global
    public static final String ERROR_MESSAGE_KEY = "errorMessage";
    public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occurred";

    // Error Message Value - SignUp Page
    public static final String FIRST_NAME_ERROR_MESSAGE = "First name is invalid";
    public static final String LAST_NAME_ERROR_MESSAGE = "Last name is invalid";
    public static final String EMAIL_ADDRESS_ERROR_MESSAGE = "Email address is invalid";
    public static final String PASSWORD_ERROR_MESSAGE = "Enter strong password";
    public static final String PHONE_NUMBER_ERROR_MESSAGE = "Phone number is invalid";
    public static final String CONFIRM_PASSWORD_ERROR_MESSAGE = "Password doesn't match";
    public static final String USER_REGISTRATION_ERROR_MESSAGE = "User registration failed";
    public static final String DUPLICATE_EMAIL_ERROR_MESSAGE = "Email address already exists";
    public static final String DUPLICATE_PHONE_NUMBER_ERROR_MESSAGE = "Phone number already exists";
    public static final String DUPLICATE_USERNAME_ERROR_MESSAGE = "Username already exists";

    // Error Message Value - Login Page
    public static final String USERNAME_NOT_FOUND_ERROR_MESSAGE = "Username not found";
    public static final String INCORRECT_PASSWORD_ERROR_MESSAGE = "Incorrect password";

    // Success Message Key
    public static final String SUCCESS_MESSAGE_KEY = "successMessage";
    public static final String SUCCESS_LOGIN_MESSAGE_KEY = "loginMessage";

    // Success Message Value - SignUp Page
    public static final String USER_SUCCESS_REGISTER_MESSAGE = "User registered successfully";

    // Success Message Value - Login Page
    public static final String USER_SUCCESS_LOGIN_MESSAGE = "User logged in successfully";
}