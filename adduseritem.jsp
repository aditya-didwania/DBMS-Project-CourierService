<style>
h3{
text-align:center;
font-style:italic;
background-color:black;
opacity:0.9;
color:white;
}
div{
text-align:center;
font-size:30px;
}
.button
{
  width: 150px;
  margin-left:45%;

}
#submission {
  text-align: center;
  }
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Removed Dp</title>
</head>
<body style="background-image:url(user.jpg);">
    <h3>Notification</h3>
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
    	String custid=request.getParameter("custid");
    	String itemtype=request.getParameter("itemtype");
    	String itemweight=request.getParameter("itemweight");
    	String itempickupadd=request.getParameter("itempickupadd");
    	String itemdropadd=request.getParameter("itemdropadd");
    	Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");    
        Statement st=conn.createStatement();
        int i=st.executeUpdate("insert into item(item_id,type,weight,address_of_sender,address_of_receiver)values('"+itemid+"','"+itemtype+"','"+itemweight+"','"+itempickupadd+"','"+itemdropadd+"')");
        PreparedStatement pst = conn.prepareStatement("update customer set item_id=? where c_id=?");
       	pst.setString(1,itemid);
       	pst.setString(2,custid);
       	int count= pst.executeUpdate(); 
        out.println("<span style=\"font-weight:bold; color:black;font-size:30px \"> Data Inserted successfully </span>");
%>
		
		<a href="welcome-user.html" id="submission"><button class="button">Back</button></a>
<%
    	}
	catch(Exception e)
	{
		out.println("<span style=\"font-weight:bold; color:black;font-size:30px \">Something went wrong.Please Try Agin.. </span>"+e);
%>
		
		<a href="welcome-user.html" id="submission"><button class="button">Back</button></a>
<%
	}
%>
    	