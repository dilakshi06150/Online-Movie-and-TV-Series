package Controller;
import java.sql.*;

public class DBConnect {
	static final String url ="jdbc:mysql://localhost:3306/ttt";
	static final String username ="root";
	static final String password ="";
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException{
	
		Class.forName("com.mysql.jdbc.Driver");

		Connection connection = DriverManager.getConnection(url, username, password);

	
		return connection;
	}
}
