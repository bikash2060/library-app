<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
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

        /* Styling User Profile Section */
        .wrapper {
            display: flex;
            position: relative;
            margin: 20px;
            height: 500px;
        }

        .wrapper .side-bar {
            width: 300px;
            background-color: #4b4276;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
            overflow: hidden;
        }

        .side-bar ul {
            padding: 0;
            margin: 0;
        }

        .side-bar ul li {
            padding: 15px;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
            border-bottom: 1px solid rgba(225, 225, 225, 0.05);
            list-style: none;
            transition: margin-left 0.3s ease;
        }

        .side-bar ul li a {
            color: #bdb8d7;
            display: block;
            text-decoration: none;
        }

        .side-bar ul li a i {
            width: 25px;
        }

        .side-bar ul li:hover {
            background: #594f8d;
            margin-left: 2px;
        }

        .side-bar ul li:hover a{
            color: white;
        }

        .side-bar ul li.active{
            background: #594f8d;
        }

        .side-bar ul li.active a {
            color: #fff;
        }

        .content {
            flex: 1;
            padding-left: 20px;
            padding-top: 20px;
            background-color: #f8f8f8;
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .content-section {
            display: none;
        }

        .content-section.active {
            display: block;
        }

        /* Styling Basic Information Section */
        .form .row{
            display: flex;
            align-items: center;
        }

        #user .user-pic{
            height: 70px;
            width: 70px;
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
            font-size: 15px;
            cursor: pointer;
            color: #fff;
            margin-top: 50px;
            transform: translateX(-90%);
            background: rgb(173, 172, 172, 0.801);
            box-shadow: 2px 4px 4px rgb(0,0,0,0.644);
        }

        #username{
            text-transform: capitalize;
        }

        .row{
            display: flex;
            margin-top: 30px;
        }

        .input-name {
            width: 90%;
            position: relative;
            margin: 20px 0;
        }

        .lock{
            padding: 8px 11px;
        }

        .fname{
            width: 60%;
            padding: 8px 0 8px 45px;
        }

        .input-name span{
            margin-left: 35px;
        }

        .email, .password, .number, .username{
            width: 60%;
            padding: 8px 0 8px 45px;
        }

        .input-name i{
            position: absolute;
            font-size: 18px;
            color: blue;
            border-right: 1px solid #cccccc;
        }

        .envelope, .pass, .phoneNumber{
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

        #password .input-name {
            margin-top: 0;
        }

        /* CSS for the table container to enable scrolling */
        .table-container {
            width: 100%;
            height: 60vh;
            overflow-y: auto;
            overflow-x: hidden;
            margin-bottom: 1em;
            position: relative;
        }

        .table-container::-webkit-scrollbar {
            width: 12px;
        }

        .table-container::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .table-container::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 6px;
        }

        .table-container::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
            height: 30px;
        }

        thead th {
            background-color: #f2f2f2;
            position: sticky;
            top: 0;
            z-index: 10;
            box-shadow: 0 2px 2px -1px rgba(0, 0, 0, 0.4);
            border-top: 2px solid #ddd;
            border-bottom: 2px solid #ddd;
        }

        tbody td {
            position: relative;
            z-index: 1;
        }
    </style>
</head>
<body>
<%@ include file="Header.jsp" %>

<!-- User Profile Section -->
<div class="user-profile">
    <div class="container">
        <div class="wrapper">
            <div class="side-bar">
                <ul>
                    <li class="active">
                        <a href="#" data-target="basic-info">
                            <i class="fa-solid fa-user"></i>Basic Information
                        </a>
                    </li>
                    <li>
                        <a href="#" data-target="password">
                            <i class="fa-solid fa-key"></i>Password
                        </a>
                    </li>
                    <li>
                        <a href="#" data-target="order-history">
                            <i class="fa fa-list"></i>Order History
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Right Side Content -->
            <div class="content">

                <!-- User's Basic Information Section -->
                <div id="basic-info" class="content-section active">
                    <div class="form">
                        <form>
                            <% if(user != null){%>
                            <div class="row">
                                <div id="user">

                                    <% if(user.getUserImage() == null || user.getUsername().isEmpty()) {%>
                                        <img src="${pageContext.request.contextPath}/assets/static images/default-profile-picture.png" alt="user-pic" class="user-pic">
                                    <%} else {%>
                                        <img src="${pageContext.request.contextPath}/assets/user profile images/customer1.png" alt="user-pic" class="user-pic">
                                    <%}%>

                                    <input type="file" name="image" id="image">
                                    <label for="image" id="upload-btn"><i class="fa-solid fa-camera"></i></label>
                                </div>
                                <div id="username">
                                    <h2><%= user.getFirstName()+" "+user.getLastName()%></h2>
                                </div>
                            </div>

                            <div class="input-name">
                                <i class="fa-solid fa-user lock"></i>
                                <input type="text" placeholder="First Name" class="fname" name="firstName" value="<%= (request.getParameter("firstName") != null) ? request.getParameter("firstName") : user.getFirstName() %>">
                            </div>

                            <div class="input-name">
                                <i class="fa-solid fa-user lock"></i>
                                <input type="text" placeholder="Last Name" class="fname" name="lastName" value="<%= (request.getParameter("lastName") != null) ? request.getParameter("lastName") : user.getLastName() %>">
                            </div>

                            <div class="input-name">
                                <i class="fa-solid fa-envelope envelope"></i>
                                <input type="text" placeholder="Email" class="email" name="emailAddress" value="<%= (request.getParameter("emailAddress") != null) ? request.getParameter("emailAddress") : user.getEmailAddress() %>">

                            </div>

                            <div class="input-name">
                                <i class="fa-solid fa-phone phoneNumber"></i>
                                <input type="text" placeholder="Phone Number" class="number" name="phoneNumber" value="<%= (request.getParameter("phoneNumber") != null) ? request.getParameter("phoneNumber") : user.getPhoneNumber() %>">
                            </div>

                            <div class="input-name">
                                <i class="fa-solid fa-user phoneNumber"></i>
                                <input type="text" placeholder="Username" class="username" name="username" value="<%= (request.getParameter("username") != null) ? request.getParameter("username") : user.getUsername() %>">
                            </div>
                            <%}%>
                            <div class="input-name">
                                <input type="hidden" name="userID" value="<%= user != null ? user.getUserID() : 0%>">
                                <input type="submit" class="btn" value="Save">
                            </div>
                        </form>
                    </div>
                </div>

                <!-- User's Password Section -->
                <div id="password" class="content-section">
                    <div class="form">
                        <form>

                            <div class="input-name">
                                <i class="fa-solid fa-lock pass"></i>
                                <input type="password" placeholder="Old Password" class="password" name="oldPassword">
                            </div>

                            <div class="input-name">
                                <i class="fa-solid fa-lock pass"></i>
                                <input type="password" placeholder="New Password" class="password" name="newPassword">
                            </div>

                            <div class="input-name">
                                <i class="fa-solid fa-lock pass"></i>
                                <input type="password" placeholder="Confirm Password" class="password" name="confirmPassword">
                            </div>

                            <div class="input-name">
                                <input type="submit" class="btn" value="Save">
                            </div>
                        </form>
                    </div>

                </div>

                <!-- User's Order History Section -->
                <div id="order-history" class="content-section">
                    <div class="form">
                        <div class="table-container">
                            <table>
                                <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Order Date</th>
                                    <th>Discount Amount</th>
                                    <th>Total Amount</th>
                                    <th>Payment Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                <tr>
                                    <td>12345</td>
                                    <td>2024-08-04</td>
                                    <td>$10.00</td>
                                    <td>$100.00</td>
                                    <td>Paid</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/UserProfile.js"></script>
</body>
</html>