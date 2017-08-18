<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
	<script type="text/javascript">
		
		function checkForm(form) {
			if (form.pwd1.value == "") {
				alert("Error: Password cannot be blank!");
				form.pwd1.focus();
				return false;
			}
			
			if (form.pwd1.value != "" && form.pwd1.value != form.pwd2.value) {
				alert("Error! Passwords do not match");
				form.pwd1.focus();
				return false;
			}
			return true;
		}
	</script>
	<form method="POST" action="passwordupdate.jsp" onsubmit="return checkForm(this);">
		<p>
			Enter User id again: <input type="text" name="userid">
		</p>
		<p>
			Create New Password <input type="password" name="pwd1">
		</p>
		<p>
			Confirm password <input type="password" name="pwd2">
		</p>
		<p>
			<input type="submit">
		</p>
	</form>
	
</body>
</html>