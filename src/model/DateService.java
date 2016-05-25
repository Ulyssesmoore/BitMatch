package model;

import java.util.ArrayList;
import java.util.Iterator;

import persistance.DateDAO;

public class DateService {
	private ArrayList<User> allUsers = new ArrayList<>();
	private DateDAO ddao = new DateDAO();
	
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
	
	public boolean deleteUserForm(User us)
	{
		boolean b = true;
		Iterator<User> iter = allUsers.iterator();

		while (iter.hasNext()) {
		    User u = iter.next();

		    if (us.getUserID()==u.getUserID())
		        iter.remove();
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
		User u = allUsers.get(allUsers.size()-2);
		return u.getUserID();
	}
	
	public ArrayList<User> getAllUsers(){
		return allUsers;
	}
	
	public User getUserByName(String username)
	{
		User u = null;
		for(User user:allUsers)
		{
			if(user.getUsername().equals(username))
			{
				u=user;
			}
		}
		return u;
	}
	public void createUser(User u)
	{
		ddao.create(u);
		registerUserForm(u);
		u.setUserID(lastUserID()+1);
	}
	
	public ArrayList<User> readAll()
	{
		allUsers = (ArrayList<User>) ddao.read();
		return allUsers;
	}
	
	public void updateUser(User u)
	{
		ddao.update(u);
	}
	
	public void deleteUser(User u)
	{
		ddao.delete(u);
		deleteUserForm(u);
	}
}