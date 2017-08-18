<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Change Your Password</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>s
<%@ page session= "false" %>
<%

	String password1 = request.getParameter("pwd1");
	String user_id = request.getParameter("userid");
	
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/watchfloor","root","S3cur37(!");
	Statement smt = con.createStatement();
	int b = smt.executeUpdate("update user set pwd = '"+password1+"' where email = '"+user_id+"'");
	System.out.println(b);
	if(b==1){
		 int a = smt.executeUpdate("update user set flag = 1 where email = '"+user_id+"'");
		%>
		<script type="text/javascript">
		alert("Password Updated Successfully. Please login again");
		window.location.href = "index.html";
		</script> 
		<%
		
	}
	else{
	response.sendRedirect("passwd.jsp");
	}
	
	%>
</body>
</html>