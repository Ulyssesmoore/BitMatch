package utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model.DateService;
import model.ServiceProvider;

public class MyServletContextListener implements ServletContextListener{
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		DateService ds = ServiceProvider.getDateService();
		ds.registerUser("Ulyssesmoore", "Test", "Ulysses@moore.com", "Ulysses Moore", "Male", "29-05-1995", "Female", 18, 25);
		ds.registerUser("Mountainclimber", "Test", "kirk@climbs.rocks", "James T. Kirk", "Male", "22-03-1976", "Male", 30, 45);
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
}
