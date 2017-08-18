<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Monitoring Page</title>
</head>
<body><%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	
	<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/watchfloor", "root",
			"S3cur37(!");
	System.out.println("I am in monitoring");
	Statement smt = con.createStatement();
String mn = (String)request.getParameter("monitor");
System.out.println(mn);
	if(mn.equalsIgnoreCase("physical_value")){
	System.out.println("I am in if loop");
	%>
	<h2>For Players:</h2>
	<%
		ResultSet rs = smt.executeQuery("Select * from checkin_data_player");
	if(rs.next()){
		System.out.println("Yes it has data");
	}
	%>
	<table style="width: 100%">
		<tr>
			<th>User Id</th>
			<th>Check In time</th>
			<th>Check Out time</th>
			<th>Attempts</th>
			<th>Status</th>
			<th>Bar code</th>
		</tr>
		<%
		while(rs.next()){
			%>
		<tr>
			<td>
				<%out.println(rs.getString(1));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(2));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(3));%>
			</td>
			<td>
				<%out.println(rs.getInt(4));%>
			</td>
			<td>
				<%out.println(rs.getBoolean(5));%>
			</td>
			<td>
				<%out.println(rs.getString(6));%>
			</td>
		</tr>
		<%
							
			}%>
	</table>
	<% 
	

}
	else if ((mn.equalsIgnoreCase("networking"))){
		out.println("Networking details");
		ResultSet rs = smt.executeQuery("Select * from MonitorData ");
		%>
	<table style="width: 100%">
		<tr>
			<th>Record  Id</th>
			<th>User</th>
			<th>Ip Address of the User</th>
			<th> Login Time</th>
			<th>Source Address</th>
			<th>Protocol</th>
			<th>Size of Packets</th>
		</tr>
		<% 
		while(rs.next()){	
			%>

		<tr>
			<td>
				<%out.println(rs.getInt(1));%>
			</td>
			<td>
				<%out.println(rs.getString(2));%>
			</td>
			<td>
				<%out.println(rs.getString(3));%>
			</td>
			<td>
				<%out.println(rs.getString(4));%>
			</td>
			<td>
				<%out.println(rs.getString(5));%>
			</td>
			<td>
				<%out.println(rs.getString(6));%>
			</td>
			<td>
				<%out.println(rs.getInt(7));%>
			</td>
		</tr>
		<%
			
		}
		%>
	</table>
	<% 
	}
	else if ((mn.equalsIgnoreCase("robot"))){
		ResultSet rs = smt.executeQuery("Select * from robot_data");
		%>
	<table style="width: 80%">
		<tr>
			<th>Record Id</th>
			<th>Sample Input time</th>
			<th>Bar Code</th>
			<th>Email</th>
			<th>Weight</th>
			<th>Time Analyzed</th>
		</tr>
		<%
		while(rs.next()){
				%>
		<tr>
			<td>
				<%out.println(rs.getInt(1));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(2));%>
			</td>
			<td>
				<%out.println(rs.getString(3));%>
			</td>
			<td>
				<%out.println(rs.getString(4));%>
			</td>
			<td>
				<%out.println(rs.getFloat(5));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(6));%>
			</td>
		</tr>
		<%				
				}
			%>
	</table>
	<% 
	}
	
}catch(Exception e){
	System.out.println(e);
	
}
%>

</body>
</html>