package model;

import java.util.ArrayList;

public class DateService {
	private ArrayList<User> allUsers = new ArrayList<>();
	
	public boolean registerUser(int id, String unm, String pw, String em, String nm, String gd, String bd, String pref, int mina, int maxa)
	{
		boolean b = true;
		User us = new User(unm, nm, gd, em, bd, pw, pref, mina, maxa);
		us.setUserID(id);
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
	
	public boolean setProfile(int id, String desc, String job, String hobby, String country, String hometown, boolean smoker)
	{
		boolean b=false;
		for (User u:allUsers)
		{
			if(u.getUserID()==id)
			{
				u.setDescription(desc);
				System.out.println(u.getName());
				u.setJob(job);
				u.setHobby(hobby);
				u.setCountry(country);
				u.setHometown(hometown);
				u.setSmoker(smoker);
			}
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
	
	public int lastUserID(){
		User u=allUsers.get(allUsers.size()-2);
		return u.getUserID();
	}
	
	public ArrayList<User> getAllUsers(){
		return allUsers;
	}
}
