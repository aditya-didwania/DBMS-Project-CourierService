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
<body style="background-image:url(admindashboard.png);">
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
    	String dpid=request.getParameter("dpid");
    	String dpusername=request.getParameter("dpusername");
    	String dppass=request.getParameter("dppass");
    	Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");    
        Statement st=conn.createStatement();
        int i=st.executeUpdate("insert into delivery_person(dp_id,username,password)values('"+dpid+"','"+dpusername+"','"+dppass+"')");
    	out.println("<span style=\"font-weight:bold; color:black;text-align:center;font-size:30px; \"> Delivery Person Successfully Added</span>");
%>
		<a href="welcome-admin.html" id="submission"><button class="button">Back</button></a>
<%
    	}
	catch(Exception e)
	{
		out.println("<span style=\"font-weight:bold; color:black;text-align:center;font-size:30px; \">Something went Wrong!! Please attempt again!! </span>" + e);
%>		<a href="welcome-admin.html"><button>Back</button></a>
<%
	}
%>