<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Register</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<div class="bodydiv">
			<div id="policy">
				<form id="policyform">
					<h1>BitMatch Policy</h1>
					<p>BitMatch is a part of LifeInvader inc, a platform for social interaction. BitMatch doesn't take responsibility for any placed content.</p>
					<p>To improve our services, we use the following data:</p>
					<p>- Your Age <br>- Your Job<br>- Your Address<br>- All of your uploaded photo's<br>- Your GPS-location<br>- Any other useful data we can find</p>
					<br>
					<a href="#" id="readpolicy">Understood</a>
				</form>1
			</div>	
			<div class="wrapper register">
				<h1 class="header">Register</h1>
				<form action="/RegisterServlet.do" method="get">
					<div id="messagebox">
						${msgs }
					</div>
					<p>Username: </p> 
					<input id="username" name="username" value="${param.username }" type="text"/>
					<p>Password: </p>
					<input name="password" type="password"/>
					<p>Repeat Password: </p>
					<input name="password2" type="password"/>
					<p>Name: </p>
					<input name="name" value="${param.name}" type="text"/>
					<p>Gender:</p>
					<select name="gender">
    					<option value="Male">Male</option>
    					<option value="Female">Female</option>
    					<c:forEach items="${param.gender}" var="item">
    					 	<option class="invisible" value="${item}"${(selectedGender == item) ? " selected='selected'" : "" }>${item}</option>
   						 </c:forEach>
  					</select>
  					<p>Sexuality:</p>
  					<select name="sexuality">
    					<option value="I like men">I like men</option>
    					<option value="I like women">I like women</option>
    					<option value="I like both">I like both</option>
    					<c:forEach items="${param.sexuality}" var="item">
    					 	<option class="invisible" value="${item}"${(selectedSexuality == item) ? " selected='selected'" : "" }>${item}</option>
   						 </c:forEach>
  					</select>
  					<p>Birthdate</p>
  					<input maxlength="10" value="${param.birthdate }" name="birthdate" type="text" id="datepicker">
					<p>Email-address: </p>
					<input name="email" value="${param.email }" type="text"/>
					<p>Minimum age of match:</p>
					<input id="minimumage" value="${param.minage }"  maxlength="2" name="minage" type="text"/>
					<p>Maximum age of match:</p>
					<input id=maximumage value="${param.maxage }" maxlength="2" name="maxage" type="text"/>
					<input name="agreement" type="checkbox" value="checked"><label id="agreement">I have read and agree to the Terms of Service and <a id="policylink" href="#">Privacy Policy.</a></label>
					<br><br>
					<input name="registreer" value="Register" type="submit"/>
 				</form>
 			</div>
 			<%@ include file="/templates/footer.jsp" %>
 		</div>	
	</body>
</html>