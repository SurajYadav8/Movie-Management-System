package db_connection;

import java.sql.*;
public class ConnectionProvider {
	public static Connection getCon()
	{
		try {
			String url="jdbc:mysql://localhost:3306/moviedb";
			
			String uname="root";
			String pass="";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,uname,pass);
			return con;
		}catch(Exception e) {
			return null;
		}
	}

}

