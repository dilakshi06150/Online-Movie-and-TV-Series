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
    <title>ReelVibe - User Profile</title>
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

        /* Logout Button */
        .logout_button {
            background-color: #ff6f61;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
        }
        .logout_button:hover {
            background-color: #e65c50;
        }

        /* Profile Content */
        .profile_content {
            padding: 50px 5%;
            background-color: #121212;
            flex: 1;
        }

        /* Profile Card */
        .profile_card {
            background-color: #333;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 20px;
            text-align: center;
            width: 400px;
            margin: 0 auto;
        }
        .profile_card img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
        }
        .profile_info h2 {
            margin: 20px 0;
            font-size: 24px;
            color: #ff6f61;
        }
        .profile_info p {
            font-size: 16px;
            color: #bbb;
        }

        /* Action Buttons */
        .profile_actions {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .profile_button {
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .profile_button.edit {
            background-color: #ff6f61;
            color: white;
            border: none;
        }
        .profile_button.edit:hover {
            background-color: #e65c50;
        }
        .profile_button.delete {
            background-color: #e74c3c;
            color: white;
            border: none;
        }
        .profile_button.delete:hover {
            background-color: #c0392b;
        }
        .profile_button.inquiry {
            background-color: #3498db;
            color: white;
            border: none;
        }
        .profile_button.inquiry:hover {
            background-color: #2980b9;
        }

        /* Profile Stats */
        .profile_stats {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 30px;
        }
        .stat_item {
            background-color: #2c2c2c;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            padding: 15px;
            text-align: center;
            width: 180px;
        }
        .stat_item h3 {
            font-size: 18px;
            color: #ff6f61;
            margin-bottom: 10px;
        }
        .stat_item p {
            font-size: 16px;
            color: #fff;
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
            <li>
                <a href="<%=request.getContextPath()%>/LogoutServlet" class="logout_button">Logout</a>
            </li>
        </ul>
    </nav>

    <!-- Profile Content -->
    <div class="profile_content">
        <!-- User Profile Card -->
        <div class="profile_card">
            <img src="ProfileImageServlet?username=<%= loggedInUser.getUsername() %>" alt="User Profile Picture" />

            <div class="profile_info">
                <h2><%= loggedInUser.getUsername() %></h2>
                <p><strong>Name:</strong> <%= loggedInUser.getName() %></p>
                <p><strong>Date of Birth:</strong> <%= loggedInUser.getDob() %></p>
                <!-- Profile Action Buttons -->
                <div class="profile_actions">
                    <a href="editprofile.jsp" class="profile_button edit">Edit</a>
                    <a href="deleteprofile.jsp" class="profile_button delete">Delete</a>
                    <a href="inquiry.jsp" class="profile_button inquiry">Inquiry</a> <!-- Inquiry Button -->
                </div>
            </div>
        </div>

        <!-- Profile Stats Section -->
        <div class="profile_stats">
            <div class="stat_item">
                <h3>Watchlist</h3>
                <p><span>10</span> Movies, <span>5</span> TV Series</p>
            </div>
            <div class="stat_item">
                <h3>Member Since</h3>
                <p><span>January 2023</span></p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 ReelVibe - Your Movie & TV Series Destination</p>
    </footer>
</body>
</html>