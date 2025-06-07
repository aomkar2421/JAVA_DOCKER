package com.om.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class EstablishConnection {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//for docker
//		Connection con  = DriverManager.getConnection("jdbc:mysql://mysql-j2eewebapp:3306/dummy", "root", "root");
		
		//for local machine
		Connection con  = DriverManager.getConnection("jdbc:mysql://localhost:3306/dummy", "root", "root");
		return con;
	}
}
