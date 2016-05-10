package model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
	private int userID;
	private String username;
	private String name;
	private String gender;
	private String email;
	private String birthDate;
	private String password;
	private String sexuality;
	private int age;
	private int minAge;
	private int maxAge;
	private Date creationDate;
	
	private String job;
	private String hometown;
	private String country;
	private String hobby;
	private String description;
	private boolean smoker;
	
	final String emailRegex ="^(((([\\w]+)\\.?)+[\\w]{1,})@((([\\w])+)\\.)+[\\w]{2,})$";
	final String dateRegex = "^(((((0[1-9]|[1-2][0-9]|3[0-1])-((0[13578])|10|12))|((0[1-9]|[1-2][0-9]|30)-((0[469])|11))|((0[1-9]|1[0-9]|2[0-8])-02))-((?!0000)([0-9]{4})))|(29-02-((?!0000)([0-9]{2}(([02468][048])|([13579][26]))))))$";
	
	public User(String unm,String nm, String gd, String em, String bd, String pw, String sl, int mina, int maxa)
	{
		setUsername(unm);
		setName(nm);
		setGender(gd);
		setEmail(em);
		setBirthDate(bd);
		setPassword(pw);
		setSexuality(sl);
		setMinAge(mina);
		setMaxAge(maxa);
		age = getMyAge();
	} 

	public String getUsername() {
		return username;
	}
	
	public boolean checkPassword(String pw)
	{
		boolean b = false;
		
		if(password.equals(pw))
		{
			b=true;
		}
		return b;
	}
	
	public boolean checkEmail(String email)
	{
		boolean b=false;
		if(email.matches(emailRegex))
		{
			b=true;
		}
		return b;
	}
	
	@SuppressWarnings("deprecation")
	public boolean checkBirthdate(String bd)
	{
		boolean b=false;
		DateFormat formatter; 
		Date date = new Date(); 
		Date currentDate = new Date();
		formatter = new SimpleDateFormat("dd-mm-yyyy");
		try{
			date = formatter.parse(bd);
		}
		catch(ParseException pe){};
		int difference = currentDate.getYear() - date.getYear();
		if(date.getMonth()>currentDate.getMonth()||(date.getMonth()==currentDate.getMonth()&&date.getDay()>currentDate.getDay()))
		{
			difference--;
		}
		if(difference>17 && date.getYear()<=currentDate.getYear()&&bd.matches(dateRegex))
		{
			b=true;
		}
		return b;
	}
	

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public String getSexuality() {
		return sexuality;
	}

	public void setSexuality(String sexuality) {
		this.sexuality = sexuality;
	}

	public int getMinAge() {
		return minAge;
	}

	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}

	public int getMaxAge() {
		return maxAge;
	}

	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	
	public int getAge(){
		return age;
	}
	
	@SuppressWarnings("deprecation")
	public int getMyAge() {
		DateFormat formatter; 
		Date date = new Date(); 
		Date currentDate = new Date();
		formatter = new SimpleDateFormat("dd-mm-yyyy");
		try{
			date = formatter.parse(birthDate);
		}
		catch(ParseException pe){};
		
		int difference = currentDate.getYear() - date.getYear();
		if(date.getMonth()>currentDate.getMonth()||(date.getMonth()==currentDate.getMonth()&&date.getDay()>currentDate.getDay()))
		{
			difference--;
		}
		return difference;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isSmoker() {
		return smoker;
	}

	public void setSmoker(boolean smoker) {
		this.smoker = smoker;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	};
}
