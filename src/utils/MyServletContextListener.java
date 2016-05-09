package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model.DateService;
import model.ServiceProvider;

public class MyServletContextListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		DateService ds = ServiceProvider.getDateService();
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitmatch","root","");
			System.out.println("Database Connected!");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT username, userPassword, name, gender, birthdate, email, sexuality, minimumage, maximumage FROM users");
			while(rs.next()){
				ds.registerUser(rs.getString("username"), rs.getString("userPassword"), rs.getString("email"), rs.getString("name"), rs.getString("gender"), rs.getString("birthdate"), rs.getString("sexuality"), rs.getInt("minimumage"), rs.getInt("maximumage"));
			}
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
}
