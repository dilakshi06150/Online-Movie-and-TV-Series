<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="Model.InquiryModel"%>
<%@ page import="Model.AddUserModel"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="Services.InquiryService"%>
<%
// Fetch the logged-in user's details from the session
AddUserModel loggedInUser = (AddUserModel) request.getSession().getAttribute("loggedInUser");

if (loggedInUser == null) {
	// If no user is logged in, redirect to login page
	response.sendRedirect("login.jsp");
	return;
}

// Initialize InquiryService and fetch all inquiries
InquiryService inquiryService = new InquiryService();
List<InquiryModel> inquiries = inquiryService.getAllInquiries(); // Fetching all inquiries from the database
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inquiries - ReelVibe</title>
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

        /* Inquiry form styles */
        form {
            background-color: #1e1e1e; /* Dark form background */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2); /* Darker shadow for depth */
            max-width: 700px;
            margin: 0 auto 50px;
        }

        label {
            display: block;
            font-size: 16px;
            color: #e0e0e0; /* Light label text */
            margin-bottom: 10px;
        }

        input[type="text"],
        textarea {
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

        input[type="text"]:focus,
        textarea:focus {
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

        /* Inquiry table styles */
        h2 {
            text-align: center;
            color: #ff6f61; /* Same header color */
            font-size: 2em;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #1e1e1e; /* Dark table background */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* Slight shadow for depth */
            border-radius: 10px;
        }

        th,
        td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #333; /* Darker borders */
        }

        th {
            background-color: #ff6f61; /* Primary color for table headers */
            color: #ffffff; /* Light text for header */
            font-weight: bold;
        }

        td {
            color: #e0e0e0; /* Light text */
        }

        tr:hover {
            background-color: #2a2a2a; /* Hover effect for rows */
        }

        /* Action buttons */
        .action-btn {
            padding: 8px 12px;
            background-color: #28a745; /* Green button */
            color: #ffffff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .action-btn:hover {
            background-color: #218838;
        }

        .delete-btn {
            background-color: #dc3545; /* Red button */
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            form,
            table {
                width: 90%;
            }

            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>

<body>
    <h1>Inquiries</h1>

    <form action="AddInquiry" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" value="<%= loggedInUser.getUsername() %>" readonly required>

        <label for="inquiry">Your Inquiry:</label>
        <textarea name="inquiry" rows="5" required></textarea>

        <input type="submit" value="Submit Inquiry">
    </form>

    <h2>All Inquiries</h2>

    <table>
        <thead>
            <tr>
                <th>Inq. Id</th>
                <th>Username</th>
                <th>Inquiry</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
            if (inquiries != null && !inquiries.isEmpty()) {
                for (InquiryModel inquiry : inquiries) {
            %>
            <tr>
                <td><%= inquiry.getInqID() %></td>
                <td><%= inquiry.getUsername() %></td>
                <td><%= inquiry.getInquiry() %></td>
                <td>
                    <a href="editInq.jsp" class="action-btn">Edit</a>
                    <a href="deleteInq.jsp" class="action-btn delete-btn">Delete</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4" style="text-align:center;">No inquiries found.</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

</body>

</html>
