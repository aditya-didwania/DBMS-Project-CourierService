<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%
    try{
    	String itemid=request.getParameter("itemid");
    	String custid=request.getParameter("username");
    	String itemtype=request.getParameter("itemtype");
    	String itemweight=request.getParameter("itemweight");
    	String itempickupadd=request.getParameter("itempickupadd");
    	String itemdropadd=request.getParameter("itemdropadd");
    	Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");    
        Statement st=conn.createStatement();
        int i=st.executeUpdate("insert into item(item_id,type,weight,address_of_sender,address_of_receiver)values('"+itemid+"','"+itemtype+"','"+itemweight+"','"+itempickupadd+"','"+itemdropadd+"')");
    	out.println("Data is successfully inserted!"+custid);
%>
		<a href="user-login.html"><button>Back</button></a>
<%
    	}
	catch(Exception e)
	{
		out.println("Something went wrong !! Please try again " + e);
	}
%>
    	