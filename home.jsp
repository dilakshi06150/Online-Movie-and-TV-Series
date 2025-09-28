<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, Services.MovieService, Model.MovieModel, Model.AddUserModel"%>
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
<title>ReelVibe - Home</title>
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

.home_content {
	padding: 50px 5%;
	background-color: #121212;
	flex: 1;
}

.movie_section, .tv_section {
	margin-bottom: 50px;
}

.movie_section h2, .tv_section h2 {
	margin-bottom: 30px;
	font-size: 28px;
	color: #fff;
}

.image-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	grid-gap: 20px;
}

.movie-card {
	background-color: #333;
	border-radius: 10px;
	overflow: hidden;
	padding: 10px;
	display: flex;
	flex-direction: column;
	align-items: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
}

.image-box {
	width: 100%;
	height: 300px;
	border-radius: 10px;
	overflow: hidden;
	position: relative;
}

.image-box img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform 0.3s ease-in-out;
}

.image-box:hover img {
	transform: scale(1.1);
}

.movie-info {
	padding: 10px;
	text-align: center;
}

.movie-info h3 {
	margin-bottom: 10px;
	font-size: 20px;
	color: #ff6f61;
}

.movie-buttons {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.movie-buttons button {
	background-color: #ff6f61;
	color: #fff;
	border: none;
	padding: 10px 15px;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease-in-out;
	font-size: 14px;
}

.movie-buttons button:hover {
	background-color: #e65c50;
}

span {
	color: #ff6f61;
	font-size: 1.4em;
}

.movie-buttons button a {
	text-decoration: none;
	color: #fff;
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
.search_form {
    display: flex;
    align-items: center;
    margin-left: 20px;
}

.search_form input {
    padding: 8px;
    font-size: 16px;
    border-radius: 5px;
    border: none;
    outline: none;
    width: 200px;
    margin-right: 10px;
    background-color: #2c2c2c;
    color: #fff;
}

.search_form input::placeholder {
    color: #ccc;
}

.search_button {
    background-color: #ff6f61;
    color: #fff;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease-in-out;
    font-size: 14px;
}

.search_button:hover {
    background-color: #e65c50;
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
    <form action="SearchServlet" method="get" class="search_form">
        <input type="text" name="query" placeholder="Search for movies or TV series..." required>
        <button type="submit" class="search_button">Search</button>
    </form>
    <button class="logout_button" onclick="window.location.href='<%=request.getContextPath()%>/LogoutServlet'">Logout</button>
</nav>

	<div class="home_content">
		<section class="movie_section">
			<h2>
				<span><b>|</b></span> Popular Movies
			</h2>
			<div class="image-grid">
				<%
				MovieService movieService = new MovieService();
				ArrayList<MovieModel> movies = movieService.showData();
				for (MovieModel movie : movies) {
				%>
				<div class="movie-card">
					<div class="image-box">
						<img
							src="<%=movie.getImage() == null ? request.getContextPath() + "/images/placeholder.jpg"
		: request.getContextPath() + "/GetImageServlet?title=" + movie.getTitle()%>"
							alt="<%=movie.getTitle()%>">
					</div>
					<div class="movie-info">
						<h3><%=movie.getTitle()%></h3>
						<div class="movie-buttons">
							<button>Add to Watchlist</button>
							<form action="ViewMovieServlet" method="get">
								<input type="hidden" name="title" value="<%=movie.getTitle()%>" />
								<button type="submit">View Movie</button>
							</form>

						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</section>
	</div>
	<footer>
		<p>© 2024 ReelVibe - Your Movie & TV Series Destination</p>
		<div class="social_links">
			<a href="https://www.facebook.com" target="_blank">Facebook</a> <a
				href="https://www.twitter.com" target="_blank">Twitter</a> <a
				href="https://www.instagram.com" target="_blank">Instagram</a>
		</div>
	</footer>
</body>
</html>
