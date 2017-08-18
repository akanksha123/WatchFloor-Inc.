<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Welcome, Homepage</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/watchfloor", "root",
			"S3cur37(!");
	Statement smt = con.createStatement();
	
  String s = (String)session.getAttribute("userid");
	Character c = (Character)session.getAttribute("user_type");
 	System.out.println(s);
 	System.out.println(c);
 	%>
	<br>
	<h1>
		Welcome
		<% out.println(s);%>
	</h1>
	<h2>Please find your report below:</h2>
	<br>
	<br>

	<% 
	
	if(s != null){
			if(c=='P'){
				String ink = "select * from player_results where email='"+s+"'";
				System.out.println(ink);
				 ResultSet rs = smt.executeQuery(ink);
			if(rs.next()){
				%>
	<table style="width: 100%">
		<tr>
			<th>Record Id</th>
			<th>Email id</th>
			<th>Sample Acquired date</th>
			<th>Disposal date</th>
			<th>Time of Analysis</th>
			<th>Sample Mass</th>
			<th>Drug PPM</th>
			<th>Manager Name</th>
			<th>Result</th>
		</tr>
		<tr>
			<td>
				<%out.println(rs.getInt(1));%>
			</td>
			<td>
				<%out.println(rs.getString(2));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(3));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(4));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(5));%>
			</td>
			<td>
				<%out.println(rs.getFloat(6));%>
			</td>
			<td>
				<%out.println(rs.getFloat(7));%>
			</td>
			<td>
				<%out.println(rs.getString(8));%>
			</td>
			<td>
				<%out.println(rs.getString(10));%>
			</td>

		</tr>
	</table>
	<% 
			}
			else{
			out.println("No Record Found");
			}
			}
			else if(c=='M'){
				String ink = "select * from player_results where manager_id='"+s+"'";
				System.out.println(ink);
				 ResultSet rs = smt.executeQuery(ink);
				 
				 %>
	<table style="width: 100%">
		<tr>
			<th>Record Id</th>
			<th>Email id</th>
			<th>Sample Acquired date</th>
			<th>Disposal date</th>
			<th>Time of Analysis</th>
			<th>Sample Mass</th>
			<th>Drug PPM</th>
			<th>Manager Name</th>
			<th>Result</th>
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
				<%out.println(rs.getTimestamp(3));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(4));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(5));%>
			</td>
			<td>
				<%out.println(rs.getFloat(6));%>
			</td>
			<td>
				<%out.println(rs.getFloat(7));%>
			</td>
			<td>
				<%out.println(rs.getString(8));%>
			</td>
			<td>
				<%out.println(rs.getString(10));%>
			</td>

		</tr>
		<%
				
			}%>
	</table>
	<%
			}
			else if(c=='C'){
				String ink = "select * from player_results";
				System.out.println(ink);
				 ResultSet rs = smt.executeQuery(ink);
				 %>
	<table style="width: 100%">
		<tr>
			<th>Record Id</th>
			<th>Email id</th>
			<th>Sample Acquired date</th>
			<th>Disposal date</th>
			<th>Time of Analysis</th>
			<th>Sample Mass</th>
			<th>Drug PPM</th>
			<th>Manager Name</th>
			<th>Result</th>
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
				<%out.println(rs.getTimestamp(3));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(4));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp(5));%>
			</td>
			<td>
				<%out.println(rs.getFloat(6));%>
			</td>
			<td>
				<%out.println(rs.getFloat(7));%>
			</td>
			<td>
				<%out.println(rs.getString(8));%>
			</td>
			<td>
				<%out.println(rs.getString(10));%>
			</td>

		</tr>
		<%
							
			}%>
	</table>
	<%
			
					
		
	}
	else if (c =='A'){
		%>
	<h3 align= "center">
	Please select option:
	</h3>
	<form action = "Monitoring.jsp" method= "post">
	<select name = "monitor">
		<option value="physical_value">Physical</option>
		<option value="networking">Network Monitoring</option>
		<option value="robot">Robotics Monitoring</option>
	</select>
	<input class="button" type="submit" value="Submit">
	</form>
	<% 
		
	}
	
	}
	else{
		%>
	<script type="text/javascript">
		 alert("Invalid Session : Please login ");
		 window.location.href = "index.html";
		 </script>
	<% }
}catch(Exception e){
	
	System.out.println(e.getMessage());
	response.sendRedirect("index.html");
}
%>
	<br>
	<br>
	<br>
	<a href="Logout.jsp">LogOut</a>
	<br>
	<br>
	<br>
</body>
</html>