<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Home</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body id="home">
		<div class="bodydiv loginwrapper">
			<div class="wrapper">
				<h1 class="header">Login</h1>
				<form action="/LoginServlet.do" method="post">
					<div id="loginmessagebox">
						${loginerror}
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
 		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>