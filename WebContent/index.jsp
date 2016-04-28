<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Home</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" type="text/css" href="/main.css"/>
		<link rel="shortcut icon" href="../resource/favicon.ico"/>	
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
 		<%@ include file="/footer.jsp" %>
	</body>
</html>