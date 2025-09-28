<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, Model.CommentModel, Model.AddUserModel, Model.MovieModel"%>
<%

// Fetch the list of comments for the movie
List<CommentModel> comments = (List<CommentModel>) request.getAttribute("comments");
%>
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
<title>ReelVibe - Comments</title>
<style>
/* Add your CSS styles */
body {
	font-family: Arial, sans-serif;
}

h2 {
	margin-bottom: 20px;
}

ul {
	list-style-type: none;
	padding: 0;
}

li {
	margin-bottom: 10px;
}

textarea {
	width: 100%;
	height: 100px;
	margin-bottom: 10px;
}

button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

form {
	margin-top: 20px;
}
</style>
</head>
<body>
	<h2>
		Comments for
		<%=request.getParameter("movieName")%></h2>

	<%
	if (comments != null && !comments.isEmpty()) {
	%>
	<ul>
		<%
		for (CommentModel comment : comments) {
		%>
		<li><strong>User ID <%=comment.getUserId()%>:
		</strong> <%=comment.getComment()%> <%
 if (loggedInUser != null && loggedInUser.getUsername() == comment.getUserId()) {
 %>
			<!-- Show Edit and Delete options for the logged-in user's comments -->
			<form action="EditCommentServlet" method="post"
				style="display: inline;">
				<input type="hidden" name="commentId"
					value="<%=comment.getCommentId()%>">
				<button type="submit">Edit</button>
			</form>
			<form action="DeleteCommentServlet" method="post"
				style="display: inline;">
				<input type="hidden" name="commentId"
					value="<%=comment.getCommentId()%>">
				<button type="submit">Delete</button>
			</form> <%
 }
 %></li>
		<%
		}
		%>
	</ul>
	<%
	} else {
	%>
	<p>No comments yet.</p>
	<%
	}
	%>

	<%
	if (loggedInUser != null) {
	%>
	<h3>Add a Comment</h3>

	<form action="AddCommentServlet" method="post">
		<textarea name="comment" placeholder="Enter your comment here..." required></textarea>
		<input type="hidden" name="movieName" value="<%=movie.getTitle()%>">
		<button type="submit">Enter Comment</button>
	</form>

	<%
	} else {
	%>
	<p>You need to log in to comment.</p>
	<%
	}
	%>
</body>
</html>
