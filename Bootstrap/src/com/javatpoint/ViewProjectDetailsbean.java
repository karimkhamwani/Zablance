package com.javatpoint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ViewProjectDetailsbean {
private String projectName,projectDescription;
private String projectCategory;
private int projectBudget, projectReviews;
public String getProjectCategory() {
	return projectCategory;
}
public void setProjectCategory(String projectCategory) {
	this.projectCategory = projectCategory;
}
public String getProjectName() {
	return projectName;
}
public void setProjectName(String projectName) {
	this.projectName = projectName;
}
public String getProjectDescription() {
	return projectDescription;
}
public void setProjectDescription(String projectDescription) {
	this.projectDescription = projectDescription;
}
public int getProjectBudget() {
	return projectBudget;
}
public void setProjectBudget(int projectBudget) {
	this.projectBudget = projectBudget;
}
public int getProjectReviews() {
	return projectReviews;
}
public void setProjectReviews(int projectReviews) {
	this.projectReviews = projectReviews;
}

public void showDetails(int s){
	//int pid = Integer.parseInt(s);
	try{
		
		Connection con = ConnectDB.getConnection();
		String query ="select ProjectCategories.CategoryName , Projects.ProjectName,Projects.ProjectDescription,Projects.ProjectBudget,Projects.ProjectReviews from Projects inner join ProjectCategories on Projects.fk_CategortId = ProjectCategories.CategoryId where Projects.ProjectId=?";
		PreparedStatement st = con.prepareCall(query);
		st.setInt(1, s);
		ResultSet rs = st.executeQuery();
		while(rs.next()){
		setProjectCategory(rs.getString(1));
		setProjectName(rs.getString(2));
		setProjectDescription(rs.getString(3));
		setProjectBudget(rs.getInt(4));
		setProjectReviews(5);
		}
		}catch(Exception e){
		
		
	}
	
	
	
	
}
}
