<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
	<ul>
		<c:if test="${loggedUser.username == null }" >
			<li><a href="/index.jsp">Login</a></li>
			<li><a href="/register.jsp">Register</a></li>
		</c:if>
		<c:if test="${loggedUser.username != null }" >
			<li>
				<a href="/user/myaccount.jsp">My Account</a>
				<ul>
					<li><a href="/user/myaccount.jsp">View Profile</a></li>
					<li><a href="/user/editaccount.jsp">Edit Profile</a></li>
					<li><a href="/user/deleteaccount.jsp">Delete Profile</a></li>
				</ul>
			</li>
			<li>
				<a href="/community/allusers.jsp">Users</a>
				<ul>
					<li><a href="/community/allusers.jsp">Browse Users</a></li>
					<li>
						<form action="/community/MatchMakerServlet.do" method="get">
							<a href="/community/MatchMakerServlet.do">Find Match</a>
						</form>
					</li>
				</ul>
			</li>
		</c:if>
		<li>
			<a href="#">About Us</a>
			<ul>
				<li><a href="/about/ourpolicy.jsp">Data Policy</a></li>
				<li><a href="/about/terms.jsp">Terms of Service</a></li>
				<li><a href="/about/faq.jsp">FAQ</a></li>
				<li><a href="/about/support.jsp">Support</a></li>
				<li><a href="/about/sitemap.jsp">Sitemap</a></li>
			</ul>
		</li>
		<c:if test="${loggedUser.username != null }" >
			<li>
				<form action="/user/LogoutServlet.do" method="get">
					<a href="/user/LogoutServlet.do">Logout</a>
				</form>
			</li>
		</c:if>
		<c:if test="${loggedUser!=null}">
			<a href="/user/myaccount.jsp">
				<div id="loggedin">
					<div id="navbarpic" style="background-image:url('../userresource/${loggedUser.username}.jpg'), url('../resource/standardimg.jpg');"></div>
					<div id="loggedindetails">
						<p>Currently logged in:</p>
						<p>${loggedUser.name }</p>
					</div>
				</div>
			</a>
		</c:if>
	</ul>
</nav>