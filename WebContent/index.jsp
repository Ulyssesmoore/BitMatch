<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Home</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" type="text/css" href="/main.css"/>
	</head>
	<body id="home">
		<div class="bodydiv loginwrapper">
			<div class="wrapper">
				<h1 class="header">Login</h1>
				<form action="/LoginServlet.do" method="post">
					<div id="loginmessagebox">
					<%
						Object msgs = request.getAttribute("loginerror");
						if (msgs != null) {
							out.println(msgs);
						}
					%>
					</div>
					<p>Username: </p> 
					<input id="usernamelogin" name="username" type="text" value="${cookie.cUsername.value }"/>
					<p>Password: </p>
					<input name="password" type="password"/>
					<br><br>
					<input id="login" name="login" value="Login" type="submit"/>
					<a id="registerlink" href="/register.jsp">No account yet? Register here!</a>
 				</form>
 			</div>	
 		</div>
 		<div class="footer">
 			<div class="flexwrapper">
	  		<ul>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Frequently Asked Questions</a></li>
					<li><a href="#">Support</a></li>
					<li><a href="#">Terms</a></li>
					<li><a href="#">About</a></li>
	  			</ul>
	  			<ul>
					<li><a href="/index.jsp">Login</a></li>
					<li><a href="/register.jsp">Register</a></li>
					<li><a href="#">Sitemap</a></li>
	  			</ul>
  			</div>
  			<div id="copyright">
				© 2016. BitMatch TM, all rights reserved.
			</div>
 		</div>
	</body>
</html>