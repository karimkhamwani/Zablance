package com.javatpoint;

import java.sql.*;

public class PostJob {
private int fk_categoryid,fk_loginId,fk_subcategoryid=0;
private String projectName ,projectBudget,projectReviews,projectDescription,categoryName ,subcategoryName=null;
private String isYourProject="true";
public int getFk_categoryid() {
	return fk_categoryid;
}
public void setFk_categoryid(int fk_categoryid) {
	this.fk_categoryid = fk_categoryid;
}
public int getFk_loginId() {
	return fk_loginId;
}
public void setFk_loginId(int fk_loginId) {
	this.fk_loginId = fk_loginId;
}
public String getProjectName() {
	return projectName;
}
public void setProjectName(String projectName) {
	this.projectName = projectName;
}
public String getProjectBudget() {
	return projectBudget;
}
public void setProjectBudget(String projectBudget) {
	this.projectBudget = projectBudget;
}
public String getProjectReviews() {
	return projectReviews;
}
public void setProjectReviews(String projectReviews) {
	this.projectReviews = projectReviews;
}
public String getIsYourProject() {
	return isYourProject;
}
public void setIsYourProject(String isYourProject) {
	this.isYourProject = isYourProject;
}
public int getFk_subcategoryid() {
	return fk_subcategoryid;
}
public void setFk_subcategoryid(int fk_subcategoryid) {
	this.fk_subcategoryid = fk_subcategoryid;
}
public String getProjectDescription() {
	return projectDescription;
}
public void setProjectDescription(String projectDescription) {
	this.projectDescription = projectDescription;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public String getSubcategoryName() {
	return subcategoryName;
}
public void setSubcategoryName(String subcategoryName) {
	this.subcategoryName = subcategoryName;
}

public void getCategoryIdfromDatabase(String categoryname){
	Connection con = ConnectDB.getConnection();
	
	try{
	String query = "Select ProjectCategories.CategoryId from ProjectCategories where ProjectCategories.CategoryName= ? ";
	PreparedStatement stm = con.prepareStatement(query);
	stm.setString(1, categoryname);
	ResultSet rs = stm.executeQuery();
	while(rs.next()){
		setFk_categoryid(rs.getInt(1));
		
	}
	}catch(Exception e){
		
				
	}
	
}
public void getsubCategoryIdfromDatabase(String subcategory){
	Connection con = ConnectDB.getConnection();
	
	try{
		String query = "select SubCategories.SubCategoryId from SubCategories where SubCategories.SubCategoryname= ?";
		PreparedStatement stm = con.prepareStatement(query);
		stm.setString(1, subcategory);
		ResultSet rs = stm.executeQuery();
		while(rs.next()){
			setFk_subcategoryid(rs.getInt(1));
			
		}
		}catch(Exception e){
			
					
		}
	
}

public boolean insertintoProjects(){
	Connection con = ConnectDB.getConnection();
	try{
		getCategoryIdfromDatabase(categoryName);
		getsubCategoryIdfromDatabase(subcategoryName);
		//String query = "Insert into Projects (fk_CategortId ,fk_LoginId,ProjectName,ProjectBudget,ProjectReviews,IsYourProject,fk_SubCategoryId,ProjectDescription)" + 
		//"Values('" + fk_categoryid 	+ "','" + fk_loginId+ "','" + projectName + "','" + projectBudget + "','" + projectReviews + "','"+isYourProject+"', '"+fk_subcategoryid+"','"+projectDescription+"')";
		String query = "Insert into Projects (fk_CategortId,fk_SubCategoryId,fk_LoginId,ProjectName,ProjectBudget,ProjectDescription)"+ "Values ('"+fk_categoryid+"','"+fk_subcategoryid+"','"+fk_loginId+"','"+projectName+"','"+projectBudget+"','"+projectDescription+"')";
		Statement st = con.createStatement();
		st.executeUpdate(query);
		return true;
		
	}catch(Exception e){
		return false;
	}
	
}

}
