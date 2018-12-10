<!DOCTYPE html>
<html>
<head>
<style>
h1
{
text-align:center;
font-style:italic;
background-color:black;
opacity:0.8;
color:white;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th {
    background-color: #4CAF50;
    color: white;
}
td{
 background-color:#f2f2f2;
    color: black;
}
</style>
<body style="background-image:url(admindashboard.png);">
  		<h1>All Orders of Customer is:</h1>
</head>
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
	String custid=request.getParameter("custid");
	Class.forName("com.mysql.jdbc.Driver");  
   	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");  
    PreparedStatement pst = conn.prepareStatement("select i.item_id,type,i.weight,i.address_of_sender,i.address_of_receiver from item i,customer c where c.c_id=? and i.item_id = c.item_id");
   	pst.setString(1,custid);
    ResultSet rs = pst.executeQuery(); 
   	if(rs.next())
   	{
%>
   		<table style="width:100%">
   		 <tr>
   	     <th>ITEM ID</th>
   	     <th>TYPE</th>
   	     <th>WEIGHT(IN GM)</th>
   	  	 <th>ADDRESS OF SENDER</th>
   	  	<th>ADDRESS OF RECEIVER</th>
   	  	
   	    </tr>
   	            
   	           <tr>
   	           <td><% out.println(rs.getString(1)); %></td>
   	           <td><% out.println(rs.getString(2)); %></td>
   	           <td><% out.println(rs.getInt(3)); %></td>
   	           <td><% out.println(rs.getString(4));%></td>
   	           <td><% out.println(rs.getString(5));%></td>
   	           
   	            </tr>
   	    </table><br>
   	    <a href="welcome-admin.html"><button>Back</button></a>
<% 		
	}
   	else
   	{
      	RequestDispatcher rd = request.getRequestDispatcher("welcome-admin.html");
        rd.include(request, response);
       }
      
	}
  catch(Exception e)
  {       
      out.println("Something went wrong !! Please try again " + e);
  }
%>