package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.User;

@SuppressWarnings("serial")
@MultipartConfig
public class ChangeAvatarServlet  extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	 {
		
		User u = (User)getServletContext().getAttribute("loggedUser");
		String username=u.getUsername();
		
	    Part filePart = req.getPart("file"); // Retrieves <input type="file" name="file">
	    
	    String path = (getServletContext().getRealPath("/resource/"));
	    System.out.println(path);
	    File uploads = new File(path+ "../../userresource/" + username +".jpg");
	    
	    try(InputStream fileContent = filePart.getInputStream())
	    {
	    	Files.copy(fileContent, uploads.toPath(),StandardCopyOption.REPLACE_EXISTING);
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
		req.getRequestDispatcher("/user/myaccount.jsp").forward(req, resp);
	 }
}
