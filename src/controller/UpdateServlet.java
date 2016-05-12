package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;

@SuppressWarnings("serial")
public class UpdateServlet extends HttpServlet{
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		req.setAttribute("editSexuality", req.getParameter("editsexuality"));
		req.setAttribute("editGender", req.getParameter("editgender"));
		User u = (User)getServletContext().getAttribute("loggedUser");
		
		String name = req.getParameter("editname");
		String password = req.getParameter("editpassword");
		String password2 = req.getParameter("editpassword2");
		String email = req.getParameter("editemail");
		String minage = req.getParameter("editminimumage");
		String maxage = req.getParameter("editmaximumage");
		String gender =req.getParameter("editgender");
		String sexuality = req.getParameter("editsexuality");
		
		System.out.println(name);
		
		String description = req.getParameter("editdescription");
		String job = req.getParameter("editjob");
		String hometown = req.getParameter("edithometown");
		String country = req.getParameter("editcountry");
		String hobby = req.getParameter("edithobby");
		
		int min = Integer.parseInt(minage);
		int max = Integer.parseInt(maxage);
		if(name.equals(""))
		{
			req.setAttribute("editerror", "Name field is empty!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(password.equals("")||password2.equals(""))
		{
			req.setAttribute("editerror", "One or both password fields are empty!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
	 	}
		else if(!password.equals(password2))
		{
			req.setAttribute("editerror", "Passwords don't match!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(email.equals(""))
		{
			req.setAttribute("editerror", "Email field is empty!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(!email.matches("^(((([\\w]+)\\.?)+[\\w]{1,})@((([\\w])+)\\.)+[\\w]{2,})$"))
		{
			req.setAttribute("editerror", "Email is invalid!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(minage.equals(""))
		{
			req.setAttribute("editerror", "Minimum age field is empty!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(maxage.equals(""))
		{
			req.setAttribute("editerror", "Maximum age field is empty!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(min>max)
		{
			req.setAttribute("editerror", "Minimum age is greater than maximum age!");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(min<18)
		{
			req.setAttribute("editerror", "Minimum age not allowed. Must be higher than 17");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		else if(max<18)
		{
			req.setAttribute("editerror", "Maximum age not allowed. Must be higher than 17");
			req.getRequestDispatcher("/user/editaccount.jsp").forward(req, resp);
		}
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitmatch","root","");
			System.out.println("Database Connected!");
			PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET name=?,userPassword=?,email=?,minimumage=?,maximumage=?,gender=?,sexuality=? WHERE userID=?");
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setInt(4, min);
			pstmt.setInt(5, max);
			pstmt.setString(6, gender);
			pstmt.setString(7, sexuality);
			pstmt.setInt(8, u.getUserID());
			pstmt.executeUpdate();
			
			PreparedStatement pstmt2 = conn.prepareStatement("UPDATE profile SET description=?,job=?,hobby=?,hometown=?,country=? WHERE userID=?");
			pstmt2.setString(1, description);
			pstmt2.setString(2, job);
			pstmt2.setString(3, hobby);
			pstmt2.setString(4, hometown);
			pstmt2.setString(5, country);
			pstmt2.setInt(6, u.getUserID());
			pstmt2.executeUpdate();
			
			conn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		req.getRequestDispatcher("/user/myaccount.jsp").forward(req, resp);
	}
}
