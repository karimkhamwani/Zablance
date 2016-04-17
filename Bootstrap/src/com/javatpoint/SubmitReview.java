package com.javatpoint;

import java.sql.Connection;
import java.sql.Statement;

public class SubmitReview {
private int projectId;
private int bit;
private int loginid;
private String Coverletter,cv;
public int getProjectId() {
	return projectId;
}
public void setProjectId(int projectId) {
	this.projectId = projectId;
}
public int getBit() {
	return bit;
}
public void setBit(int bit) {
	this.bit = bit;
}
public String getCoverletter() {
	return Coverletter;
	
}
public void setCoverletter(String coverletter) {
	Coverletter = coverletter;
}
public String getCv() {
	return cv;
}
public void setCv(String cv) {
	this.cv = cv;
}
public int getLoginid() {
	return loginid;
}
public void setLoginid(int loginid) {
	this.loginid = loginid;
}

public boolean InsertintorequestPending(){
	
	try{
		Connection con = ConnectDB.getConnection();
		String query ="Insert into RequestPending(fk_ProjectId,[Bit],[fk_LoginId],CoverLetter)"+"Values("+projectId+","+bit+","+loginid+",'"+Coverletter+"')";
		Statement stm = con.createStatement();
		stm.executeUpdate(query);
		return true;
		
		
	}catch(Exception e){}
	return false;
}

}
