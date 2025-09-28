<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReelVibe - FAQ</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            line-height: 1.6;
            overflow-x: hidden;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background-color: #1f1f1f;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        nav h1 {
            font-size: 32px;
            color: #00e6e6;
        }

        nav ul {
            list-style: none;
            display: flex;
        }

        nav ul li {
            margin-left: 20px;
        }

        nav ul a {
            color: #e0e0e0;
            text-decoration: none;
            font-size: 18px;
            transition: color 0.3s ease;
        }

        nav ul a:hover {
            color: #00e6e6;
        }

        .faq_content {
            padding: 60px 5%;
            text-align: left;
            background-color: #1e1e1e;
            border-radius: 10px;
            margin: 50px auto;
            width: 80%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }

        .faq_content h2 {
            margin-bottom: 30px;
            font-size: 36px;
            text-align: center;
            color: #e8e9e9;
        }

        .accordion {
            margin-bottom: 10px;
            background-color: #252525;
            border-radius: 10px;
            overflow: hidden;
            transition: max-height 0.4s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .accordion-header {
            padding: 15px;
            font-size: 20px;
            font-weight: bold;
            background-color: #333;
            cursor: pointer;
            color: #00e6e6;
            transition: background-color 0.3s ease;
        }

        .accordion-header:hover {
            background-color: #00e6e6;
            color: #1e1e1e;
        }

        .accordion-content {
            padding: 20px;
            background-color: #2a2a2a;
            color: #ccc;
            display: none;
            font-size: 16px;
            line-height: 1.8;
        }

        .active .accordion-content {
            display: block;
        }

        footer {
            background-color: #1f1f1f;
            padding: 20px 0;
            text-align: center;
            color: #e0e0e0;
            margin-top: 50px;
        }

        footer p {
            margin: 0;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <!-- Navigation -->
    <nav>
        <h1>ReelVibe</h1>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Trending</a></li>
            <li><a href="#">Movies</a></li>
            <li><a href="#">TV Series</a></li>
            <li><a href="#">Top Rated</a></li>
            <li><a href="#">Genres</a></li>
        </ul>
        <ul>
            <li><a href="login.jsp">LOGIN</a></li>
            <li>|</li>
            <li><a href="register.jsp">REGISTER</a></li>
        </ul>
    </nav>

    <!-- FAQ Content -->
    <div class="faq_content">
        <h2>Frequently Asked Questions</h2>

        <!-- Display each FAQ dynamically using JSTL -->
        <c:forEach var="faq" items="${faqList}">
            <div class="accordion">
                <div class="accordion-header">${faq.question}</div>
                <div class="accordion-content">${faq.answer}</div>
            </div>
        </c:forEach>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ReelVibe - Your Movie & TV Series Destination</p>
    </footer>

    <script>
        const accordions = document.querySelectorAll('.accordion-header');
        
        accordions.forEach(accordion => {
            accordion.addEventListener('click', () => {
                const parent = accordion.parentElement;
                parent.classList.toggle('active');
                
                const content = parent.querySelector('.accordion-content');
                if (parent.classList.contains('active')) {
                    content.style.display = 'block';
                } else {
                    content.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>
