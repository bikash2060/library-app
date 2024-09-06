<%@ page import="model.User" %>
<%@ page import="utils.StringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Genre" %>
<%@ page import="model.Book" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | E-Library System</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }

        :root {
            --primary-color: #149e9e;
            --secondary-color: #e8e8e8;
            --text-dark: #0f172a;
            --text-light: #94a3b8;
            --white: #ffffff;
        }

        body{
            font-family:'Montserrat', sans-serif;
        }

        .container{
            max-width: 1200px;
            margin: 0 auto;
            padding: 10px;
        }

        /* Styling Slider Section */
        .slider-content {
            background-size: cover;
            height: auto;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding-top: 10px;
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
            transition: background-image 1s ease-in-out;
        }

        .slider-content .container {
            width: 100%;
            max-width: 1200px;
            display: flex;
            gap: 20px;
            margin-bottom: 10px;
        }

        .slider-box {
            position: relative;
            width: 800px;
            height: 540px;
            border-radius: 8px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .slider {
            display: flex;
            transition: transform 0.5s ease-in-out;
            height: 100%;
            width: 100%;
        }

        .slide {
            display: flex;
            width: 100%;
            height: 100%;
            flex: 1;
            background: #fff;
        }

        .book-title {
            position: absolute;
            top: 5%;
            font-size: 2em;
            color: #333;
            font-weight: bold;
        }

        .info-cell {
            flex: 1;
            padding: 20px;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }

        .info-cell p {
            margin: 8px 0;
            color: #333;
        }

        .info-cell .price span{
            color: orangered;
            font-weight: bold;
        }

        .info-cell .book-description{
            line-height: 1.3;
            text-align: justify;
        }
        .info-cell .star-gold {
            color: gold;
            margin-right: 2px;
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

        .image-cell {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f0;
            overflow: hidden;
        }

        .image-cell img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .slider-nav {
            position: absolute;
            bottom: 20px;
            left: 50%;
            top: 93%;
            transform: translateX(-92%);
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .nav-dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 5px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .nav-dot.active, .nav-dot:hover {
            background-color: #717171;
        }

        .button-group {
            display: flex;
            gap: 20px;
        }

        .info-cell .btn {
            padding: 10px 20px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-to-cart {
            background-color: #007BFF;
        }

        .add-to-cart:hover {
            background-color: #0056b3;
        }

        /* Styling Filter Section */
        .book-filter .container {
            display: flex;
            margin-bottom: 20px;
        }

        .filter-section {
            flex-basis: 30%;
            background-color: #fff;
            max-width: 350px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            height: 370px;
        }

        .filter-section h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .filter-group {
            margin-bottom: 15px;
        }

        .filter-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        .filter-group input,
        .filter-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
            box-sizing: border-box;
            font-size: 17px;
        }

        .filter-group input:focus,
        .filter-group select:focus {
            border-color: #777;
            outline: none;
        }

        .filter-group button {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            margin-right: 2%;
            font-size: 14px;
        }

        .filter-group button:last-child {
            margin-right: 0;
            background-color: #6c757d;
        }

        .filter-group button:hover {
            background-color: #0056b3;
        }

        .filter-group button:last-child:hover {
            background-color: #5a6268;
        }

        /* Styling Sorting Filter Section */
        .sorting-filter-section {
            padding: 10px 0;
            margin-bottom: 20px;
        }

        .sorting-filter-section .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .text-container {
            flex: 1;
            text-align: left;
            font-size: 25px;
            color: #333;
            font-weight: 700;
            position: relative;
            padding-bottom: 10px;
            overflow: hidden;
        }

        .text {
            display: inline-block;
            position: relative;
        }

        .text span {
            display: inline-block;
            opacity: 0;
            animation: revealText 1.5s steps(10, end) infinite;
            animation-delay: calc(0.1s * var(--i));
        }

        .text span:nth-child(1) { --i: 0; }
        .text span:nth-child(2) { --i: 0.1; }
        .text span:nth-child(3) { --i: 0.2; }
        .text span:nth-child(4) { --i: 0.3; }
        .text span:nth-child(5) { --i: 0.4; }
        .text span:nth-child(6) { --i: 0.5; }
        .text span:nth-child(7) { --i: 0.6; }
        .text span:nth-child(8) { --i: 0.7; }
        .text span:nth-child(9) { --i: 0.8; }
        .text span:nth-child(10) { --i: 0.9; }

        @keyframes revealText {
            0% {
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        .button-container {
            display: flex;
            gap: 10px;
        }

        .sort-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-size: 0.9em;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .sort-button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
        }

        .sort-button:active {
            background-color: #004494;
            transform: translateY(0);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Styling Book Section */
        .book-section {
            padding: 20px;
            background-color: #f4f4f4;
        }

        .container {
            width: 90%;
            margin: 0 auto;
        }

        .row {
            margin-bottom: 30px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .row .col {
            flex-basis: 24%;
            max-width: 24%;
            background-color: #f7f8f9;
            padding: 20px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
            border-radius: 8px;
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 20px; /* Add spacing between rows */
        }

        .row .col:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .image-container {
            text-align: center;
            margin-bottom: 15px;
        }

        .image-container img {
            width: 200px;
            max-width: 250px;
            height: 200px;
            object-fit: contain;
        }

        .col .book-details {
            text-align: left;
            margin-bottom: 20px;
        }

        .col .book-name {
            font-size: 25px;
            font-weight: bold;
            margin: 0 0 10px;
        }

        .col .author-name {
            font-size: 1.2em;
            color: #555;
            margin: 0 0 10px;
        }

        .col .published-date,
        .price {
            font-size: 1.1em;
            color: #777;
            margin: 10px 0;
        }

        .col .price strong {
            color: orangered;
        }

        .col .button-group {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: -10px;
        }

        .col .btn {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            text-decoration: none;
            font-size: 0.9em;
            transition: background-color 0.3s;
            margin-right: 10px; /* Add spacing between buttons */
        }

        .col .btn:hover {
            background-color: #0056b3;
        }

        .col .btn.view-details {
            background-color: #28a745;
        }

        .col .btn.view-details:hover {
            background-color: #218838;
        }

        /* Media Query for responsiveness */
        @media (max-width: 768px) {
            .row .col {
                flex-basis: 48%; /* Two columns on medium screens */
                max-width: 48%;
            }
        }

        @media (max-width: 576px) {
            .row .col {
                flex-basis: 100%; /* One column on small screens */
                max-width: 100%;
            }
        }


        /* Styling Pagination Section */
        .book-section .pagination{
            display: flex;
            align-items: center;
            justify-content: center;
            color: #383838;
            padding: 10px 0;
            border-radius: 6px;
            text-align: center;
        }

        .pagination ul{
            margin: 20px 30px;
        }

        .pagination ul li{
            display: inline-block;
            margin: 0 10px;
            width: 45px;
            height: 45px;
            border-radius: 50%;
            text-align: center;
            font-size: 22px;
            font-weight: 500;
            line-height: 45px;
            cursor: pointer;
        }

        .pagination .prev-btn, .next-btn{
            display: inline-flex;
            align-items: center;
            font-size: 22px;
            font-weight: 500;
            color: #383838;
            background: transparent;
            outline: none;
            border: none;
            cursor: pointer;
        }

        .pagination .prev-btn i{
            width: 24px;
            margin-right: 15px;
        }

        .pagination .next-btn i{
            width: 24px;
            margin-left: 15px;
        }

        .pagination ul li.active{
            color: #fff;
            background-image: linear-gradient(#ff4568, #ff4568);
            background-repeat: no-repeat;
        }

        /* Customer Testimonal Section */
        .section__container {
            max-width: 1200px;
            margin: auto;
            padding: 2rem 1rem;
            text-align: center;
        }

        .section__container h2 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .section__container h1 {
            position: relative;
            margin: 1.5rem 0;
            font-size: 2.5rem;
            font-weight: 600;
            text-transform: capitalize;
            color: var(--text-dark);
        }

        .section__container h1::after {
            position: absolute;
            content: "";
            left: 50%;
            bottom: 0;
            transform: translateX(-50%);
            height: 2px;
            width: 5rem;
            background-color: var(--primary-color);
        }

        .section__grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
        }

        .section__card {
            position: relative;
            isolation: isolate;
            overflow: hidden;
            padding: 5rem 2rem 2rem;
            background-color: var(--white);
            border-radius: 5px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .section__card::before {
            position: absolute;
            content: "";
            top: 0;
            left: 0;
            transform: translate(-50%, -50%);
            width: 75%;
            aspect-ratio: 1;
            border-radius: 100%;
            background-color: var(--primary-color);
            z-index: -1;
            transition: 0.5s;
        }

        .section__card span {
            position: absolute;
            top: 0;
            left: 0;
            padding: 1rem;
            font-size: 3rem;
            color: var(--white);
        }

        .section__card h4 {
            margin-top: 4rem;
            margin-bottom: 1rem;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-color);
            transition: 0.3s;
        }

        .section__card p {
            margin-bottom: 2rem;
            color: var(--text-light);
            transition: 0.3s;
        }

        .section__card .image-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px; /* Fixed height for image container */
            margin-bottom: 1rem;
        }

        .section__card img {
            max-width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 100%;
            border: 2px solid var(--primary-color);
            transition: 0.3s;
        }

        .section__card h5 {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--primary-color);
            transition: 0.3s;
        }

        .section__card h6 {
            font-size: 1rem;
            font-weight: 400;
            color: var(--text-light);
            transition: 0.3s;
        }

        .section__card:hover::before {
            width: 400%;
        }

        .section__card:hover :is(h4, h5) {
            color: var(--white);
        }

        .section__card:hover :is(p, h6) {
            color: var(--secondary-color);
        }

        .section__card:hover img {
            border-color: var(--white);
        }
    </style>
    <%
        List<Genre> allGenres = (List<Genre>) request.getAttribute(StringUtils.GENRE_OBJECT);
        List<Book> featuredBooks = (List<Book>) request.getAttribute(StringUtils.FEATURED_BOOKS_OBJECT);
        List<Book> allBooks = (List<Book>) request.getAttribute(StringUtils.ALL_BOOKS_OBJECT);
    %>
</head>
<body>

<%@ include file="view/Header.jsp" %>

<!-- Slider Section -->
<div class="slider-content">
    <div class="container">

        <!-- Slider Section -->
        <div class="slider-box">
            <div class="slider">

                <!-- 1st Slider -->
                <%if(featuredBooks != null && !featuredBooks.isEmpty()){%>
                    <%for(Book book: featuredBooks){%>
                        <div class="slide">
                            <div class="info-cell">
                                <h1 class="book-title"><%= book.getBookTitle()%></h1>
                                <p><strong>Author:</strong> <%= book.getAuthorName()%></p>
                                <p><strong>Genre:</strong> <%= book.getGenreName()%></p>
                                <p><strong>Published:</strong> <%= book.getPublishDate()%></p>
                                <p class="book-description"><strong>Description:</strong> <%= book.getDescription()%></p>
                                <p><strong>Rating:</strong>
                                    <i class="fa fa-star star-gold"></i>
                                    <i class="fa fa-star star-gold"></i>
                                    <i class="fa fa-star star-gold"></i>
                                    <i class="fa fa-star star-gold"></i>
                                    <i class="fa fa-star-half-alt star-gold"></i> (4.2/5)
                                </p>
                                <p class="price"><strong>Price:</strong> <span>$<%= book.getPrice()%></span></p>
                                <p><strong>Language:</strong> <%=book.getLanguage()%></p>
                                <p class="availability">
                                    <strong>Availability:</strong>
                                    <%if(book.getQuantity() == 0){%>
                                        <span class="status">Out of Stock</span>
                                    <% } else {%>
                                    <span class="status">In Stock</span>
                                </p>
                                <div class="button-group">
                                    <a href="" class="btn add-to-cart">Add to Cart</a>
                                </div>
                                <%}%>
                            </div>
                            <div class="image-cell">
                                <%if(book.getImage() == null){%>
                                    <img src="${pageContext.request.contextPath}/assets/static images/default-book-images.jpg" alt="1984 Book" />
                                <%}else {%>
                                    <img src="${pageContext.request.contextPath}/assets/book images/<%= book.getImage()%>" alt="1984 Book" />
                                <% }%>
                            </div>
                        </div>
                    <%}}%>
            </div>
            <div class="slider-nav">
                <span class="nav-dot" onclick="currentSlide(1)"></span>
                <span class="nav-dot" onclick="currentSlide(2)"></span>
                <span class="nav-dot" onclick="currentSlide(3)"></span>
                <span class="nav-dot" onclick="currentSlide(4)"></span>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-section">
            <h2>Filter Books</h2>
            <form action="${pageContext.request.contextPath}/home" method="get">
                <div class="filter-group">
                    <label for="category">Category:</label>
                    <select id="category" name="category">
                        <option value="">Select Category</option>
                        <% if(allGenres != null && !allGenres.isEmpty()) { %>
                        <% for(Genre genre: allGenres) { %>
                        <option value="<%= genre.getGenreName() %>"><%= genre.getGenreName() %></option>
                        <% } %>
                        <% } %>
                    </select>
                </div>
                <div class="filter-group">
                    <label for="author">Author:</label>
                    <input type="text" id="author" name="author" placeholder="Enter author name">
                </div>
                <div class="filter-group">
                    <label for="date">Publication Date:</label>
                    <input type="date" id="date" name="date">
                </div>
                <div class="filter-group">
                    <button type="submit">Apply Filters</button>
                    <button type="reset">Reset Filters</button>
                </div>
            </form>
        </div>


    </div>
</div>

<!-- Filter by Price Section -->
<div class="sorting-filter-section">
    <div class="container">
        <div class="text-container">
            <span class="text">
                <span>O</span>
                <span>u</span>
                <span>r</span>
                <span> </span>
                <span>B</span>
                <span>o</span>
                <span>o</span>
                <span>k</span>
                <span>s</span>
            </span>
        </div>

        <div class="button-container">
            <form action="${pageContext.request.contextPath}/home" method="get">
                <button class="sort-button" type="submit" name="sortOrder" value="low-high">Low to High</button>
                <button class="sort-button" type="submit" name="sortOrder" value="high-low">High to Low</button>
            </form>
        </div>
    </div>
</div>

<!-- Books Section -->
<div class="book-section">
    <div class="container">
        <div class="row">
            <%
                if (allBooks != null) {
                    int count = 0; // Counter to manage column layout
                    for (Book book : allBooks) {
                        if (count % 4 == 0 && count != 0) {
            %></div>
        <div class="row"><%
    }
    %>
        <div class="col">
            <div class="image-container">
                <%if(book.getImage() != null){%>
                    <img src="${pageContext.request.contextPath}/assets/book%20images/<%= book.getImage() %>" alt="book-image">
                <%}else {%>
                    <img src="${pageContext.request.contextPath}/assets/static images/default-book-images.jpg" alt="1984 Book" />
                <%}%>
            </div>
            <div class="book-details">
                <h2 class="book-name"><%= book.getBookTitle() %></h2>
                <p class="author-name">Author: <%= book.getAuthorName() %></p>
                <p class="published-date">Published Date: <%= book.getPublishDate() %></p>
                <p class="price">Price: <strong>$<%= book.getPrice() %></strong></p>
                <p class="availability">
                    <strong>Availability:</strong>
                    <span class="status"><%= book.getQuantity() > 0 ? "In Stock" : "Out of Stock" %></span>
                </p>
            </div>
            <div class="button-group">
                <%if(book.getQuantity() == 0){%>
                    <a href="<%= request.getContextPath() %>/book-details?bookId=<%= book.getBookID() %>" class="btn view-details">View Details</a>
                <%} else {%>
                    <a href="#" class="btn add-to-cart">Add to Cart</a>
                    <a href="<%= request.getContextPath() %>/book-details?bookId=<%= book.getBookID() %>" class="btn view-details">View Details</a>
                <%}%>
            </div>
        </div>
        <%
                count++;
            }
        } else {
        %>
        <p>No books available.</p>
        <%
            }
        %>
    </div>
    </div>
</div>

<!-- Customer Testimonial Section -->
<div class="section__container">
    <h2>Testimonials</h2>
    <h1>What our members say</h1>
    <div class="section__grid">

        <div class="section__card">
            <span><i class="ri-double-quotes-l"></i></span>
            <h4>Love the simplicity</h4>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur maxime dignissimos facilis tenetur fuga itaque obcaecati corporis, quo quis dolorum aliquid perferendis dolor. Odit corporis nulla officia beatae vitae maiores.
            </p>
            <div class="image-container">
                <img src="${pageContext.request.contextPath}/assets/user%20profile%20images/customer1.png" alt="user" />
            </div>
            <h5>Cristiano Ronaldo</h5>
            <h6>Professional Singer</h6>
        </div>

        <div class="section__card">
            <span><i class="ri-double-quotes-l"></i></span>
            <h4>Excellent Designs</h4>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus dolorem in porro sed quisquam at consectetur consequatur nihil iusto, voluptatum iste, mollitia corrupti. Fugit error accusantium eius, eligendi quas facilis!
            </p>
            <div class="image-container">
                <img src="${pageContext.request.contextPath}/assets/static%20images/customer2.png" alt="user" />
            </div>
            <h5>Robert Downey Jr</h5>
            <h6>Professional Writer</h6>
        </div>

        <div class="section__card">
            <span><i class="ri-double-quotes-l"></i></span>
            <h4>Efficient and Reliable</h4>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Ut quas veniam ipsa eligendi, nulla voluptates molestiae? Nemo modi odit laborum neque repellendus, distinctio omnis aliquam dolor et fuga, earum temporibus?
            </p>
            <div class="image-container">
                <img src="${pageContext.request.contextPath}/assets/static%20images/customer3.png" alt="user" />
            </div>
            <h5>Thanos</h5>
            <h6>Professional Dancer</h6>
        </div>
    </div>
</div>

<%@ include file="view/Footer.jsp"%>
<script src="${pageContext.request.contextPath}/js/ImageSlider.js"></script>
<script src="${pageContext.request.contextPath}/js/BackgroundImageSlider.js"></script>
</body>
</html>