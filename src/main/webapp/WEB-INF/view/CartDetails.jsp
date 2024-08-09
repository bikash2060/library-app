<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart | E-library System</title>
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

        /* Styling Cart Section */
        .cart-section{
            margin-top: 40px;
        }

        .cart-section .title{
            font-size: 30px;
            color:rgb(115, 111, 111)
        }

        .product-table .table{
            margin-top: 30px;
            width: 100%;
            text-align: center;
            border-collapse: collapse;
        }

        .table thead td{
            font-family: 'Arial', sans-serif;
            font-size: 16px;
            text-transform: uppercase;
            font-weight: bold;
            color: #333;
            background: #F9FAFB;
            text-align: left;
            padding: 15px;
            border-bottom: 2px solid #ccc;
        }

        tbody tr {
            border-bottom: 1px solid #ccc;
        }

        tbody tr td{
            padding: 15px;
            text-align: left;
        }

        tbody td:not(.image){
            font-family: 'Arial', sans-serif;
            font-size: 17px;
            color: #555;
            line-height: 1.5;
        }

        tbody tr td.delete .delete-btn {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        tbody tr td.delete .delete-btn:hover {
            background-color: #000000;
        }

        tbody tr .quantity .button{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 30px;
            width: 80px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        tbody tr .quantity .button button {
            border: none;
            background-color: transparent;
            cursor: pointer;
            padding: 5px;
            outline: none;
        }

        tbody tr .quantity .button span {
            padding: 5px;
        }

        tbody tr:last-child {
            border-bottom: none;
        }

        tbody tr .image img{
            width: 100px;
            height: 100px;
            object-fit: contain;
        }

        thead tr, tbody tr .image  {
            width: 15%;
        }

        thead tr, tbody tr .name {
            width: 23%;
        }

        thead tr, tbody tr .price {
            width: 18%;
        }

        thead tr, tbody tr .quantity {
            width: 18%;
        }

        thead tr, tbody tr .total {
            width: 18%;
        }

        thead tr, tbody tr .delete {
            width: 18%;
        }

        /* Cart-Table */
        .cart-container{
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
        }

        .cart-table{
            width: 400px;
            background-color: #f2f2f2;
            border-radius: 10px;
            padding: 10px 20px;
            margin-bottom: 30px;
        }

        .cart-table .title{
            font-size: 24px;
            color: #413d3d;
            margin-bottom: 10px;
            text-align: center;
        }

        .cart-table .line{
            border: none;
            height: 1px;
            background-color: #ccc;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .details .row{
            display: flex;
            justify-content: space-between;
            margin: 15px 0;
        }

        .details .row p{
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            color: #333;
        }

        .details .row .sub-total-amount {
            font-weight: bold;
            color: #555;
        }

        .cart-table .checkout-button{
            width: 100%;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            margin-top: 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            transition: background-color 0.3s;
        }

        .cart-table .checkout-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<%@ include file="Header.jsp" %>

<!-- Cart Section -->
<div class="cart-section">
    <div class="container">
        <h3 class="title">Shopping Cart</h3>
        <div class="product-table">
            <table class="table" id="cart-table">
                <thead>
                <tr>
                    <td class="image">Image</td>
                    <td class="name">Book Name</td>
                    <td class="price">Price</td>
                    <td class="quantity">Quantity</td>
                    <td class="total">Total</td>
                    <td class="delete"></td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="image">
                        <img src="${pageContext.request.contextPath}/assets/static%20images/customer2.png" alt="1984 Book Image">
                    </td>
                    <td class="name">
                        <p>1984</p>
                    </td>
                    <td class="price">
                        <p>$20.30</p>
                    </td>
                    <td class="quantity">
                        <div class="button">
                            <button class="quantity-btn" onclick="updateQuantity(this, '-')">-</button>
                            <span>1</span>
                            <button class="quantity-btn" onclick="updateQuantity(this, '+')">+</button>
                        </div>
                    </td>
                    <td class="total">
                        <p>$20.30</p>
                    </td>
                    <td class="delete">
                        <form action="#" class="delete-form">
                            <button type="submit" class="delete-btn">Remove</button>
                        </form>
                    </td>
                </tr>

                <tr>
                    <td class="image">
                        <img src="${pageContext.request.contextPath}/assets/user%20profile%20images/customer1.png" alt="Big Little Lies Book Image">
                    </td>
                    <td class="name">
                        <p>Big Little Lies</p>
                    </td>
                    <td class="price">
                        <p>$20.30</p>
                    </td>
                    <td class="quantity">
                        <div class="button">
                            <button class="quantity-btn" onclick="updateQuantity(this, '-')">-</button>
                            <span>1</span>
                            <button class="quantity-btn" onclick="updateQuantity(this, '+')">+</button>
                        </div>
                    </td>
                    <td class="total">
                        <p>$20.30</p>
                    </td>
                    <td class="delete">
                        <form action="#" class="delete-form">
                            <button type="submit" class="delete-btn">Remove</button>
                        </form>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>
        <div class="cart-container">
            <div class="cart-table">
                <form action="#">
                    <h3 class="title">Order Summary</h3>
                    <hr class="line">
                    <div class="details">
                        <div class="row">
                            <p class="sub-total">Subtotal (2 items)</p>
                            <p class="sub-total-amount">Rs. 10000</p>
                        </div>
                        <div class="row">
                            <p class="sub-total">Tax Amount</p>
                            <p class="sub-total-amount">Rs. 1000</p>
                        </div>
                        <div class="row">
                            <p class="sub-total">Discount Amount</p>
                            <p class="sub-total-amount">Rs. 1000</p>
                        </div>
                        <hr class="line">
                        <div class="row">
                            <p class="sub-total">Total Amount</p>
                            <p class="sub-total-amount">Rs. 100000</p>
                        </div>
                    </div>
                    <button type="submit" class="checkout-button">Checkout</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/QuantityIncrement.js"></script>
<%@ include file="Footer.jsp"%>
</body>
</html>