package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DateService;
import model.ServiceProvider;

@SuppressWarnings("serial")
public class GetUserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String requestedUser=req.getParameter("userpage");
		DateService ds = ServiceProvider.getDateService();
		if(ds.getUserByName(requestedUser)==null)
		{
			req.getRequestDispatcher("/community/allusers.jsp").forward(req, resp);
			return;
		}
		req.setAttribute("requesteduser", ds.getUserByName(requestedUser));
		req.getRequestDispatcher("/community/requestedaccount.jsp").forward(req, resp);
	}
}
