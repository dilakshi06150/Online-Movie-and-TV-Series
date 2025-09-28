package Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Controller.DBConnect;
import Model.AddUserModel;
import Model.InquiryModel;

public class InquiryService                                      	 {

    public void insertInquiry(InquiryModel IqMod) {
        try {
            String username = IqMod.getUsername();
            String inq = IqMod.getInquiry();

            DBConnect db = new DBConnect();
            String sql = "INSERT INTO inquiry (username, inquiry) VALUES (?, ?)";

            PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, inq);

            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateInquiry(InquiryModel IqMod) {
        try {
            String username = IqMod.getUsername();
            int id = IqMod.getInqID();
            String inq = IqMod.getInquiry();

            DBConnect db = new DBConnect();
            String sql = "UPDATE inquiry SET username = ?, inquiry = ? WHERE id = ?";

            PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, inq);
            pstmt.setInt(3, id);

            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteData(InquiryModel IqMod) {
        try {
            int id = IqMod.getInqID();
            DBConnect db = new DBConnect();
            String sql = "DELETE FROM inquiry WHERE id = ?";
            PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<InquiryModel> getAllInquiries() {
        List<InquiryModel> inquiries = new ArrayList<>();
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "SELECT * FROM inquiry";  // Ensure the table name is correct
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                InquiryModel inquiry = new InquiryModel();
                inquiry.setInqID(rs.getInt("id"));  // Match column name 'id'
                inquiry.setUsername(rs.getString("username")); // Match column name 'username'
                inquiry.setInquiry(rs.getString("inquiry")); // Match column name 'inquiry'
                inquiries.add(inquiry);
            }
            conn.close();

            // Debug print to check retrieved inquiries
            System.out.println("Retrieved inquiries: " + inquiries.size());
            for (InquiryModel inquiry : inquiries) {
                System.out.println("Inquiry ID: " + inquiry.getInqID() + ", Username: " + inquiry.getUsername() + ", Inquiry: " + inquiry.getInquiry());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return inquiries;
    }
    
    public InquiryModel getUserDetails(int id) throws ClassNotFoundException {
	    InquiryModel inq = null;
	    try {
	        DBConnect db = new DBConnect();
	        Connection conn = db.getConnection();

	        String sql = "SELECT * FROM inquiry WHERE id = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, id);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            inq = new InquiryModel();
	            inq.setInqID(rs.getInt("id"));
	            inq.setUsername(rs.getString("username"));
	            inq.setInquiry(rs.getString("inquiry"));
	            
	            // If you have more fields, fetch them here (e.g., email, image, etc.)
	        }

	        rs.close();
	        pstmt.close();
	        conn.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return inq;
	}
    
    
}
