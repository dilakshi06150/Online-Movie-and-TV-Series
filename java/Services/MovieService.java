package Services;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import com.mysql.jdbc.Connection;

import Controller.DBConnect;
import Model.DeleteModel;
import Model.DeleteUserModel;
import Model.MovieModel;
import Model.UpdateModel;

public class MovieService {
	public void insertData(MovieModel mMod) {
	    
	    try {
	        String title = mMod.getTitle();
	        String genre = mMod.getGenre();
	        String type = mMod.getType();
	        int year = mMod.getYear();
	        String decription = mMod.getDescription();
	        InputStream imageStream = mMod.getImage();
	        
	        DBConnect db = new DBConnect();
	       
	        String sql = "INSERT INTO mvv (title, genre, type, year, description, image) VALUES (?, ?, ?, ?, ?, ?)";
	        
	        PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
	        
	        pstmt.setString(1, title);
	        pstmt.setString(2, genre);
	        pstmt.setString(3, type);
	        pstmt.setInt(4, year);
	        pstmt.setString(5, decription);
	        pstmt.setBlob(6, imageStream);
	        
	        pstmt.executeUpdate();
	        
	        pstmt.close();
	        
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	   
	}

	
	public ArrayList<MovieModel> showData() throws ClassNotFoundException {
	    ArrayList<MovieModel> movieList = new ArrayList<>();

	    try {
	        DBConnect db = new DBConnect();
	        String sql = "SELECT * FROM mvv";
	        Statement stmt = db.getConnection().createStatement();
	        ResultSet rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            MovieModel movie = new MovieModel();
	            movie.setTitle(rs.getString("title"));
	            movie.setGenre(rs.getString("genre"));
	            movie.setType(rs.getString("type"));
	            movie.setYear(rs.getInt("year"));
	            movie.setDescription(rs.getString("description"));

	            
	            Blob imageBlob = rs.getBlob("image");
	            if (imageBlob != null) {
	                movie.setImage(imageBlob.getBinaryStream());
	            } else {
	                movie.setImage(null); 
	            }

	            movieList.add(movie);
	        }

	        stmt.close();
	        rs.close();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return movieList;
	}



	
	public void updateData(UpdateModel upMod) {
		try {
			String title = upMod.getTitle();
			String newTitle = upMod.getNewtitle();
			String newtype = upMod.getNewtype();
			String newdec = upMod.getNewdec();
	        String newGenre = upMod.getNewGenre();
	        int newYear = upMod.getNewYear();
	        InputStream imageStream = upMod.getNewimg();
	        
			
			DBConnect db = new DBConnect();
			String sql = "UPDATE mvv SET title = ?, genre = ?, type = ?, year = ?, description = ?, image = ? WHERE title = ?";
	        PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
	        
	        pstmt.setString(1, newTitle); 
	        pstmt.setString(2, newGenre);
	        pstmt.setString(3, newtype);
	        pstmt.setInt(4, newYear); 
	        pstmt.setString(5, newdec); 
	        pstmt.setBlob(6, imageStream); 
	        pstmt.setString(7, title); 
       
	        pstmt.executeUpdate();
	        
	        pstmt.close();
	        
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteData(DeleteModel dMod) {
		try {
			String title = dMod.getTitle();
			
			DBConnect db = new DBConnect();
			
            String sql = "DELETE FROM mvv WHERE title = ?";
            PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
            pstmt.setString(1, title);

            pstmt.executeUpdate();
            
            pstmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public MovieModel getMovieByTitle(String title) throws ClassNotFoundException {
        MovieModel movie = null;

        try {
            DBConnect db = new DBConnect();
           

            String sql = "SELECT * FROM mvv WHERE title = ?";
            PreparedStatement pstmt = db.getConnection().prepareStatement(sql);
            pstmt.setString(1, title);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                movie = new MovieModel();
                movie.setTitle(rs.getString("title"));
                movie.setGenre(rs.getString("genre"));
                movie.setType(rs.getString("type"));
                movie.setYear(rs.getInt("year"));
                movie.setDescription(rs.getString("description"));

                // Get the image if available
                if (rs.getBlob("image") != null) {
                    movie.setImage(rs.getBlob("image").getBinaryStream());
                }
            }

            rs.close();
            pstmt.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movie;
    }
	
	
	
}
