<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%
	try
	{
	String sid=request.getParameter("sid");
	String status=request.getParameter("status");
	  	Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");    
       	Statement st=conn.createStatement();
        PreparedStatement pst = conn.prepareStatement("update shipment set status=? where s_id=?");
       	pst.setString(1,status);
       	pst.setString(2,sid);
        int count= pst.executeUpdate(); 
        if(count>0)
    {
   	 	RequestDispatcher rd=request.getRequestDispatcher("statusupdated.html");
    	rd.include(request, response);
    }
    else
    {
    	RequestDispatcher rd=request.getRequestDispatcher("statuserror.html");
    	rd.include(request, response);
    }
    }
   
   catch(Exception e){       
       out.println("Something went wrong !! Please try again " + e);
  
   } 
   %>