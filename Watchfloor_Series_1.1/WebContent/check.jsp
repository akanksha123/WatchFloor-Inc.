<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css">
<title> Check</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "Incident.DatabaseConnection" %>

<% 

String user_id = request.getParameter("email");
String password = request.getParameter("paswd");
try{
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/watchfloor","root","S3cur37(!");
	Statement smt = con.createStatement();
	System.out.println(user_id);
	System.out.println(password);
	String ink = "Select * from user where email='"+user_id+"'"+"and pwd='"+password+"'";
	//String sql_demo = "Select * from user where email="+user_id+" "+"and pwd="+password+"";
	System.out.println(ink);
	ResultSet rs = smt.executeQuery(ink);
		
	if(rs.next()){
			if(rs.getBoolean(3) == true){
				session.setAttribute("userid", user_id);
				session.setAttribute("user_type",rs.getString(4).charAt(0));
						
		response.sendRedirect("welcome.jsp");
			}
			else{
				response.sendRedirect("passwd.jsp");	
				
			}
	}
	else{
		int loginAttempt;
        if (session.getAttribute("loginCount") == null)
        {
            session.setAttribute("loginCount", 1);
            loginAttempt = 1;
            response.sendRedirect("errorPageRedirect.jsp");
        }
        else
        {
        	 //session.invalidate();
        	 System.out.println( request.getRemoteAddr() );
			System.out.println( request.getRemoteHost() );
        	 loginAttempt = (Integer) session.getAttribute("loginCount");
             loginAttempt++;
             session.setAttribute("loginCount",loginAttempt);
             System.out.println(loginAttempt);
             if(loginAttempt>5)
             {
            	 
            	 long lastAccessedTime = session.getLastAccessedTime();
            	 long prevlastAccessedTime = (long)session.getAttribute("lastAccessedTime");
            	 long timeDiff = lastAccessedTime - prevlastAccessedTime;
                 // 20 minutes in milliseconds  
                 if (timeDiff >= 5000000)
                 {
                     //invalidate user session, so they can try again
                     session.invalidate();
                    		 
                     } 
                 else
                 {
                	 session.setAttribute("message","You have exceeded the 3 failed login attempt. Please try loggin in in 20 minutes, or call our customer service center at 1-800 555-1212.");
                     session.setAttribute("lastAccessedTime", session.getLastAccessedTime());
                     response.sendRedirect("maxLoginAttempts.jsp");
                
                  
                 }
            	 System.out.println(lastAccessedTime);
            	 System.out.println(prevlastAccessedTime);
           		
             }
             else
             {
             response.sendRedirect("errorPageRedirect.jsp");
             session.setAttribute("lastAccessedTime", session.getLastAccessedTime());
             }
        }
        
		
	}

}catch(Exception e){

	System.out.println(e);
}
%>
</body>
</html>