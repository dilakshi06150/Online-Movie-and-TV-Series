<%@ page import="Model.MovieModel, Model.AddUserModel" %>
<%
    // Fetch the logged-in user's details from the session
    AddUserModel loggedInUser = (AddUserModel) session.getAttribute("loggedInUser");

    if (loggedInUser == null) {
        // If no user is logged in, redirect to the login page
        response.sendRedirect("login.jsp");
        return;
    }

    // Retrieve the movie details from the request
    MovieModel movie = (MovieModel) request.getAttribute("movie");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReelVibe - View Movie</title>
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
        }

        .home_nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background-color: #2c2c2c;
        }

        .home_nav h1 {
            font-size: 28px;
            color: #ff6f61;
        }

        .home_nav_list {
            list-style: none;
            display: flex;
        }

        .home_nav_list li {
            margin-left: 20px;
        }

        .home_nav_list a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
        }

        .home_nav_list a:hover {
            color: #ff6f61;
        }

        .logout_button {
            background-color: #ff6f61;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
            font-size: 16px;
        }

        .logout_button:hover {
            background-color: #e65c50;
        }

        .content {
            padding: 50px 5%;
            background-color: #121212;
            flex: 1;
        }

        h1 {
            color: #ff6f61;
            font-size: 32px; /* Adjusted size */
            margin-bottom: 20px;
        }

        p {
            font-size: 16px; /* Reduced font size */
            margin-bottom: 10px;
        }

        img {
            max-width: 300px; /* Fixed image width */
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .movie-actions {
            margin-top: 20px;
        }

        .movie-actions form, .movie-actions a {
            display: inline-block;
        }

        .movie-actions button, .movie-actions a {
            background-color: #ff6f61;
            color: #fff;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
            font-size: 16px;
            text-decoration: none;
            margin-right: 10px;
        }

        .movie-actions button:hover, .movie-actions a:hover {
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
    </style>
</head>
<body>
    <nav class="home_nav">
        <h1>ReelVibe</h1>
        <ul class="home_nav_list">
            <li><a href="#">Trending</a></li>
            <li><a href="#">Movies</a></li>
            <li><a href="#">TV Series</a></li>
            <li><a href="#">Top Rated</a></li>
            <li><a href="profile.jsp">Profile</a></li>
        </ul>
        <button class="logout_button" onclick="window.location.href='<%=request.getContextPath()%>/LogoutServlet'">Logout</button>
    </nav>

    <div class="content">
        <% if (movie != null) { %>
            <h1><%= movie.getTitle() %></h1>
            <p><strong>Genre:</strong> <%= movie.getGenre() %></p>
            <p><strong>Type:</strong> <%= movie.getType() %></p>
            <p><strong>Year:</strong> <%= movie.getYear() %></p>
            <p><strong>Description:</strong> <%= movie.getDescription() %></p>
            
            <h3>Movie Poster:</h3>
            <% if (movie.getImage() != null) { %>
                <img src="GetImageServlet?title=<%= movie.getTitle() %>" alt="Movie Image" />
            <% } else { %>
                <p>No image available</p>
            <% } %>

            <div class="movie-actions">
                <form action="AddToWatchlistServlet" method="post">
                    <input type="hidden" name="title" value="<%= movie.getTitle() %>" />
                    <button type="submit">Add to Watchlist</button>
                </form>
                <a href="comment.jsp?movieName=<%= movie.getTitle() %>">View Comments</a>
            </div>
        <% } else { %>
            <p>Movie details not available.</p>
        <% } %>
    </div>

    <footer>
        <p>© 2024 ReelVibe - Your Movie & TV Series Destination</p>
        <div class="social_links">
            <a href="https://www.facebook.com" target="_blank">Facebook</a>
            <a href="https://www.twitter.com" target="_blank">Twitter</a>
            <a href="https://www.instagram.com" target="_blank">Instagram</a>
        </div>
    </footer>
</body>
</html>
