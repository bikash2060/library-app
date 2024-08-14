<%@ page import="utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | E-library System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background: #f2f2f2;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 10px;
        }

        /* Styling Sign-Up Form */
        .signup-section .container {
            background: white;
            width: 500px;
            padding: 25px;
            margin: 50px auto 50px;
            border-top: 5px solid blue;
            box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.5);
        }

        .signup-section .container h2 {
            font-size: 24px;
            line-height: 24px;
            padding: 20px;
            text-align: center;
        }

        .input-name {
            width: 90%;
            position: relative;
            margin: 20px auto;
        }

        .lock {
            padding: 8px 11px;
        }

        .fname, .lname {
            width: 45%;
            padding: 8px 0 8px 45px;
        }

        .input-name span {
            margin-left: 35px;
        }

        .email, .password, .confirmPassword, .number, .username {
            width: 100%;
            padding: 8px 0 8px 45px;
        }

        .input-name i {
            position: absolute;
            font-size: 18px;
            color: blue;
            border-right: 1px solid #cccccc;
        }

        .envelope, .pass, .phoneNumber {
            padding: 8px;
        }

        .input-name input {
            font-size: 17px;
            border: 1px solid #cccccc;
            outline: none;
            -webkit-transition: all 0.30s ease-in-out;
            -moz-transition: all 0.30s ease-in-out;
            -ms-transition: all 0.30s ease-in-out;
            transition: all 0.30s ease-in-out;
        }

        input:hover {
            background-color: #fafafa;
        }

        input:focus {
            border: 1px solid #0866ff;
        }

        .btn {
            width: auto;
            padding: 5px 20px;
            cursor: pointer;
            background: #007bff;
            color: white;
            font-weight: 500;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link p {
            font-size: 0.9rem;
        }

        .login-link a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        #pass{
            position: relative;
        }

        #pass .showPass{
            position: absolute;
            top: 6%;
            right: 0;
            font-size: 16px;
            color: blue;
            padding: 8px;
            border: none;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        #pass .showPass:hover {
            color: #0056b3;
        }

        .error {
            color: red;
            font-size: 15px;
            margin: 6px 0;
            font-weight: 600;
            opacity: 0.5;
        }

        .message-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 10px;
            width: 90%;
            border-radius: 5px;
            margin: 0 auto;
        }

        .message-container.err{
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .message-container p {
            margin: 0;
        }

        .message-container .close-btn {
            cursor: pointer;
            font-size: 1.2em;
        }

        .close-btn i {
            color: inherit;
        }
    </style>
</head>
<body>

<%@ include file="Header.jsp" %>

<!-- SignUp Form -->
<div class="signup-section">
    <div class="container">
        <% String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE_KEY);
            if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <div class="message-container err">
            <p><%= errorMessage %></p>
            <span class="close-btn" onclick="this.parentElement.style.display='none';"><i class="fa-solid fa-x"></i></span>
        </div>
        <% } %>
        <h2>Sign Up</h2>
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/signup" method="post" id="signupForm">
                <div class="input-name">
                    <i class="fa-solid fa-user lock"></i>
                    <input type="text" placeholder="First Name" class="fname" name="firstName" value="<%= (request.getParameter("firstName") != null) ? request.getParameter("firstName") : "" %>">
                    <span>
                        <i class="fa-solid fa-user lock"></i>
                        <input type="text" placeholder="Last Name" class="lname" name="lastName" value="<%= (request.getParameter("lastName") != null) ? request.getParameter("lastName") : "" %>">
                    </span>
                    <div class="error" id="nameError"></div>
                </div>

                <div class="input-name">
                    <i class="fa-solid fa-envelope envelope"></i>
                    <input type="text" placeholder="Email" class="email" name="emailAddress" value="<%= (request.getParameter("emailAddress") != null) ? request.getParameter("emailAddress") : "" %>">
                    <div class="error" id="emailError"></div>
                </div>

                <div class="input-name" id="pass">
                    <i class="fa-solid fa-lock pass"></i>
                    <input type="password" placeholder="Password" class="password" name="password" value="<%= (request.getParameter("password") != null) ? request.getParameter("password") : "" %>">
                    <div class="error" id="passwordError"></div>
                </div>

                <div class="input-name">
                    <i class="fa-solid fa-lock pass"></i>
                    <input type="password" placeholder="Confirm Password" class="confirmPassword" name="confirmPassword" value="<%= (request.getParameter("confirmPassword") != null) ? request.getParameter("confirmPassword") : "" %>">
                    <div class="error" id="confirmPasswordError"></div>
                </div>

                <div class="input-name">
                    <i class="fa-solid fa-phone phoneNumber"></i>
                    <input type="text" placeholder="Phone Number" class="number" name="phoneNumber" value="<%= (request.getParameter("phoneNumber") != null) ? request.getParameter("phoneNumber") : "" %>">
                    <div class="error" id="phoneError"></div>
                </div>

                <div class="input-name">
                    <i class="fa-solid fa-user phoneNumber"></i>
                    <input type="text" placeholder="Username" class="username" name="username" value="<%= (request.getParameter("username") != null) ? request.getParameter("username") : "" %>">
                    <div class="error" id="usernameError"></div>
                </div>

                <div class="input-name">
                    <input type="submit" class="btn" value="Sing Up">
                </div>

                <div class="login-link">
                    <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Log In</a></p>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="Footer.jsp"%>
<script src="${pageContext.request.contextPath}/js/SignUpValidation.js"></script>
<script>
    function hideMessage(element) {
        element.parentNode.style.display = "none";
    }
</script>
</body>
</html>