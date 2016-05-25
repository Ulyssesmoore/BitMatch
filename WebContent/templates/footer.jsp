<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer>
 	<div class="flexwrapper">
		<ul>
			<li><a id="policylink" href="/about/ourpolicy.jsp">Privacy Policy</a></li>
			<li><a href="/about/faq.jsp">Frequently Asked Questions</a></li>
			<li><a href="/about/support.jsp">Support</a></li>
			<li><a href="/about/terms.jsp">Terms</a></li>
			<li><a href="/about/sitemap.jsp">About</a></li>
		</ul>
		<ul>
			<c:if test="${loggedUser.username == null }" >
				<li><a href="/index.jsp">Login</a></li>
				<li><a href="/register.jsp">Register</a></li>
			</c:if>
			<c:if test="${loggedUser.username != null }" >
				<li><a href="/user/myaccount.jsp">My Account</a></li>
				<li><a href="/community/allusers.jsp">Browse Users</a></li>
				<li>
					<form action="/community/MatchMakerServlet.do" method="get">
						<a href="/community/MatchMakerServlet.do">Find Match</a>
					</form>
				</li>
				<li>
					<form action="/user/LogoutServlet.do" method="get">
						<a href="/user/LogoutServlet.do">Logout</a>
					</form>
				</li>
			</c:if>	
			<li><a href="/about/sitemap.jsp">Sitemap</a></li>
		</ul>
	</div>
	<div id="copyright">
		© 2016. BitMatch TM, all rights reserved.
	</div>
</footer>