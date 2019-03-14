package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	     final String DB_URL="jdbc:mysql://localhost:3306/his";
	     
	 //  Database credentials
	       final String USER = "root";
	       final String PASS = "";
	       
	       try{
	    	   Class.forName("com.mysql.jdbc.Driver");
	    	   
		    	// Open a connection
		           java.sql.Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
		           
		           // Execute SQL query
		           java.sql.Statement stmt = conn.createStatement();
		           String sql;
		           sql = "select * from user_info where email='"+request.getParameter("email")+"' and password='"+request.getParameter("password")+"'";
		           ResultSet rs = stmt.executeQuery(sql);
		           PrintWriter pw = response.getWriter();
		           HttpSession session=request.getSession();  
		           if(rs.next()) {
		        	   try {
		               session.setAttribute("fname",rs.getString(1));  
		               session.setAttribute("lname",rs.getString(2));
		               session.setAttribute("dob",rs.getString(3));
		               session.setAttribute("email",rs.getString(4));
		        	   pw.print("true");
		        	   }
		        	   catch(Exception e) {
		        		   System.out.println(e);
		        	   }
		           }
		           else {
		        	   pw.print("false");
		           }
	    	   
	       }
	       catch(Exception e) {
	    	   System.out.println(e);
	       }
	}

}
