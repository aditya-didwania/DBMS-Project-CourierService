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
<body style="background-image:url(user.jpg);">
<h1>Status of Your Order is</h1>
</head>
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
    	Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");  
        PreparedStatement pst = conn.prepareStatement("select c.c_id,c.name,c.mob_no,i.item_id,i.type,i.weight,i.address_of_sender,i.address_of_receiver,s.status from customer c,item i,shipment s where i.item_id=? and i.item_id=c.item_id and s.item_id=i.item_id");
        pst.setString(1,itemid);
        ResultSet rs = pst.executeQuery();  
   	if(rs.next())
   	{
%>
   		<table style="width:100%">
   		 <tr>
   		 <th>CUSTOMER ID</th>
   		 <th>CUSTOMER NAME</th>
   		 <th>CUSTOMER MOBILE NUMBER</th>
   	     <th>ITEM ID</th>
   	     <th>TYPE</th>
   	     <th>WEIGHT(IN GM)</th>
   	  	 <th>ADDRESS OF SENDER</th>
   	  	<th>ADDRESS OF RECEIVER</th>
   	  	<th>STATUS</th>
   	    </tr>
   	            
   	           <tr>
   	           <td><% out.println(rs.getString(1)); %></td>
   	           <td><% out.println(rs.getString(2)); %></td>
   	           <td><% out.println(rs.getInt(3)); %></td>
   	           <td><% out.println(rs.getString(4));%></td>
   	           <td><% out.println(rs.getString(5));%></td>
   	           <td><% out.println(rs.getString(6));%></td>
   	            <td><% out.println(rs.getString(7));%></td>
   	            <td><% out.println(rs.getString(8));%></td>
   	            <td><% out.println(rs.getString(9));%></td>
   	            </tr>
   	    </table><br>
   	    <a href="welcome-user.html"><button>Back</button></a>
<% 		
	}
   	else
   	{
      	RequestDispatcher rd = request.getRequestDispatcher("welcome-user.html");
        rd.include(request, response);
       }
      
	}
  catch(Exception e)
  {       
      out.println("Something went wrong !! Please try again " + e);
    		  %>
    		  <a href="welcome-user.html"><button>Back</button></a>
    		  <%
  }
%>