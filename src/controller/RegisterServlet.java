package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DateService;
import model.ServiceProvider;
import model.User;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setAttribute("selectedSexuality", req.getParameter("sexuality"));
		req.setAttribute("selectedgender", req.getParameter("gender"));
		if(req.getParameter("username").trim().equals("")||req.getParameter("name").trim().equals("")||req.getParameter("gender").trim().equals("")||req.getParameter("email").trim().equals("")||req.getParameter("birthdate").trim().equals("")||req.getParameter("password").trim().equals("")||req.getParameter("sexuality").trim().equals("")||req.getParameter("minage").trim().equals("")||req.getParameter("maxage").trim().equals(""))
		{
			req.setAttribute("msgs", "One or more fields are empty!");
			req.getRequestDispatcher("/register.jsp").forward(req, resp);
		}
		User u=new User(req.getParameter("username"),req.getParameter("name"), req.getParameter("gender"),req.getParameter("email"),req.getParameter("birthdate"),req.getParameter("password"),req.getParameter("sexuality"), Integer.parseInt(req.getParameter("minage")), Integer.parseInt(req.getParameter("maxage")));
		if(!u.checkPassword(req.getParameter("password2")))
		{
			req.setAttribute("msgs", "Entered passwords don't match!");
			req.getRequestDispatcher("/register.jsp").forward(req, resp);
		}
		 else if(!u.checkEmail(u.getEmail()))
		 {
			 req.setAttribute("msgs", "This email-address is incorrect!");
			 req.getRequestDispatcher("/register.jsp").forward(req, resp);
		 }
		 else if(req.getParameter("agreement")==null)
		 {
			 req.setAttribute("msgs", "You haven't agreed to our Policy");
			 req.getRequestDispatcher("/register.jsp").forward(req, resp);
		 }
		 else if(!u.checkBirthdate(u.getBirthDate()))
		 {
			 req.setAttribute("msgs", "Invalid date!");
			 req.getRequestDispatcher("/register.jsp").forward(req, resp);
		 }
		 else if(u.getMinAge()>u.getMaxAge())
		 {
			 req.setAttribute("msgs", "Minimum age is greater than maximum age!");
			 req.getRequestDispatcher("/register.jsp").forward(req, resp);
		 }
		 else if(u.getMinAge()<18)
		 {
			 req.setAttribute("msgs", "Minimum age not allowed. Must be higher than 17");
			 req.getRequestDispatcher("/register.jsp").forward(req, resp);
		 }
		 else if(u.getMaxAge()<18)
		 {
			 req.setAttribute("msgs", "Maximum age not allowed. Must be higher than 17");
			 req.getRequestDispatcher("/register.jsp").forward(req, resp);
		 }
		 else
		 {
			 req.setAttribute("msgs", "");
			 DateService ds = ServiceProvider.getDateService();
			 if(ds.registerUserForm(u))
			 {
				 System.out.println("User geregistreerd!");
			 }
			 try{
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitmatch","root","");
				System.out.println("Database Connected!");
				PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users(username, name, gender, email, birthdate, sexuality, minimumage, maximumage, userPassword) VALUE(?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, u.getUsername());
				pstmt.setString(2, u.getName());
				pstmt.setString(3, u.getGender());
				pstmt.setString(4, u.getEmail());
				pstmt.setString(5, u.getBirthDate());
				pstmt.setString(6, u.getSexuality());
				pstmt.setInt(7, u.getMinAge());
				pstmt.setInt(8, u.getMaxAge());
				pstmt.setString(9, u.getPassword());
				pstmt.executeUpdate();
				u.setUserID(ds.lastUserID()+1);
				PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO profile(userID, description, job, hobby, country, hometown, smoker) VALUE(?,?,?,?,?,?,?)");
				pstmt2.setInt(1, u.getUserID());
				pstmt2.setString(2, "");
				pstmt2.setString(3, "");
				pstmt2.setString(4, "");
				pstmt2.setString(5, "");
				pstmt2.setString(6, "");
				pstmt2.setInt(7, 0);
				pstmt2.executeUpdate();
				conn.close();
			 }
			 catch(Exception e)
			 {
				 e.printStackTrace();
			 }
			 req.getRequestDispatcher("/index.jsp").forward(req, resp);
		 }
	 }
}