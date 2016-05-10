<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Edit Account</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<div id="profilediv">
			<div id="editaccount">
				<h1 class="header accountname"><span class="icon icon-cog"></span>Edit your account</h1>
				<div id="editflex">
					<div id="labels">
						<p>Your name: </p>
						<p>Password: </p>
						<p>Repeat password: </p>
						<p>Change profile picture: </p>
						<p>Email-Address</p>
						<p>Gender: </p>
						<p>Sexuality: </p>
						<p>Minimum age of match: </p>
						<p>Maximum age of match: </p>
						<p>Hobbies: </p>
						<p>Job: <p>
						<p>Hometown: </p>
						<p>Country: </p>
						<p>Smoker: </p>
						<p>About Yourself: </p>
					</div>
					<div id="input">
						<form action="/user/UpdateServlet.do" method="post">
							<input type="text" value="${loggedUser.name }"/>
							<input type="password"/>
							<input type="password"/>
							<input id="avatarpicker" type="file"/>
							<input type="text" value="${loggedUser.email }"/>
							<select name="gender">
		    					<option value="Male">Male</option>
		    					<option value="Female">Female</option>
		    					<option class="invisible" value="${loggedUser.gender}" selected>${loggedUser.gender }</option>
	  						</select>
	  						<select name="sexuality">
		    					<option value="I like men">I like men</option>
		    					<option value="I like women">I like women</option>
		    					<option value="I like both">I like both</option>
		    					<option class="invisible" value="${loggedUser.sexuality }" selected>${loggedUser.sexuality }</option>
		  					</select>
		  					<input id="minimumage" value="${loggedUser.minAge }"  maxlength="2" name="minage" type="text"/>
		  					<input id=maximumage value="${loggedUser.maxAge }" maxlength="2" name="maxage" type="text"/>
		  					<input value="${loggedUser.hobby }" type="text"/>
		  					<input value="${loggedUser.job }" type="text"/>
		  					<input value="${loggedUser.hometown }" type="text"/>
		  					<input value="${loggedUser.country }" type="text"/>
		  					<input type="checkbox"/><br/>
		  					<textarea rows="10" cols="85">${loggedUser.description }</textarea>
		  					<input name="change" value="Submit Changes" type="submit"/>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>