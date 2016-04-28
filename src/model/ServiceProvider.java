package model;

public class ServiceProvider {
	private static DateService service = new DateService();
	
	public static DateService getDateService()
	{
		return service;
	}
}
