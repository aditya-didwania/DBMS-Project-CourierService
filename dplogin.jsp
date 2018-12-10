<%@ page import ="java.sql.*" %>
<%@ page import =" java.sql.Connection" %>
<%@ page import ="java.sql.DriverManager" %>
<%@ page import ="java.sql.ResultSet" %>
<%@ page import ="java.sql.SQLException" %>
<%@ page import ="java.sql.Statement" %>
<%@ page import ="java.lang.*" %>
<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms" , "root" , "Adity@05");    
        PreparedStatement pst = conn.prepareStatement("select username,password from DELIVERY_PERSON where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();   
       
        if(rs.next()){           
          
           RequestDispatcher rd = request.getRequestDispatcher("welcome-dp.html");
           rd.forward(request, response);
        }
        else{
        	%>
        	<h1>You have entered incorrect password</h1>
            <% RequestDispatcher rd = request.getRequestDispatcher("dplogin.html");
            rd.include(request, response);
        }
   }
   catch(Exception e){       
	   out.println("Something went wrong !! Please try again ");
	   %>
	   	<br>
	   	<a href="index.html"><button>Back</button></a>
	   <%
	   	 }    
   
%>
