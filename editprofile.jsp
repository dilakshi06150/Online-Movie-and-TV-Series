<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.AddUserModel"%>
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
<title>Edit Profile - ReelVibe</title>
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

/* Edit Profile Form */
.edit_profile_content {
	padding: 50px 5%;
	background-color: #121212;
	flex: 1;
}

.edit_profile_form {
	background-color: #333;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	padding: 20px;
	width: 400px;
	margin: 0 auto;
}

.edit_profile_form h2 {
	color: #ff6f61;
	margin-bottom: 20px;
	text-align: center;
}

.form_group {
	margin-bottom: 15px;
}

.form_group label {
	display: block;
	margin-bottom: 5px;
	color: #fff;
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

.form_group input[type="submit"] {
	background-color: #ff6f61;
	color: white;
	cursor: pointer;
}

.form_group input[type="submit"]:hover {
	background-color: #e65c50;
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
			<li><button class="logout_button"
					onclick="window.location.href='<%=request.getContextPath()%>/LogoutServlet'">Logout</button></li>
		</ul>
	</nav>

	<!-- Edit Profile Content -->
	<div class="edit_profile_content">
		<form class="edit_profile_form" action="UpdateUserServlet" method="post" onsubmit="return validateForm()">
			<h2>Edit Profile</h2>

			<div class="form_group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username"
					value="<%=loggedInUser.getUsername()%>" readonly>
			</div>

			<div class="form_group">
				<label for="name">Name</label> <input type="text" id="name"
					name="nwname" value="<%=loggedInUser.getName()%>" required>
			</div>

			<div class="form_group">
				<label for="dob">Date of Birth</label> <input type="date" id="dob"
					name="nwdob" value="<%=loggedInUser.getDob()%>" required>
			</div>
			
			<div class="form_group">
				<label for="poster">Add New Password:</label> 
				<input type="password" id="password" name="nwpassword" placeholder="New Password" required>
			</div>
			
			<div class="form_group">
				<label for="poster">Add Profile Image:</label> 
				<input type="file" placeholder="profile image" name="poster" accept="image/*" required>
			</div>

			<div class="form_group">
				<input type="submit" value="Save Changes">
			</div>

			
		</form>
	</div>

	<!-- Footer -->
	<footer>
		<p>&copy; 2024 ReelVibe - Your Movie & TV Series Destination</p>
	</footer>
</body>
</html>

