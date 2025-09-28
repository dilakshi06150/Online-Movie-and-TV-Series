<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to ReelVibe</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #1c1c1c;
            color: #fff;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow-x: hidden;
        }
        .welcome_nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background-color: #2c2c2c;
        }
        .welcome_nav h1 {
            font-size: 28px;
            color: #ff6f61;
        }
        .welcome_nav_list {
            list-style: none;
            display: flex;
        }
        .welcome_nav_list li {
            margin-left: 20px;
        }
        .welcome_nav_list a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }
        .welcome_nav_list a:hover {
            color: #ff6f61;
        }

        /* Slideshow container */
        .slideshow-container {
            position: relative;
            height: 100vh;
            overflow: hidden;
        }

        /* Each slide */
        .mySlides {
            display: none;
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0; /* Initially hidden */
            transition: opacity 1.5s ease-in-out; /* Smooth transition for fade effect */
        }

        /* Background images with darker effect */
        .mySlides img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(40%); /* Darken the images */
        }

        .welcome_content {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #fff;
            padding: 50px;
        }

        .welcome_content h2 {
            margin-bottom: 30px;
            font-size: 48px;
            color: #ff6f61;
        }

        .welcome_content p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        .welcome_buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .welcome_buttons a {
            background-color: #ff6f61;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        .welcome_buttons a:hover {
            background-color: #e65c50;
        }

        footer {
            background-color: #2c2c2c;
            text-align: center;
            padding: 20px 0;
            color: #fff;
            margin-top: auto;
        }

        .social_links {
            margin-top: 10px;
        }

        .social_links a {
            color: #ff6f61;
            margin: 0 10px;
            text-decoration: none;
            font-size: 20px;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .welcome_content h2 {
                font-size: 36px;
            }
            .welcome_nav h1 {
                font-size: 24px;
            }
            .welcome_nav_list {
                flex-direction: column;
                align-items: flex-start;
            }
            .welcome_nav_list li {
                margin-left: 0;
                margin-top: 10px;
            }
            .welcome_buttons {
                flex-direction: column;
            }
        }

        @media (max-width: 480px) {
            .welcome_content h2 {
                font-size: 28px;
            }
            .welcome_content p {
                font-size: 16px;
            }
            .welcome_buttons a {
                padding: 8px 16px;
                font-size: 14px;
            }
            .welcome_nav_list li {
                margin-top: 15px;
            }
        }

        /* Fade animation for the slides */
        .fade {
            animation: fadeIn 2s ease-in-out forwards; /* Fades in each slide */
        }

        /* Animation keyframes */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>
<body>
    <nav class="welcome_nav">
        <h1>ReelVibe</h1>
        <ul class="welcome_nav_list">
            <li><a href="faq.jsp">FAQ</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
    </nav>

    <!-- Slideshow Container -->
    <div class="slideshow-container">
        <div class="mySlides fade">
            <img src="image/im6.jpg" alt="Movie background 1">
        </div>
        <div class="mySlides fade">
            <img src="image/im2.jpg" alt="Movie background 2">
        </div>
        <div class="mySlides fade">
            <img src="image/im3.jpg" alt="Movie background 3">
        </div>
        <div class="mySlides fade">
            <img src="image/im4.jpg" alt="Movie background 4">
        </div>
        <div class="mySlides fade">
            <img src="image/im5.jpg" alt="Movie background 5">
        </div>

        <!-- Welcome content -->
        <div class="welcome_content">
            <h2>Welcome to ReelVibe</h2>
            <p>Your ultimate destination for browsing movies and TV series. Discover trending titles, top-rated content, and explore by genres. Join us and dive into the world of entertainment!</p>
            <div class="welcome_buttons">
                <a href="login.jsp">Login</a>
                <a href="register.jsp">Register</a>
            </div>
        </div>
    </div>

    <footer>
        <p>© 2024 ReelVibe - Your Movie & TV Series Destination</p>
        <div class="social_links">
            <a href="https://www.facebook.com" target="_blank">Facebook</a>
            <a href="https://www.twitter.com" target="_blank">Twitter</a>
            <a href="https://www.instagram.com" target="_blank">Instagram</a>
        </div>
    </footer>

    <script>
        let slideIndex = 0;
        showSlides();

        function showSlides() {
            let slides = document.getElementsByClassName("mySlides");
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  // Hide all slides
                slides[i].style.opacity = 0;       // Set opacity to 0 (hidden)
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1; }
            slides[slideIndex-1].style.display = "block";   // Show current slide
            slides[slideIndex-1].style.opacity = 1;         // Fade in current slide
            setTimeout(showSlides, 3000); // Change image every 3 seconds
        }
    </script>
</body>
</html>
