<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice | E-library System</title>
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

        /* Styling Invoice Section */
        .invoice{
            margin-top: 16px;
        }
        .invoice .container{
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0;
            border-radius: 8px;
            background-color: #fff;
        }
        .invoice .top-section{
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #c6e4f1 ;
            padding: 10px 20px;
        }
        .top-section .logo{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .top-section .logo .company-logo{
            height: 60px;
        }
        .top-section .company-details{
            text-align: right;
            line-height: 23px;
        }
        .top-section .company-details p{
            color: #333333;
        }

        .header-section{
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
        }
        .header-section .customer-details,
        .invoice-details{
            line-height: 35px
        }
        .invoice-details{
            text-align: right;
        }
        hr {
            border: none;
            height: 2px;
            background-color: #d9d9d9;
            margin: 5px 0;
        }
        /* Table styling */
        .products-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .products-details table thead {
            background-color: #f5f5f5;
        }
        .products-details table th {
            padding: 10px;
            text-align: left;
            font-weight: bold;
            border-bottom: 1px solid #ddd;
        }
        .products-details table td {
            padding: 15px;
        }
        .products-details table tbody td{
            border-bottom: 1px solid #ddd;
        }
        .products-details table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .products-details table tfoot tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .products-details table tbody tr:hover {
            background-color: #f0f0f0;
        }

        .products-details table tfoot td {
            padding: 15px;
            font-weight: bold;
        }
        .other-information {
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .other-information p {
            margin: 10px 0;
            font-size: 16px;
            color: #333;
        }
        .other-information i{
            color: goldenrod;
            margin-right: 10px;
        }
        .appreciation-message {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            border-radius: 10px;
        }
        .message {
            width: 82%;
        }

        .signature {
            width: 18%;
        }
        .message {
            flex: 1;
            margin-right: 30px;
        }
        .message .msg {
            margin-bottom: 10px;
            font-size: 18px;
            color: #333;
            font-weight: bold;
            text-decoration: underline;
        }
        .message .terms{
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .appreciation-message .signature{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .signature .owner{
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }
        .signature .text{
            color: black;
            margin-bottom: 5px;
            opacity: 0.8;
        }
        .signature i{
            font-size: 25px;
        }

        /* Buy-more Section */
        .buy-more {
            padding: 20px 0;
            text-align: center;
        }
        .buy-more p {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }
        .buy-more i {
            font-size: 20px;
            color: #333;
            margin-left: 6px;
        }
        .buy-more a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .buy-more a:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>

<%@ include file="Header.jsp" %>

<!-- Invoice Section -->
<div class="invoice">
    <div class="container">
        <div class="top-section">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/assets/static%20images/logo.png" alt="logo" class="company-logo">
                <h2>BookEz</h2>
            </div>
            <div class="company-details">
                <p class="name">BookEz Enterprise</p>
                <p class="address">Kalanki, Kathmandu, Nepal</p>
                <p class="email">bookez@gmail.com</p>
            </div>
        </div>
        <div class="header-section">
            <div class="customer-details">
                <p>Name: Bikash Bhattarai</p>
                <p>Phone Number: 98271172737</p>
                <p>Address: Kathmandu, Nepal</p>
            </div>
            <div class="invoice-details">
                <p>Invoice ID: 10220</p>
                <p>Invoice Date: 2020/10/10</p>
                <p>Tax Free</p>
            </div>
        </div>
        <hr>
        <div class="products-details">
            <table>
                <thead>
                <tr>
                    <td>BookID</td>
                    <td>Book Name</td>
                    <td>Unit Price</td>
                    <td>Quantity</td>
                    <td>Total</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1010</td>
                    <td>Book Name</td>
                    <td>$100</td>
                    <td>20</td>
                    <td>$12000</td>
                </tr>
                <tr>
                    <td>1010</td>
                    <td>Book Name</td>
                    <td>$100</td>
                    <td>20</td>
                    <td>$12000</td>
                </tr>
                <tr>
                    <td>1010</td>
                    <td>Book Name</td>
                    <td>$100</td>
                    <td>20</td>
                    <td>$12000</td>
                </tr>
                <tr>
                    <td>1010</td>
                    <td>Book Name</td>
                    <td>$100</td>
                    <td>20</td>
                    <td>$12000</td>
                </tr>
                <tr>
                    <td>1010</td>
                    <td>Book Name</td>
                    <td>$100</td>
                    <td>20</td>
                    <td>$12000</td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="4" style="text-align: right;">Total Amount:</td>
                    <td>120000</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: right;">Discount Amount:</td>
                    <td>120000</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: right;">Grand Total Amount:</td>
                    <td>120000</td>
                </tr>
                </tfoot>
            </table>
        </div>
        <div class="other-information">
            <p>Payment Status: <b>Online</b></p>
            <p><i class="fa-regular fa-face-smile"></i>Enjoy hassle-free returns within 7 days of purchase</p>
        </div>
        <hr>
        <div class="appreciation-message">
            <div class="message">
                <p class="msg">Thank You For Choosing Us</p>
                <p class="terms">Terms and Conditions:</p>
                <p class="promo">Buy More and Spread Love</p>
            </div>
            <div class="signature">
                <p class="owner">Bikash Bhattarai</p>
                <p class="text">Owner</p>
                <i class="fa-solid fa-signature"></i>
            </div>
        </div>
    </div>
</div>

<!-- Buy More Section -->
<div class="buy-more">
    <div class="container">
        <p>Wanna buy more?</p>
        <a href="${pageContext.request.contextPath}/WEB-INF/Home.jsp">Explore</a>
    </div>
</div>

<%@ include file="Footer.jsp"%>
</body>
</html>