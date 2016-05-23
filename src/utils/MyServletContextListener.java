package utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model.DateService;
import model.ServiceProvider;

public class MyServletContextListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		DateService ds = ServiceProvider.getDateService();
		ds.readAll();
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
}
