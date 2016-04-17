package com.javatpoint;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JobServlet
 */
@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryName = request.getParameter("categoryName"); //done
		String subcategoryName = request.getParameter("subCategories");//done
		String projectName = request.getParameter("projectName");//done
		String projectDescription = request.getParameter("ProjectDescription");//done
		String projectBudget = request.getParameter("projectBudget");//done
		int loginid = (int)request.getSession().getAttribute("LoginId");//done
		PostJob Project = new PostJob();
		Project.setCategoryName(categoryName);
		Project.setSubcategoryName(subcategoryName);
		Project.setProjectName(projectName);
		Project.setProjectDescription(projectDescription);
		Project.setProjectBudget(projectBudget);
		Project.setFk_loginId(loginid);
		
		boolean status = Project.insertintoProjects();
		if(status){
			response.sendRedirect("MyProjects.jsp");
			
		}
		
	
	
		
	}

}
