package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DateService;
import model.ServiceProvider;
import model.User;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		if(username==null||username.equals("")||password==null||password.equals(""))
		{
			req.setAttribute("loginerror", "One or more fields are empty!");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
			return;
		}
		
		DateService ds= ServiceProvider.getDateService();
		User u = ds.loginUser(username, password);
		if(u==null)
		{
			req.setAttribute("loginerror", "Username and/or password is incorrect!");
			req.getRequestDispatcher("/index.jsp").forward(req, resp);
			return;
		}
		req.setAttribute("loginerror", "");
		getServletContext().setAttribute("loggedUser", u);
		resp.addCookie(new Cookie("cUsername", u.getUsername()));
		req.getRequestDispatcher("/user/myaccount.jsp").forward(req, resp);
	}
}
