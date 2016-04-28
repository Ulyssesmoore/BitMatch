package model;

import java.util.ArrayList;

public class DateService {
	private ArrayList<User> allUsers = new ArrayList<>();
	
	public boolean registerUser(String unm, String pw, String em, String nm, String gd, String bd, String pref, int mina, int maxa)
	{
		boolean b = true;
		User us = new User(unm, nm, gd, em, bd, pw, pref, mina, maxa);
		for (User u:allUsers)
		{
			if(us.equals(u))
			{
				b=false;
			}
		}
		if(b)
		{
			allUsers.add(us);
		}
		return b;
	}
	
	public boolean registerUserForm(User us)
	{
		boolean b = true;
		for (User u:allUsers)
		{
			if(us.equals(u))
			{
				b=false;
			}
		}
		if(b)
		{
			allUsers.add(us);
		}
		return b;
	}
	
	public User loginUser(String uNm, String pw)
	{
		User user = null;
		for(User u:allUsers)
		{
			if(u.getUsername().equals(uNm)&&u.getPassword().equals(pw))
			{
				user=u;
			}
		}
		return user;
	}
}
