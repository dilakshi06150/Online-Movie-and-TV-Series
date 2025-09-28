<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.AddUserModel"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Inquiry - ReelVibe</title>
    <style>
        /* General body styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #121212; /* Dark background */
            color: #e0e0e0; /* Light text for better contrast */
            padding: 20px;
        }

        /* Header styles */
        h1 {
            text-align: center;
            color: #ff6f61; /* Primary color for headers */
            font-size: 2.5em;
            margin-bottom: 30px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        /* Form styles */
        form {
            background-color: #1e1e1e; /* Dark form background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2); /* Darker shadow for depth */
            max-width: 600px;
            margin: 0 auto;
        }

        label {
            display: block;
            font-size: 16px;
            color: #e0e0e0; /* Light label text */
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #333; /* Darker border */
            background-color: #2a2a2a; /* Dark background */
            color: #e0e0e0; /* Light text */
            border-radius: 8px;
            font-size: 16px;
            margin-bottom: 20px;
            transition: border 0.3s;
        }

        input[type="text"]:focus {
            border-color: #ff6f61; /* Highlight border on focus */
        }

        input[type="submit"] {
            background-color: #ff6f61; /* Primary button color */
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.3s;
            display: block;
            margin: 0 auto;
        }

        input[type="submit"]:hover {
            background-color: #e65550; /* Darker shade on hover */
            transform: translateY(-2px);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            form {
                width: 90%;
            }

            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>

<body>

    <h1>Edit Inquiry</h1>

    <form action="EditInquiry" method="post">
        <label for="IqId">Inquiry ID:</label>
        <input type="text" name="IqId" id="IqId" required>

        <label for="username">Username:</label>
        <input type="text" name="username" id="username" readonly value="<%= request.getParameter("username") %>">

        <label for="inquiry">Inquiry:</label>
        <input type="text" name="inquiry" id="inquiry" required>

        <input type="submit" value="Edit Inquiry">
    </form>

</body>

</html>
