package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class homeOwnerReigster
 */
public class homeOwnerReigster extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public homeOwnerReigster() {
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
		           sql="insert into owner_info(email,name,dob,con_num,location) values('"+request.getParameter("email")+"','"+request.getParameter("name")+"',"
		           		+ "'"+request.getParameter("dob")+"','"+request.getParameter("contact")+"','"+request.getParameter("location")+"')";
		           int i = stmt.executeUpdate(sql);
		           System.out.println(i);
		           PrintWriter pw = response.getWriter();  
		           if(i > 0) {
		        	   try {
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
