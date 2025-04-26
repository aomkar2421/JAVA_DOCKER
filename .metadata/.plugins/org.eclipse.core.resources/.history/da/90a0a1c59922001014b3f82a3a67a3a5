package com.om.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class EstablishConnection {
	Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.cj.mysql.jdbc.Driver");
		Connection con  = DriverManager.getConnection("jdbc:mysql://localhost:3306/dummy", "root", "root");
		return con;
	}
}
