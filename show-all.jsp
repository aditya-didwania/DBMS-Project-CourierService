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
.button
{
  width: 150px;
  margin-left:45%;

}
#submission {
  text-align: center;
  }
</style>
<body style="background-image:url(admindashboard.png);">
  		<h1>All Orders Are:</h1>
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
       	Class.forName("com.mysql.jdbc.Driver");  
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");    
        CallableStatement pst = conn.prepareCall("select c.c_id,c.name,c.mob_no,i.item_id,i.type,i.weight,i.address_of_sender,i.address_of_receiver from customer c,item i where c.item_id=i.item_id");
        ResultSet rs = pst.executeQuery();
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
              </tr>
<% 
       while(rs.next())
        {
 %>
 			<tr>
           <td><% out.print(rs.getString(1)); %></td>
      		<td><% out.print(rs.getString(2)); %></td>
           <td><% out.print(rs.getInt(3)); %></td>
           <td><% out.print(rs.getString(4));%></td>
           <td><% out.print(rs.getString(5));%></td>
           <td><% out.print(rs.getInt(6));%></td>
           <td><% out.print(rs.getString(7));%></td>
          	 <td><% out.print(rs.getString(8));%></td>
          	 
          	 </tr>
           
 <%
        }
%>
		</table>
<%
%>
<a href="welcome-admin.html" id="submission"><button class="button">Back</button></a>
 <%		}
		catch(Exception e)
		{       
    		out.println("Something went wrong !! Please try again " + e);
   		 }    
%>