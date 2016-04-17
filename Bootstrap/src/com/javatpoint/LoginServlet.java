package com.javatpoint;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String firstname = request.getParameter("firstName");
		String password = request.getParameter("password");
		Login newlogin = new Login();
		newlogin.setFirstname(firstname);
		newlogin.setPassword(password);
		newlogin.validate();
		boolean status = newlogin.isValidUser();
		boolean CalculateNumberofProjects = newlogin.numberOfProjects();
		boolean CalculateallProjects = newlogin.allProjectExisits();
		int allprojects = newlogin.getAllProjects();
		int numberofProjects = newlogin.getNumberOfProjects();
		HttpSession session = request.getSession();

		if(status && CalculateNumberofProjects &&CalculateallProjects){
			//session.setAttribute("AllProjects", allprojects);
			//session.setAttribute("NumberofProjects", numberofProjects);
			session.setAttribute("fn",firstname);
			session.setAttribute("LoginId", newlogin.getLoginId());
			response.sendRedirect("MyProjects.jsp?loginid="+newlogin.getLoginId());
			
			
		}else {
			
			response.sendRedirect("Login.jsp");
		}

	}

}
