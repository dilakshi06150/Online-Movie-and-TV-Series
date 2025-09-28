package Services;

import java.sql.*;
import java.util.ArrayList;
import Model.CommentModel;
import Controller.DBConnect;

public class CommentService {

    // Add a new comment
	public void addComment(String userId, String movieName, String commentText) throws ClassNotFoundException, SQLException {
        Connection connection = DBConnect.getConnection();

        String query = "INSERT INTO comments (userId, movieName, comment) VALUES (?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, userId);
        preparedStatement.setString(2, movieName);
        preparedStatement.setString(3, commentText);

        preparedStatement.executeUpdate();
        preparedStatement.close();
        connection.close();
    }

    // Retrieve all comments for a specific movie
	public ArrayList<CommentModel> getCommentsByMovie(String movieName) throws ClassNotFoundException, SQLException {
        ArrayList<CommentModel> comments = new ArrayList<>();
        Connection con = DBConnect.getConnection(); // Assuming you have a DBConnect class
        PreparedStatement ps = con.prepareStatement("SELECT * FROM comments WHERE movieName = ?");
        ps.setString(1, movieName);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            CommentModel comment = new CommentModel();
            comment.setCommentId(rs.getInt("commentId")); // Assuming you have this in your DB
            comment.setMovieName(rs.getString("movieName"));
            comment.setComment(rs.getString("comment"));
            comment.setUserId(rs.getString("userId")); // Ensure this is set as a String
            comments.add(comment);
        }

        rs.close();
        ps.close();
        con.close();
        
        return comments;
    }



    // Update a comment by ID
    public void updateComment(int commentId, String newComment) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnect.getConnection();
            String query = "UPDATE comments SET comment = ? WHERE comment_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, newComment);
            pstmt.setInt(2, commentId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        pstmt.close();
        
        conn.close();
    }

    // Delete a comment by ID
    public void deleteComment(int commentId) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnect.getConnection();
            String query = "DELETE FROM comments WHERE comment_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, commentId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        pstmt.close();
        
        conn.close();
    }
}
