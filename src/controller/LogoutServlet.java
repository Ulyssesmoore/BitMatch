package controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LogoutServlet extends HttpServlet {
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		getServletContext().setAttribute("loggedUser", null);
		req.getSession().invalidate();
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
