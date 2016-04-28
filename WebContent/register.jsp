<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Register</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" type="text/css" href="/main.css"/>
  		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  		<script type="text/javascript" src="/jquery.js"></script>
  		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  		<script type="text/javascript" src="/bitmatch.js"></script>
	</head>
	<body>
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
					<%
						Object msgs = request.getAttribute("msgs");
						if (msgs != null) {
							out.println(msgs);
						}
					%>
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
    					 	<option value="${item}"${(selectedGender == item) ? " selected='selected'" : "" }>${item}</option>
   						 </c:forEach>
  					</select>
  					<p>Sexuality:</p>
  					<select name="sexuality">
    					<option value="I like men">I like men</option>
    					<option value="I like women">I like women</option>
    					<option value="I like both">I like both</option>
    					<c:forEach items="${param.sexuality}" var="item">
    					 	<option value="${item}"${(selectedSexuality == item) ? " selected='selected'" : "" }>${item}</option>
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
 		</div>	
	</body>
</html>