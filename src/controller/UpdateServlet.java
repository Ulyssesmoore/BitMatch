package controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DateService;
import model.ServiceProvider;
import model.User;

@SuppressWarnings("serial")
public class UpdateServlet extends HttpServlet{
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		DateService ds = ServiceProvider.getDateService();
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
		else{
			u.setName(name);
			u.setPassword(password);
			u.setEmail(email);
			u.setMinAge(min);
			u.setMaxAge(max);
			u.setGender(gender);
			u.setSexuality(sexuality);
			
			u.setDescription(description);
			u.setJob(job);
			u.setHobby(hobby);
			u.setHometown(hometown);
			u.setCountry(country);
			
			ds.updateUser(u);
			
			req.getRequestDispatcher("/user/myaccount.jsp").forward(req, resp);
		}
	}
}
