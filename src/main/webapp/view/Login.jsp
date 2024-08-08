<%@ page import="org.bookez.utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | E-library System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        body{
            font-family:'Montserrat', sans-serif;
        }

        .container{
            max-width: 1200px;
            margin: 0 auto;
            padding: 10px;
        }

        /* Styling Log-In Form */
        .login-section .container{
            background: white;
            width: 400px;
            padding: 25px;
            margin: 65px auto 65px;
            border-top: 5px solid blue;
            box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.5);
        }

        .login-section .container h2{
            font-size: 24px;
            line-height: 24px;
            padding: 20px;
            text-align: center;
        }

        .input-name {
            width: 90%;
            position: relative;
            margin: 10px auto;
        }

        .lock{
            padding: 8px 11px;
        }

        .username, .password{
            width: 100%;
            padding: 8px 0 8px 45px;
        }

        .input-name i{
            position: absolute;
            font-size: 21px;
            color: blue;
            border-right: 1px solid #cccccc;
        }

        .user, .pass{
            padding: 8px;
        }

        .input-name input{
            font-size: 17px;
            border: 1px solid #cccccc;
            outline: none;
            -webkit-transition: all 0.30s ease-in-out;
            -moz-transition: all 0.30s ease-in-out;
            -ms-transition: all 0.30s ease-in-out;
            transition: all 0.30s ease-in-out;
        }

        input:hover{
            background-color: #fafafa;
        }

        input:focus{
            border: 1px solid #0866ff;
        }

        .btn{
            width: 100%;
            line-height: 1.6;
            font-weight: 600;
            padding: 5px 20px;
            cursor: pointer;
            background: #007bff;
            color: white;
        }

        .btn:hover{
            background-color: #0056b3;
        }

        .input-name a{
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: 0.2s;
        }

        .input-name a:hover{
            text-decoration: underline;
        }

        label{
            color: #706e6e;
        }

        input[type="checkbox"]{
            cursor: pointer;
        }

        #username-error, #password-error{
            display: inline-block;
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

        .message-container.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .message-container.err{
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .message-container .close-btn {
            cursor: pointer;
        }

        .close-btn i {
            color: inherit;
        }
    </style>

</head>
<body>
<%@ include file="Header.jsp" %>

<!-- Login Form -->
<div class="login-section">
    <div class="container">
        <% String errorMessage = (String) request.getAttribute(StringUtils.ERROR_MESSAGE_KEY);
            if (errorMessage != null && !errorMessage.isEmpty()) { %>
        <div class="message-container err">
            <p><%= errorMessage %></p>
            <span class="close-btn" onclick="this.parentElement.style.display='none';"><i class="fa-solid fa-x"></i></span>
        </div>
        <% } %>
        <% String successMessage = (String) session.getAttribute(StringUtils.SUCCESS_MESSAGE_KEY);
            if (successMessage != null && !successMessage.isEmpty()) { %>
        <div class="message-container success">
            <span><%= successMessage %></span>
            <span class="close-btn" onclick="this.parentElement.style.display='none';"><i class="fa-solid fa-x"></i></span>
        </div>
        <%
            session.removeAttribute("successMessage");
        %>
        <% } %>
        <h2>Log In</h2>
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/login" id="form" method="post">

                <div class="input-name">
                    <i class="fa-solid fa-user user"></i>
                    <input type="text" placeholder="Username" class="username" name="username" id="username" value="<%= (request.getParameter("username") != null) ? request.getParameter("username") : "" %>">
                    <span id="username-error"></span>
                </div>

                <div class="input-name">
                    <i class="fa-solid fa-lock pass"></i>
                    <input type="password" placeholder="Password" class="password" name="password" id="password">
                    <span id="password-error"></span>
                </div>

                <div class="input-name">
                    <input type="submit" class="btn" value="Login">
                </div>

                <div class="input-name">
                    <p>Don't have account? <a href="${pageContext.request.contextPath}/signup">Create new account </a></p>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp"%>
<script src="${pageContext.request.contextPath}/js/FormValidation.js"></script>
<script>
    function hideMessage(element) {
        element.parentNode.style.display = "none";
    }
</script>
</body>
</html>