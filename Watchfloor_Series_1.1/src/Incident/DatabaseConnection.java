package Incident;
import java.sql.*;
public class DatabaseConnection {

	public class Dbconnection {
	    public Connection con;
	    public Connection getConnection(){
	         
	        try{
	        	Class.forName("com.mysql.jdbc.Driver");
	        	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/watchfloor","root","S3cur37(!"); 
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return con;
	         
	    }
	         
	         
	         
	    }
	     
	    

}
