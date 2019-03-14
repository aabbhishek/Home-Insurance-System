package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class RigsUser
 */


public class RigsUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RigsUser() {
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
	           sql = "Insert into user_info(fname,lname,dob,email, password) values('"+request.getParameter("fname")+"','"+request.getParameter("lname") +"','"+request.getParameter("dob")+"','"+request.getParameter("email")+"','"+request.getParameter("password")+"') ";
	           int i = stmt.executeUpdate(sql);
	           PrintWriter pw = response.getWriter();
	           if(i>0) {
	        	   pw.print("true");
	           }
	           else {
	        	   pw.print("false");
	           }
	       } catch(Exception e) {
	    	   System.out.println(e);
	       }
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
