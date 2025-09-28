
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ReelVibe - Register</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Roboto', sans-serif;
	background: url('image/bc4.jpg') no-repeat center center/cover;
	color: #fff;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	overflow: hidden;
	backdrop-filter: blur(8px);
}

.register-container {
	background-color: rgba(44, 44, 44, 0.9);
	padding: 30px; /* Reduced padding for a smaller form */
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	width: 300px; /* Reduced width for a more compact form */
	max-width: 100%;
	text-align: center;
	animation: fadeIn 1s ease-in-out;
}

.register-container h1 {
	margin-bottom: 15px; /* Reduced margin for a tighter layout */
	color: #ff6f61;
	font-size: 2em;
}

.register-container input {
	width: 100%;
	padding: 10px; /* Slightly reduced padding */
	margin: 8px 0; /* Reduced margin for a tighter form */
	border: none;
	border-radius: 5px;
	font-size: 0.9em; /* Reduced font size */
	background-color: #333;
	color: #fff;
}

.register-container label {
	color: #ff6f61;
	display: block;
	margin-top: 10px;
	margin-bottom: 5px;
}

.register-container button {
	width: 100%;
	padding: 10px; /* Reduced padding for the button */
	background-color: #ff6f61;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease-in-out;
	font-size: 0.9em; /* Reduced font size */
}

.register-container button:hover {
	background-color: #e65c50;
}

.register-container a {
	color: #ff6f61;
	text-decoration: none;
	display: block;
	margin-top: 8px;
	transition: color 0.3s;
	font-size: 0.75em; /* Reduced font size */
}

.register-container a:hover {
	color: #e65c50;
	text-decoration: underline;
}

.error-message {
	color: #ff6f61;
	font-size: 0.85em;
	margin-top: 10px;
	display: none;
}

.username-message {
	color: #ff6f61;
	font-size: 0.85em;
	margin-top: 5px;
	display: none;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
<script>
	function validateForm() {
		const password = document.getElementById('password').value;
		const repassword = document.getElementById('repassword').value;
		const errorMessage = document.getElementById('error-message');
		const usernameMessage = document.getElementById('username-message');

		if (password !== repassword) {
			errorMessage.style.display = 'block';
			return false;
		} else if (usernameMessage.style.display === 'block') {
			return false;
		} else {
			errorMessage.style.display = 'none';
			return true;
		}
	}

	function checkUsernameAvailability() {
		const username = document.getElementById('username').value;
		const xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				const response = xhr.responseText;
				const message = document.getElementById('username-message');
				if (response === 'unavailable') {
					message.style.display = 'block';
					message.innerHTML = 'Username is already taken!';
				} else {
					message.style.display = 'none';
				}
			}
		};
		xhr.open("GET", "CheckUsernameServlet?username=" + username, true);
		xhr.send();
	}
</script>
</head>
<body>
	<div class="register-container">
		<h1>Register</h1>
		<form action="AddUserServlet" method="post"
			onsubmit="return validateForm()" enctype="multipart/form-data">
			<input type="text" id="username" name="username"
				placeholder="Username" required
				onkeyup="checkUsernameAvailability()">
			<p id="username-message" class="username-message">Username is already taken!</p>
			<input type="text" name="name" placeholder="Name" required>
			<input type="date" name="dob" placeholder="Date of Birth" required>
			<input type="password" id="password" name="password" placeholder="Password" required> 
			<input type="password" id="repassword" name="repassword" placeholder="Re-enter Password" required>
			<input type="file" placeholder="profile image" name="poster" accept="image/*" required>
			<button type="submit">Register</button>
			<p id="error-message" class="error-message">Passwords do not
				match!</p>
		</form>

		<a href="login.jsp">Already have an account? Login</a>
	</div>
</body>
</html>
