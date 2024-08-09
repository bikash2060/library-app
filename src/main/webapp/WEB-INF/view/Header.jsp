<%@ page import="model.User" %>
<%@ page import="utils.StringUtils" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header | E-Library System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <%
        User user = (User) session.getAttribute(StringUtils.USER_OBJECT);
        String loginMessage = (String) session.getAttribute(StringUtils.SUCCESS_LOGIN_MESSAGE_KEY);
    %>
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

        .info-text {
            background-color: #f4f4f4;
            padding: 10px 20px;
            border-bottom: 1px solid #ddd;
            font-family: 'Montserrat', sans-serif;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .info-text .links {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            flex-grow: 1;
        }

        .info-text ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-wrap: wrap;
        }

        .info-text ul li {
            display: flex;
            align-items: center;
            margin: 10px 10px;
        }

        .info-text ul li i {
            font-size: 20px;
            color: #8AAAE5;
            margin-right: 10px;
        }

        .info-text .info-detail {
            display: flex;
            flex-direction: column;
        }

        .info-text .info-detail h6 {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin: 0;
        }

        .info-text .info-detail p {
            font-size: 14px;
            color: #666;
            margin: 0;
        }

        .navigation-bar{
            width: 100%;
            height: auto;
            background: #24262b;
        }

        nav{
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }

        .container .logo-section a{
            display: flex;
            align-items: center;
            justify-content: space-around;
            text-decoration: none;
        }

        .logo-section .company-logo {
            height: 40px;
        }

        .logo-section .company-name {
            font-size: 24px;
            font-weight: bold;
            color: #FFFFFF;
            letter-spacing: 1px;
            margin-left: 5px;
        }

        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            margin-left: 145px;
        }

        .search-wrapper {
            position: relative;
            width: 100%;
            max-width: 700px;
        }

        .search-bar {
            font-size: 16px;
            width: 400px;
            padding: 10px 40px 10px 10px;
            border-radius: 25px;
            box-sizing: border-box;
            border: none;
            outline: none;
        }

        .search-bar::placeholder {
            color: #888;
            font-size: 16px;
        }

        .search-button {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            background: transparent;
            border: none;
            cursor: pointer;
            padding: 10px;
        }

        .search-button i {
            color: #333;
            font-size: 16px;
        }

        .search-bar:focus {
            outline: none;
            border-color: #8AAAE5;
        }

        .user-pic{
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 50%;
            cursor: pointer;
            margin-left: 10px;
            border: 1px solid #fff;
        }

        nav ul{
            width: 100%;
            text-align: right;
            line-height: 2;
        }

        nav ul li{
            display: inline-block;
            list-style: none;
            margin: 0 8px;
        }

        nav ul li a{
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 10px;
            transition: 0.3s ease;
        }

        nav ul li #login-section i{
            margin-right: 10px;
        }

        nav ul li #cart-section{
            line-height: 1;
        }

        nav ul li #cart-section i{
            margin-top: 10px;
            font-size: 22px;
            align-items: center;
        }

        #login-section:hover,
        #signup-section:hover,
        #cart-section:hover {
            background: rgba(50, 75, 122, 0.5);
            border-radius: 10px;
        }

        .sub-menu-wrap{
            position: absolute;
            top: 83%;
            right: 1%;
            width: 300px;
            max-height: 0;
            z-index: 10;
            overflow: hidden;
            transition: max-height 0.5s;
        }

        .sub-menu-wrap.open-menu{
            max-height: 400px;
        }

        .sub-menu{
            background: #b3b2b2;
            padding: 20px;
            margin: 20px 0 0;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }
        .user-info{
            display: flex;
            align-items: center;
        }

        .user-info h3{
            font-weight: 500;
        }

        .user-info img{
            width: 50px;
            height: 50px;
            object-fit: contain;
            border-radius: 50%;
            margin-right: 15px;
            border: 1px solid #fff;
        }

        .sub-menu hr{
            border: 0;
            height: 1px;
            width: 100%;
            background: #ccc;
            margin: 15px 0 10px;
        }

        .sub-menu-link{
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #525252;
            margin: 12px 0;
        }

        .sub-menu-link p{
            width: 100%;
        }

        .sub-menu-link i{
            width: 40px;
            background: #e5e5e5;
            border-radius: 50%;
            padding: 8px;
            margin-right: 15px;
            text-align: center;
        }

        .sub-menu-link span{
            font-size: 22px;
            transition: transform 0.5s;
        }

        .sub-menu-link:hover span{
            transform: translateX(5px);
        }

        .sub-menu-link:hover p{
            font-weight: 600;
        }

        .login-message {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            max-width: 300px;
            margin-right: auto;
        }

        .login-message.success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .login-message .close-btn {
            cursor: pointer;
        }

        .close-btn i {
            color: inherit;
        }
    </style>

</head>
<body>
<header class="info-text">
    <% if(user != null && loginMessage != null){%>
    <div class="login-message success">
        <span><%= loginMessage%></span>
        <span class="close-btn" onclick="this.parentElement.style.display='none';"><i class="fa-solid fa-x"></i></span>
    </div>
    <% session.removeAttribute(StringUtils.SUCCESS_LOGIN_MESSAGE_KEY);
    }
    %>
    <div class="links">
        <ul>
            <li>
                <h6>
                    <i class="fa-solid fa-phone"></i>
                </h6>
                <p>+977 9762556405 | 9827117374</p>
            </li>
            <li>
                <span style="color: black;">|</span>
            </li>
            <li>
                <h6>
                    <i class="fa-solid fa-envelope"></i>
                </h6>
                <p>bookez@gmail.com</p>
            </li>
            <li>
                <span style="color: black;">|</span>
            </li>
            <li>
                <h6>
                    <i class="fa-solid fa-location-dot"></i>
                </h6>
                <p>Kalanki, Kathmandu, Nepal</p>
            </li>
        </ul>
    </div>
</header>

<div class="navigation-bar">
    <div class="container">
        <nav>
            <div class="logo-section">
                <a href="${pageContext.request.contextPath}/home">
                    <img src="${pageContext.request.contextPath}/assets/static images/logo.png" alt="company-logo" class="company-logo">
                    <span class="company-name">BookEz</span>
                </a>
            </div>
            <div class="search-container">
                <form>
                    <div class="search-wrapper">
                        <input type="text" placeholder="Search" class="search-bar">
                        <button class="search-button">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </form>
            </div>
            <ul>
                <%-- Checking whether user is logged in or not --%>
                <% if(user == null){%>
                    <li>
                        <a href="${pageContext.request.contextPath}/login" id="login-section">
                            <i class="fa-regular fa-user"></i>
                            <span>Login</span>
                        </a>
                    </li>
                    <li>
                        <span style="color: white;">|</span>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/signup" id="signup-section">Sing Up</a>
                    </li>
                <%}%>
                <li>
                    <a href="" id="cart-section">
                        <i class="fa-solid fa-cart-shopping"></i>
                    </a>
                </li>
            </ul>

            <%-- Checking whether user is logged in or not --%>
            <%if(user != null){%>

                <% if(user.getUserImage() == null || user.getUsername().isEmpty()) {%>
                    <img src="${pageContext.request.contextPath}/assets/static images/default-profile-picture.png" class="user-pic" onclick="toggleMenu(0)" alt="user-pic">
                <%} else {%>
                    <img src="${pageContext.request.contextPath}/assets/user profile images/customer1.png" class="user-pic" onclick="toggleMenu(0)" alt="user-pic">
                <%}%>

                <div class="sub-menu-wrap" id="sub-menu">
                    <div class="sub-menu">
                        <div class="user-info">

                            <% if(user.getUserImage() == null || user.getUsername().isEmpty()) {%>
                                <img src="${pageContext.request.contextPath}/assets/static images/default-profile-picture.png" alt="user-pic">
                            <%} else {%>
                                <img src="${pageContext.request.contextPath}/assets/user profile images/customer1.png" alt="user-pic">
                            <%}%>

                            <h3><%= user.getFirstName()+" "+user.getLastName()%></h3>
                        </div>
                        <hr>
                        <a href="${pageContext.request.contextPath}/my-profile" class="sub-menu-link">
                            <i class="fa-solid fa-user"></i>
                            <p>Edit Profile</p>
                            <span>></span>
                        </a>
                        <a href="${pageContext.request.contextPath}/logout" class="sub-menu-link">
                            <i class="fa-solid fa-right-from-bracket"></i>
                            <p>Logout</p>
                            <span>></span>
                        </a>
                    </div>
                </div>
            <%}%>
        </nav>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/ToggleMenu.js"></script>
</body>
</html>