package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Services.CommentService;
import Model.AddUserModel;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch the comment text and movie name from the form
        String commentText = request.getParameter("comment");
        String movieName = request.getParameter("movieName");

        // Get the logged-in user from the session
        AddUserModel loggedInUser = (AddUserModel) request.getSession().getAttribute("loggedInUser");

        if (loggedInUser != null && commentText != null && !commentText.trim().isEmpty()) {
            // Use the user ID for the comment
            String userId = loggedInUser.getUsername();

            // Call the service to add the comment
            CommentService commentService = new CommentService();
            try {
                commentService.addComment(userId, movieName, commentText);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }

            // Redirect back to the comments page for this movie
            response.sendRedirect("ViewCommentsServlet?movieName=" + movieName);
        } else {
            // Handle the case where the user is not logged in or comment is empty
            response.sendRedirect("ViewCommentsServlet?movieName=" + movieName);
        }
    }
}