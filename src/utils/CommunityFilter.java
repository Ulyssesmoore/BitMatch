package utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import controller.GetUserServlet;

public class CommunityFilter implements Filter {
	public void init(FilterConfig arg0) throws ServletException {}
	
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest r2 = (HttpServletRequest)req;
		System.out.println();
		if (req.getServletContext().getAttribute("loggedUser") == null) {
			r2.getRequestDispatcher("/index.jsp").forward(req, resp);
		} 
		else {
			chain.doFilter(req, resp);
		}

	}
	
	public void destroy(){}
}
