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
	String itemid=request.getParameter("itemid");
	Class.forName("com.mysql.jdbc.Driver");  
   	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");  
    PreparedStatement pst = conn.prepareStatement("delete  from item where item_id=?");
   	pst.setString(1,itemid);
    int count= pst.executeUpdate(); 
    RequestDispatcher rd=request.getRequestDispatcher("itdel.html");
    rd.include(request, response);
	}
   
   catch(Exception e){       
       out.println("Something went wrong !! Please try again " + e);
  
   } 
   %>