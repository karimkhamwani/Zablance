package com.javatpoint;
import java.sql.*;



public class SignUp {
	private String Firstname, Lastname, Password, Email;
	private int Contactnumber = 0;
	private Long creationDate,lastAccessTime;
	private int getUserId;
	private String sessionId;
	
	public int getContactnumber() {
		return Contactnumber;
	}

	public void setContactnumber(int contactnumber) {
		Contactnumber = contactnumber;
	}

	public String getFirstname() {
		return Firstname;
	}

	public void setFirstname(String firstname) {
		Firstname = firstname;
	}

	public String getLastname() {
		return Lastname;
	}

	public void setLastname(String lastname) {
		Lastname = lastname;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}
	public long getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Long creationDate) {
		this.creationDate = creationDate;
	}

	public long getLastAccessTime() {
		return lastAccessTime;
	}

	public void setLastAccessTime(long lastAccessTime) {
		this.lastAccessTime = lastAccessTime;
	}
	
	public int GetUserId() {
		return getUserId;
	}

	public void setUserId(int getUserId) {
		this.getUserId = getUserId;
	}
	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public boolean insert() {

		Connection con = ConnectDB.getConnection();
		try {
		
			String query = "Insert into login (Firstname ,lastname,Password,Email,Contact) " + "Values('" + Firstname
					+ "','" + Lastname + "','" + Password + "','" + Email + "','" + Contactnumber + "')";
			Statement st = con.createStatement();
			st.executeUpdate(query);
			return true;

		} catch (Exception e) {
			return false;
		}
	}
	
	public void UserId(String Username) {
		Connection con = ConnectDB.getConnection();
		try {
			String query = "Select loginId from Login where Firstname= ?";
			PreparedStatement stm = con.prepareStatement(query);
			stm.setString(1,Username);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				setUserId(rs.getInt(1));
			}

		} catch (Exception e) {

		}

	}
	
	public void createNewSession(){
		Connection con = ConnectDB.getConnection();
		try{
			
			String query= "Insert into Sessiontracking(SessionId,fk_LoginId,SessionCreateDate,SessionLastAccessedTime) Values('"+sessionId+"','"+getUserId+"','"+creationDate+"','"+lastAccessTime+"')";
			Statement st = con.createStatement();
			st.executeUpdate(query);
		}catch(Exception e){
			
			
		}
		
		
	}

	



	
	
	
	

}
