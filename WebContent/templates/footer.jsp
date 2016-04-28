<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
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
			<c:if test="${loggedUser.username != null }" >
				<li><a href="/myaccount.jsp">My Account</a></li>
			</c:if>	
			<li><a href="#">Sitemap</a></li>
		</ul>
	</div>
	<div id="copyright">
		© 2016. BitMatch TM, all rights reserved.
	</div>
</footer>