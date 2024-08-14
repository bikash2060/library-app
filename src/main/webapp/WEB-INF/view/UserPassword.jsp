<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <title>My Password</title>
    <style>
        /* Import Google font - Poppins */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        :root {
            --white-color: #fff;
            --blue-color: #4070f4;
            --grey-color: #707070;
            --grey-color-light: #aaa;
        }

        body {
            background-color: #e7f2fd;
            transition: all 0.5s ease;
        }

        body.dark {
            background-color: #333;
        }

        body.dark {
            --white-color: #333;
            --blue-color: #fff;
            --grey-color: #f2f2f2;
            --grey-color-light: #aaa;
        }

        /* Styling Body Content */
        .body-content {
            margin-left: 260px;
            margin-top: 70px;
            padding: 20px;
            background-color: #e7f2fd;
            width: calc(100% - 260px);
        }

        .body-content .container{
            background: white;
            width: 500px;
            padding: 25px;
            margin: 20px auto 20px;
            border-top: 5px solid blue;
            box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.5);
        }

        form .row{
            display: flex;
            align-items: center;
        }

        #user .user-pic{
            height: 100px;
            width: 100px;
            border-radius: 50%;
            object-fit: cover;
        }

        #user #image{
            display: none;
        }

        #user #upload-btn i{
            position: absolute;
            text-align: center;
            padding: 6px 6px;
            border-radius: 50%;
            cursor: pointer;
            color: #fff;
            margin-top: 80px;
            transform: translateX(-90%);
            background: rgb(173, 172, 172, 0.801);
            box-shadow: 2px 4px 4px rgb(0,0,0,0.644);
        }

        .row #username h2{
            font-size: 25px;
            margin-left: 20px;
            text-transform: capitalize;
            color: rgb(112, 112, 112);
        }

        .input-name {
            width: 90%;
            position: relative;
            margin: 20px auto;
        }

        .input-name span{
            margin-left: 35px;
        }

        .email, .password, .confirmPassword, .number, .username{
            width: 100%;
            padding: 8px 0 8px 45px;
        }

        .input-name i{
            position: absolute;
            font-size: 18px;
            color: blue;
            border-right: 1px solid #cccccc;
        }

        .envelope, .pass, .phoneNumber{
            padding: 12px 11px;
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
            width: auto;
            padding: 5px 20px;
            cursor: pointer;
            background: #007bff;
            color: white;
            font-weight: 500;
        }

        .btn:hover{
            background-color: #0056b3;
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

        #pass, #newPass, #conPass{
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

        #newPass .showPass{
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

        #conPass .showPass{
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

        .message-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 10px;
            width: 500px;
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
<%@ include file="UserProfileSidebar.jsp" %>

<!-- Body Section -->
<div class="body-content">
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
        session.removeAttribute(StringUtils.SUCCESS_MESSAGE_KEY);
    %>
    <% } %>
    <div class="container">
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/my-password" method="post">

                <div class="input-name" id="pass">
                    <i class="fa-solid fa-key envelope"></i>
                    <input type="password" placeholder="Old Password" class="email" name="oldPassword" id="oldPassword" value="<%= (request.getParameter("oldPassword") != null) ? request.getParameter("oldPassword") : "" %>">
                    <i class="fa-solid fa-eye showPass"></i>
                </div>

                <div class="input-name" id="newPass">
                    <i class="fa-solid fa-key phoneNumber"></i>
                    <input type="password" placeholder="New Password" class="number" name="newPassword" id="newPassword" value="<%= (request.getParameter("newPassword") != null) ? request.getParameter("newPassword") : "" %>">
                    <i class="fa-solid fa-eye showPass"></i>
                </div>

                <div class="input-name" id="conPass">
                    <i class="fa-solid fa-key phoneNumber"></i>
                    <input type="password" placeholder="Confirm Password" class="username" name="confirmPassword" id="confirmPassword" value="<%= (request.getParameter("confirmPassword") != null) ? request.getParameter("confirmPassword") : "" %>">
                    <i class="fa-solid fa-eye showPass"></i>
                </div>

                <div class="input-name">
                    <input type="submit" class="btn" value="Save">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // For Show Password Icon
    document.addEventListener('DOMContentLoaded', function() {
        const oldPasswordInput = document.getElementById('oldPassword');
        const newPasswordInput = document.getElementById('newPassword');
        const confirmPasswordInput = document.getElementById('confirmPassword');
        const showPassIcons = document.querySelectorAll('.showPass');

        showPassIcons.forEach(function(icon) {
            icon.addEventListener('click', function() {
                const inputField = icon.previousElementSibling;
                if (inputField.type === 'password') {
                    inputField.type = 'text';
                    icon.classList.add('fa-eye-slash');
                } else {
                    inputField.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                }
            });

            const inputField = icon.previousElementSibling;
            inputField.addEventListener('input', function() {
                if (inputField.value.length > 0) {
                    icon.style.display = 'block';
                } else {
                    icon.style.display = 'none';
                }
            });

            if (inputField.value.length > 0) {
                icon.style.display = 'block';
            } else {
                icon.style.display = 'none';
            }
        });
    });

</script>
</body>
</html>
