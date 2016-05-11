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
		<%@ include file="/templates/policy.jsp" %>
		<div id="profilediv">
			<div id="editaccount">
				<form action="/user/UpdateServlet.do" method="get">
					<h1 class="header accountname"><span class="icon icon-cog"></span>Edit your account</h1>
					<div id="editmessagebox">
						<c:if test="${not empty editerror }">
							<span class="icon icon-attention-circled"></span> ${editerror}
						</c:if>
					</div>
					<div id="editflex">
						<div id="labels">
							<p>Your name: </p>
							<p>Password: </p>
							<p>Repeat password: </p>
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
							<input name="editname" type="text" value="${loggedUser.name }"/>
							<input name="editpassword" type="password" value="${loggedUser.password }"/>
							<input name="editpassword2" type="password" value="${loggedUser.password }"/>
							<input name="editemail" type="text" value="${loggedUser.email }"/>
							<select name="editgender" name="gender">
		    					<option value="Male">Male</option>
		    					<option value="Female">Female</option>
		    					<option class="invisible" value="${loggedUser.gender}" selected>${loggedUser.gender }</option>
	  						</select>
	  						<select name="editsexuality" name="sexuality">
		    					<option value="I like men">I like men</option>
		    					<option value="I like women">I like women</option>
		    					<option value="I like both">I like both</option>
		    					<option class="invisible" value="${loggedUser.sexuality }" selected>${loggedUser.sexuality }</option>
		  					</select>
		  					<input name="editminimumage" id="minimumage" value="${loggedUser.minAge }"  maxlength="2" type="text"/>
		  					<input name="editmaximumage" id=maximumage value="${loggedUser.maxAge }" maxlength="2" type="text"/>
		  					<input name="edithobby" maxlength="30" value="${loggedUser.hobby }" type="text"/>
		  					<input name="editjob" maxlength="30" value="${loggedUser.job }" type="text"/>
		  					<input name="edithometown" maxlength="30" value="${loggedUser.hometown }" type="text"/>
		  					<input name="editcountry" maxlength="30" value="${loggedUser.country }" type="text"/>
		  					<input type="checkbox"/><br/>
		  					<textarea name="editdescription" maxlength="2200" rows="10" cols="85">${loggedUser.description }</textarea>
						</div>
					</div>
					<input id="submitchange" name="change" value="Submit Changes" type="submit"/>
				</form>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>