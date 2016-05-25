package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DateService;
import model.ServiceProvider;
import model.User;


@SuppressWarnings("serial")
public class MatchMakerServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		DateService ds = ServiceProvider.getDateService();
		User me = (User)getServletContext().getAttribute("loggedUser");
		ArrayList<User> otherUsers = ds.getAllUsers();
		Iterator<User> iter = otherUsers.iterator();

		while (iter.hasNext()) {
		    User u = iter.next();

		    if (me.getUserID()==u.getUserID())
		    {
		        iter.remove();
		    }
		    else if(me.getGender().equals("Male")&&u.getSexuality().equals("I like women"))
		    {
		    	iter.remove();
		    }
		    else if(me.getGender().equals("Female")&&u.getSexuality().equals("I like men"))
		    {
		    	iter.remove();
		    }
		    else if(me.getAge()<u.getMinAge()||me.getAge()>u.getMaxAge())
		    {
		    	iter.remove();
		    }
		    else if(u.getAge()<me.getMinAge()||u.getAge()>me.getMaxAge()){
		    	iter.remove();
		    }
		}
		getServletContext().setAttribute("matchList", otherUsers);
		ds.readAll();
		getServletContext().setAttribute("userlist", ds.getAllUsers());
		req.getRequestDispatcher("/community/allmatches.jsp").forward(req, resp);
	}
}