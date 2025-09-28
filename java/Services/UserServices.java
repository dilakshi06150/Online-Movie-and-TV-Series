package Services;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Controller.DBConnect;
import Model.AddUserModel;
import Model.DeleteUserModel;
import Model.UpdateUserModel;

public class UserServices {
	public void insertUser(AddUserModel aum) {
		
			try {
				String username = aum.getUsername();
				String name = aum.getName();
				String bday = aum.getDob();
				String password = aum.getPassword();
				InputStream imageStream = aum.getImage();

				DBConnect db = new DBConnect();

				String sql = "INSERT INTO ud (username, name, dob, password, image) VALUES (?, ?, ?, ?, ?)";

				PreparedStatement pstmt = db.getConnection().prepareStatement(sql);

				pstmt.setString(1, username);
				pstmt.setString(2, name);
				pstmt.setString(3, bday);
				pstmt.setString(4, password);
				pstmt.setBlob(5, imageStream);

				pstmt.executeUpdate();

				pstmt.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}



	public void updateUser(UpdateUserModel uum) {
		try {
			String username = uum.getUsername(); 
			String newname = uum.getNewname();
			String newbday = uum.getNewdob();
			String newpassword = uum.getNewpassword();

			DBConnect db = new DBConnect();

			
			String sql = "UPDATE ud SET name = ?, dob = ?, password = ? WHERE username = ?";

			PreparedStatement pstmt = db.getConnection().prepareStatement(sql);

		
			pstmt.setString(1, newname);
			pstmt.setString(2, newbday);
			pstmt.setString(3, newpassword);
			pstmt.setString(4, username); 

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void deleteUser(AddUserModel aum) {

		try {
			String username = aum.getUsername();

			DBConnect db = new DBConnect();

			String sql = "DELETE FROM ud WHERE username = ?";

			PreparedStatement pstmt = db.getConnection().prepareStatement(sql);

			pstmt.setString(1, username);

			pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public AddUserModel validateUser(String username, String password) {
	    AddUserModel user = null;
	    try {
	        DBConnect db = new DBConnect();
	        Connection conn = db.getConnection();

	        String sql = "SELECT * FROM ud WHERE username = ? AND password = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, username);
	        pstmt.setString(2, password);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            user = new AddUserModel(); 
	            user.setUsername(rs.getString("username"));
	            user.setName(rs.getString("name"));
	            user.setDob(rs.getString("dob"));
	           
	            Blob imageBlob = rs.getBlob("image");
	            if (imageBlob != null) {
	                InputStream imageStream = imageBlob.getBinaryStream();
	                user.setImage(imageStream);
	            }
	        }

	        rs.close();
	        pstmt.close();
	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return user;  // Return the user object
	}

	
	
	
	public boolean isUsernameAvailable(String username) throws ClassNotFoundException {
        boolean available = true;
        try {
            DBConnect db = new DBConnect();
            
            String sql = "SELECT username FROM ud WHERE username = ?";
            
            PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
            
            pstmt.setString(1, username);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                available = false;
            }
            rs.close();
            pstmt.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return available;
    }
	
	public AddUserModel getUserDetails(String username) throws ClassNotFoundException {
	    AddUserModel user = null;
	    try {
	        DBConnect db = new DBConnect();
	        Connection conn = db.getConnection();

	        String sql = "SELECT * FROM ud WHERE username = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, username);

	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            user = new AddUserModel();
	            user.setUsername(rs.getString("username"));
	            user.setName(rs.getString("name"));
	            user.setDob(rs.getString("dob"));
	            // Fetching the image as a Blob
	            Blob imageBlob = rs.getBlob("image");
	            if (imageBlob != null) {
	                InputStream imageStream = imageBlob.getBinaryStream();
	                user.setImage(imageStream);  // Set the image stream in the model
	            }
	        }

	        rs.close();
	        pstmt.close();
	        conn.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}


}

