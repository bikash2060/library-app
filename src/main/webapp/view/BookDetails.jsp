<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book | E-library System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <style>
        /* Styling Book Details Page */
        .book-details .container {
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            display: flex;
            flex-wrap: wrap;
        }

        .image-container {
            flex: 1;
            padding: 20px;
        }

        .image-container img{
            width: 400px;
            height: 400px;
            object-fit: contain;
            border-radius: 20px;
            margin-top: 10px;
        }

        .details-container {
            flex: 2;
            padding: 20px;
        }

        .details-container h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .details-container h2 {
            font-size: 1.5em;
            color: #555;
            margin-bottom: 10px;
        }

        .details-container .description {
            font-size: 1em;
            line-height: 1.6;
            color: #333;
            text-align: justify;
        }

        .details-container .price{
            margin-top: 10px;
            font-size: 18px;
            font-weight: 600;
            color: rgb(136, 136, 136);
        }

        .details-container .price strong{
            color: orangered;
            margin-left: 5px;
        }

        .additional-info {
            margin-top: 20px;
            font-size: 1em;
            color: #555;
        }

        .additional-info div {
            margin-bottom: 20px;
        }

        .additional-info .language, .publication-date, .ISBN{
            font-weight: 600;
            color: rgb(136, 136, 136);
            margin-right: 3px;
        }

        .availability {
            font-size: 1em;
            margin-top: 10px;
            display: flex;
            align-items: center;
        }

        .availability strong {
            font-weight: 600;
            margin-right: 10px;
        }

        .availability .status {
            color: #3b3a3b;
            font-weight: 700;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #c7c7c7;
        }

        .details-container .genre {
            font-size: 1.2em;
            color: #3498DB;
            margin-bottom: 10px;
        }

        .review {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .review .stars {
            color: #FFD700;
            margin-right: 10px;
        }

        .details-container .buttons {
            display: flex;
            gap: 20px;
        }

        .details-container .buttons a{
            text-decoration: none;
            font-weight: 600;
        }

        .details-container .buttons .btn {
            padding: 10px 20px;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .details-container .buttons .btn {
            background-color: #007BFF;
            color: #fff;
        }


        .details-container .buttons .btn:hover {
            opacity: 0.9;
        }

        /* Styling Shop More Section */
        .shop-more .buy-more{
            background-color: #007bff;
            display: inline-block;
            color: #ffffff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            margin-bottom: 40px;
        }

        .shop-more .buy-more:hover{
            opacity: 0.9;
        }
    </style>
</head>
<body>

<%@ include file="Header.jsp" %>

<!-- Book Details Section -->
<div class="book-details">
    <div class="container">
        <div class="image-container">
            <img src="${pageContext.request.contextPath}/assets/book%20images/1984%20book.jpg" alt="Book Image">
        </div>
        <div class="details-container">
            <h1>Book Title</h1>
            <h2>By Author Name</h2>
            <p class="genre">Genre: Fiction</p>
            <p class="description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ultricies turpis vitae velit convallis, vel luctus nunc vestibulum. Aenean euismod lorem a urna cursus, ut facilisis risus condimentum.</p>
            <p class="price">Price:<strong>$29.99</strong></p>
            <div class="additional-info">
                <div><span class="language">Language:</span> English</div>
                <div><span class="publication-date">Published Date:</span>January 1, 2023</div>
                <div>
                    <p class="availability">
                        <strong>Availability:</strong>
                        <span class="status">In Stock</span>
                    </p>
                </div>
            </div>
            <div class="review">
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star-half-alt"></i>
                </div>
                <span>(4.5 out of 5)</span>
            </div>
            <div class="buttons">
                <a href="#" class="btn add-to-cart">Add to Cart</a>
            </div>
        </div>
    </div>
</div>

<!-- Shop More Section -->
<div class="shop-more">
    <div class="container">
        <a href="${pageContext.request.contextPath}/index" class="buy-more"> &#8592; Eplore More</a>
    </div>
</div>


<%@ include file="Footer.jsp"%>
</body>
</html>