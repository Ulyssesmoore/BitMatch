package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DateService;
import model.ServiceProvider;
import model.User;

@SuppressWarnings("serial")
public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NumberFormatException
	{
		DateService ds = ServiceProvider.getDateService();
		ds.readAll();
		getServletContext().setAttribute("userlist", ds.getAllUsers());
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
		
		else if(ds.checkUsername(u.getUsername()))
		{
			req.setAttribute("msgs", "This username already exists!");
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
			
			ds.createUser(u);
			
			req.getRequestDispatcher("/welcome.jsp").forward(req, resp);
		}
	 }
}