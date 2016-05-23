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
public class DeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		DateService ds = ServiceProvider.getDateService();
		User u = (User)getServletContext().getAttribute("loggedUser");
		ds.deleteUser(u);
		req.getRequestDispatcher("/index.jsp").forward(req, resp);
	}
}
