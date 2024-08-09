<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout | E-library System</title>
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

        /* Body Section */
        .order-body-section{
            margin: 30px 0;
        }
        .order-body-section .container {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 0;
            border-radius: 8px;
            background-color: #fff;
        }
        .order-body-section .title{
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 80px;
            background: #f8f8f8;
            padding: 10px 30px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }
        .order-body-section .title h3{
            font-size: 28px;
            color: #001f3f;
        }
        .user-details{
            display: flex;
            align-items: center;
        }
        .user-details .user-pic{
            height: 50px;
            width: 50px;
            object-fit: cover;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 50%;
        }
        .user-details p{
            margin-left: 10px;
            margin-top: 3px;
            font-size: 20px;
            color: #001f3f;
        }
        .main-title{
            display: flex;
            justify-content: space-between;
            padding: 10px 30px;
        }
        .customer,
        .order {
            flex: 1;
        }
        .order{
            margin-left: 60px;
        }
        .main-title h3{
            margin-top: 10px;
            font-size: 25px;
            color: #001f3f;
        }
        .form-section {
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            padding: 0 30px;
        }
        .form-section .mid-container {
            display: flex;
        }
        .left-col,
        .right-col {
            flex: 1;
            margin-top: 20px;
        }
        .left-col{
            position: relative;
        }
        .form-section .left-col .row {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .order-date {
            position: absolute;
            width: 100%;
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
            bottom: 20px;
        }
        .order-date h3 {
            margin-top: 0;
            margin-bottom: 5px;
        }
        .left-col .row label {
            display: inline-block;
            font-size: 16px;
            width: 200px;
            margin: 20px 30px 10px 0;
        }
        .left-col .row .required{
            margin-left: 2px;
            color: red;
        }
        .form-section .left-col .row input[type="text"],
        input[type="date"]{
            flex: 1;
            width: calc(100% - 160px);
            padding: 10px;
            outline: none;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            color: #424242
        }
        .form-section .left-col .row input[type="text"]:not(#shipppingAddress){
            background-color: #f0f0f0;
        }
        .right-col{
            margin-left: 60px;
        }
        .table-wrapper{
            max-height: 176px;
            width: 100%;
            overflow-y: auto;
            overflow-x: hidden;
            border-bottom: 1px solid #ccc;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }
        table tr {
            padding: 10px;
            border-bottom: 1px solid #ccc;
            min-height: 59px;
        }
        table tr:last-child {
            border-bottom: none;
        }
        table .row-data {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        table .product-name {
            width: 70%;
        }
        table .quantity {
            font-size: 12px;
            color: #888;
        }
        table .price {
            width: 30%;
            text-align: right;
        }

        .table-wrapper::-webkit-scrollbar {
            width: 5px;
        }

        .table-wrapper::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .table-wrapper::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 5px;
        }

        .table-wrapper::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
        .total-amount .row{
            display: flex;
            justify-content: space-between;
            padding: 15px 0 15px 10px;
            border-bottom: 1px solid #ccc;
            border-radius: 5px;
            background: #f0f0f0;
            text-align: center;
        }
        .total-amount .row p{
            font-size: 15px;
            color: #111111;
        }
        .total-amount .row .amount{
            font-size: 16px;
            padding-right: 15px;
        }

        .payment-type {
            margin-top: 20px;
            display: flex;
            align-items: center;
            padding-left: 10px;
        }
        .payment-type i {
            font-size: 24px;
            color: #555;
            margin-right: 10px;
            background: #f0f0f0;
            padding: 12px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .payment-type i:hover {
            transform: scale(1.1);
            background: #ddd;
        }

        .payment-type input[type="radio"] {
            display: none;
        }
        .payment-type input[type="radio"] + label {
            display: inline-block;
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 15px;
            transition: background-color 0.3s ease;
        }
        .payment-type input[type="radio"]:checked + label {
            background-color: rgb(55, 53, 50);
            color: white;
            font-weight: bold;
        }
        .payment-type input[type="radio"] + label:hover {
            background-color: #ddd;
        }

        .payment-amount{
            margin-top: 25px;
        }
        .payment-amount .row{
            display: flex;
            justify-content: space-between;
            padding: 15px 15px 15px 10px;
            text-align: center;
            border-bottom: 1px solid #ccc;
            border-radius: 5px;
            background: #f0f0f0;
        }
        .payment-amount .row .discount{
            color: #e67e22;
            font-weight: bold;
        }
        .submit-button {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .submit-button input[type="submit"] {
            width: 100%;
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-button input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<%@ include file="Header.jsp" %>

<!-- Checkout Section -->
<div class="order-body-section">
    <div class="container">
        <div class="title">
            <h3>Order Summary</h3>
            <div class="user-details">
                <img src="${pageContext.request.contextPath}/assets/user%20profile%20images/customer1.png" alt="user-pic" class="user-pic">
                <p>Bikash<br> Bhattarai</p>
            </div>
        </div>
        <div class="main-title">
            <h3 class="customer">Customer Details:</h3>
            <h3 class="order">Order Details:</h3>
        </div>
        <div class="form-section">
            <form action="#">
                <div class="mid-container">
                    <div class="left-col">
                        <div class="row">
                            <label for="fullName">Name</label>
                            <input type="text" name="fullName" id="fullName" value="Bikash Bhattarai" readonly>
                        </div>
                        <div class="row">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="text" name="phoneNumber" id="phoneNumber" value="9827117374" readonly>
                        </div>
                        <div class="row">
                            <label for="address">Address</label>
                            <input type="text" name="address" id="address" value="Kathmandu" readonly>
                        </div>
                        <div class="row">
                            <label for="shipppingAddress">Shipping Address<span class="required">*</span></label>
                            <input type="text" name="shipppingAddress" id="shipppingAddress" placeholder="Enter shipping address">
                        </div>
                        <div class="order-date">
                            <h3>Ordered Date:</h3>
                            <p>May 3, 2024</p>
                        </div>
                    </div>

                    <div class="right-col">
                        <div class="table-wrapper">
                            <table>
                                <tbody class="product-data">
                                <tr class="row-data">
                                    <td class="product-name">Book Name<br>
                                        <span class="quantity">Quantity</span>
                                    </td>
                                    <td class="price">Total Price</td>
                                </tr>
                                <tr class="row-data">
                                    <td class="product-name">Book Name<br>
                                        <span class="quantity">Quantity</span>
                                    </td>
                                    <td class="price">Total Price</td>
                                </tr>
                                <tr class="row-data">
                                    <td class="product-name">Book Name<br>
                                        <span class="quantity">Quantity</span>
                                    </td>
                                    <td class="price">Total Price</td>
                                </tr>
                                <tr class="row-data">
                                    <td class="product-name">Book Name<br>
                                        <span class="quantity">Quantity</span>
                                    </td>
                                    <td class="price">Total Price</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="total-amount">
                            <div class="row">
                                <p class="net-amount">Total Amount:</p>
                                <p class="amount">$20000</p>
                            </div>
                        </div>
                        <div class="payment-type">
                            <i class="fas fa-credit-card"></i>
                            <div class="checkbox-wrapper">
                                <input type="radio" value="Online" name="payment" id="online">
                                <label for="online">Online</label>
                            </div>
                            <div class="checkbox-wrapper">
                                <input type="radio" value="Cash on Delivery" name="payment" id="Cash on Delivery">
                                <label for="Cash on Delivery">Cash on Delivery</label>
                            </div>
                        </div>
                        <div class="payment-amount">
                            <div class="row">
                                <p class="discount">Discount Amount:</p>
                                <p class="discount-amount">$20000</p>
                            </div>
                            <div class="row">
                                <p class="grand">Grand Total Amount:</p>
                                <p class="grand-amount">$20000</p>
                            </div>
                        </div>
                        <div class="submit-button">
                            <input type="submit" value="PLACE ORDER">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="Footer.jsp"%>
</body>
</html>