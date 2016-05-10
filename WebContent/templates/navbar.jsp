<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav>
	<ul>
		<c:if test="${loggedUser.username == null }" >
			<li><a href="/index.jsp">Login</a></li>
		</c:if>
		<li><a href="/register.jsp">Register</a></li>
		<c:if test="${loggedUser.username != null }" >
			<li>
				<a href="/user/myaccount.jsp">My Account</a>
				<ul>
					<li><a href="/user/myaccount.jsp">View Profile</a></li>
					<li><a href="/user/editaccount.jsp">Edit Profile</a></li>
				</ul>
			</li>
			<li>
				<a href="#">Users</a>
				<ul>
					<li><a href="#">Browse Users</a></li>
					<li><a href="#">Find Match</a></li>
				</ul>
			</li>
			<li>
				<form action="/user/LogoutServlet.do" method="get">
					<a href="/user/LogoutServlet.do">Logout</a>
				</form>
			</li>
		</c:if>
	</ul>
</nav>