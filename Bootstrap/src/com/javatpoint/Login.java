package com.javatpoint;
import java.util.*;
import java.sql.*;

public class Login {
private String Firstname,password;
private boolean isValid;
private int LoginId=0;
private int numberOfProjects=0;
private int allProjects=0;

public String getFirstname() {
	return Firstname;
}

public void setFirstname(String firstname) {
	Firstname = firstname;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public boolean isValidUser() {
	return isValid;
}

public void setValidUser(boolean isValid) {
	this.isValid = isValid;
}
public int getLoginId() {
	return LoginId;
}

public void setLoginId(int loginId) {
	LoginId = loginId;
}
public int getNumberOfProjects() {
	return numberOfProjects;
}

public void setNumberOfProjects(int numberOfProjects) {
	this.numberOfProjects = numberOfProjects;
}
public int getAllProjects() {
	return allProjects;
}

public void setAllProjects(int allProjects) {
	this.allProjects = allProjects;
}

	public void validate() {
		Connection con = ConnectDB.getConnection();

		try {
			String query = "Select * from login where Firstname=? and Password =?";
			PreparedStatement stmt = con.prepareStatement(query);

			stmt.setString(1, getFirstname());
			stmt.setString(2, getPassword());

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				setValidUser(true);
				int lid= rs.getInt(1);
				setLoginId(lid);			

			} else {
				setValidUser(false);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	
public boolean numberOfProjects(){
		Connection con = ConnectDB.getConnection();
		try{
			String query ="select COUNT(*) from Projects where Projects.fk_LoginId = ?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, LoginId);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()){
				int nop = rs.getInt(1);
				setNumberOfProjects(nop);
				return true;
			}
			
		}catch(Exception e){
			
					}
	
		return false;
		
	}

public boolean allProjectExisits(){
	Connection con = ConnectDB.getConnection();
	try{
		String query ="select COUNT(*) from Projects where Projects.fk_LoginId != ?";
		PreparedStatement stmt = con.prepareStatement(query);
		stmt.setInt(1, LoginId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()){
			int nop = rs.getInt(1);
			setAllProjects(nop);
			return true;
		}
		
	}catch(Exception e){
		
				}

	return false;
	
	
}



	
	
	

	

	

}
