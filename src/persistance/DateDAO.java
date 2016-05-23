package persistance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class DateDAO {
	public User create(User u)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitmatch","root","");
			System.out.println("Database Connected!");
			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO users(username, name, gender, email, birthdate, sexuality, minimumage, maximumage, userPassword) VALUE(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, u.getUsername());
			pstmt.setString(2, u.getName());
			pstmt.setString(3, u.getGender());
			pstmt.setString(4, u.getEmail());
			pstmt.setString(5, u.getBirthDate());
			pstmt.setString(6, u.getSexuality());
			pstmt.setInt(7, u.getMinAge());
			pstmt.setInt(8, u.getMaxAge());
			pstmt.setString(9, u.getPassword());
			pstmt.executeUpdate();
			PreparedStatement pstmt2 = conn.prepareStatement("INSERT INTO profile(userID, description, job, hobby, country, hometown, smoker) VALUE(?,?,?,?,?,?,?)");
			pstmt2.setInt(1, u.getUserID());
			pstmt2.setString(2, "");
			pstmt2.setString(3, "");
			pstmt2.setString(4, "");
			pstmt2.setString(5, "");
			pstmt2.setString(6, "");
			pstmt2.setInt(7, 0);
			pstmt2.executeUpdate();
			conn.close();
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		return u;
	}
	
	public List<User> read()
	{
		List<User> userlist = new ArrayList<User>();
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitmatch","root","");
			System.out.println("Database Connected!");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT Users.userID, username, userPassword, name, gender, birthdate, email, sexuality, minimumage, maximumage FROM users");
			
			while(rs.next()){
				User u = new User(rs.getString("username"), rs.getString("name"), rs.getString("gender"), rs.getString("email"), rs.getString("birthdate"), rs.getString("userPassword"), rs.getString("sexuality"), rs.getInt("minimumage"), rs.getInt("maximumage"));
				u.setUserID(rs.getInt("Users.userID"));
				Statement stmt2 = conn.createStatement();
				ResultSet rs2 = stmt2.executeQuery("SELECT profile.userID, description, job, hobby, country, hometown, smoker FROM profile WHERE " + String.valueOf(rs.getInt("users.userID")) + "=userID");
				while(rs2.next())
				{
					u.setDescription(rs2.getString("description"));
					u.setJob(rs2.getString("job"));
					u.setHobby(rs2.getString("hobby"));
					u.setCountry(rs2.getString("country"));
					u.setHometown(rs2.getString("hometown"));
				}
				u.setUserID(rs.getInt("Users.userID"));
				userlist.add(u);
			}
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return userlist;
	}
	
	public User update(User u)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitmatch","root","");
			System.out.println("Database Connected!");
			PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET name=?,userPassword=?,email=?,minimumage=?,maximumage=?,gender=?,sexuality=? WHERE userID=?");
			pstmt.setString(1, u.getName());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setInt(4, u.getMinAge());
			pstmt.setInt(5, u.getMaxAge());
			pstmt.setString(6, u.getGender());
			pstmt.setString(7, u.getSexuality());
			pstmt.setInt(8, u.getUserID());
			pstmt.executeUpdate();
			
			PreparedStatement pstmt2 = conn.prepareStatement("UPDATE profile SET description=?,job=?,hobby=?,hometown=?,country=? WHERE userID=?");
			pstmt2.setString(1, u.getDescription());
			pstmt2.setString(2, u.getJob());
			pstmt2.setString(3, u.getHobby());
			pstmt2.setString(4, u.getHometown());
			pstmt2.setString(5, u.getCountry());
			pstmt2.setInt(6, u.getUserID());
			pstmt2.executeUpdate();

			conn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return u;
	}
	
	public boolean delete(User u)
	{
		boolean b = false;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitmatch","root","");
			System.out.println("Database Connected!");
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM profile WHERE userID=?");
			pstmt.setInt(1, u.getUserID());
			pstmt.executeUpdate();
			PreparedStatement pstmt2 = conn.prepareStatement("DELETE FROM users WHERE userID=?");
			pstmt2.setInt(1, u.getUserID());
			pstmt2.executeUpdate();
			b=true;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return b;
	}
}
