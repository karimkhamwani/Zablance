package com.javatpoint;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignUpServlet
 */

public class SignUpServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
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
		
		String Fn = request.getParameter("firstName");
		String Ln = request.getParameter("lastName");
		String Pass = request.getParameter("password");
		String Email = request.getParameter("email");
		String ContactN = request.getParameter("contactNumber");
		SignUp user = new SignUp();
		int cn = Integer.parseInt(ContactN);
		user.setFirstname(Fn);
		user.setLastname(Ln);
		user.setPassword(Pass);
		user.setEmail(Email);
		user.setContactnumber(cn);
//		request.setAttribute("user", user);
		boolean status = user.insert();
			
		if(status){
			HttpSession session = request.getSession();
			
			long creationDate = session.getCreationTime();
			long lastAccess = session.getLastAccessedTime();
			String Sessionid = session.getId();
			user.UserId(Fn);
			user.setCreationDate(creationDate);
			user.setLastAccessTime(lastAccess);
			user.setSessionId(Sessionid);
			user.createNewSession();
			response.sendRedirect("Login.jsp");

			}
			
					
		
		
	}

}
