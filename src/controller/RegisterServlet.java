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
	 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
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
			 req.setAttribute("msgs", "Minimum Age is greater than Maximum Age!");
			 req.getRequestDispatcher("/register.jsp").forward(req, resp);
		 }
		 else
		 {
			 DateService ds = ServiceProvider.getDateService();
			 if(ds.registerUserForm(u))
			 {
				 System.out.println("User geregistreerd!");
			 }
			 req.getRequestDispatcher("/index.jsp").forward(req, resp);
		 }
	 }
}