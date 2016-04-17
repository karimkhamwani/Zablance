package com.javatpoint;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {

	private static ConnectDB instance = new ConnectDB();
	 public static final String URL = "jdbc:odbc:Zablance";
	 public static final String DRIVER_CLASS = "sun.jdbc.odbc.JdbcOdbcDriver"; 
	 private ConnectDB() {
	        try {
	            Class.forName(DRIVER_CLASS);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }
	 private Connection createConnection() {
	        Connection connection = null;
	        try {
	            connection = DriverManager.getConnection(URL);
	        } catch (SQLException e) {
	            System.out.println("ERROR: Unable to Connect to Database.");
	        }
	        return connection;
	    }   
	 public static Connection getConnection() {
	        return instance.createConnection();
	    }
	
}
