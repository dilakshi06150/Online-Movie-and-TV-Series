<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model.AddUserModel" %>
<% 
    // Fetch the logged-in user's details from the session
    AddUserModel loggedInUser = (AddUserModel) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        // If no user is logged in, redirect to login page
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReelVibe - Delete Profile</title>
    <style>
        /* Global Styles */
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
        }
        a {
            text-decoration: none;
            color: #ff6f61;
        }
        a:hover {
            color: #e65c50;
        }

        /* Navigation Bar */
        .profile_nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background-color: #2c2c2c;
        }
        .profile_nav h1 {
            font-size: 28px;
            color: #ff6f61;
        }
        .profile_nav_list {
            list-style: none;
            display: flex;
        }
        .profile_nav_list li {
            margin-left: 20px;
        }
        .profile_nav_list a {
            color: #fff;
            font-size: 16px;
        }
        .profile_nav_list a:hover {
            color: #ff6f61;
        }

        /* Form Content */
        .delete_profile_content {
            padding: 50px 5%;
            background-color: #121212;
            flex: 1;
        }

        .delete_profile_form {
            background-color: #333;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 20px;
            width: 400px;
            margin: 0 auto;
            text-align: center;
        }

        .delete_profile_form h2 {
            color: #ff6f61;
            margin-bottom: 20px;
        }

        .form_group {
            margin-bottom: 15px;
        }

        .form_group input {
            width: 100%;
            padding: 10px;
            background-color: #444;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
        }

        .form_group button {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            border: none;
        }

        .form_group button:hover {
            background-color: #c0392b;
        }

        /* Footer */
        footer {
            background-color: #2c2c2c;
            text-align: center;
            padding: 20px 0;
            color: #fff;
            margin-top: auto;
        }
        footer p {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="profile_nav">
        <h1>ReelVibe</h1>
        <ul class="profile_nav_list">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="#">Movies</a></li>
            <li><a href="#">TV Series</a></li>
            <li><a href="#">Top Rated</a></li>
            <li><a href="watchlist.jsp">Watchlist</a></li>
            <li><button class="logout_button" onclick="window.location.href='<%=request.getContextPath()%>/LogoutServlet'">Logout</button></li>
        </ul>
    </nav>

    <!-- Delete Profile Content -->
    <div class="delete_profile_content">
        <form class="delete_profile_form" action="DeleteUserServlet" method="post" onsubmit="return validateForm()">
            <h2>Delete Profile</h2>

            <div class="form_group">
                <input type="text" name="username" placeholder="Username" required>
            </div>

            <div class="form_group">
                <button type="submit">Delete</button>
            </div>
        </form>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ReelVibe - Your Movie & TV Series Destination</p>
    </footer>
</body>
</html>
