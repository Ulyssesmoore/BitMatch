<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Data Policy</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div id="editavatardiv">
			<div class="wrapper avatar">
				<h1 class="header accountname">Our Policy</h1>
				<p>BitMatch is a part of LifeInvader inc, a platform for social interaction. BitMatch doesn't take responsibility for any placed content.</p>
				<p>To improve our services, we use the following data:</p>
				<ul>
					<li>Your Age </li>
					<li>Your Job</li>
					<li>Your Address</li>
					<li>All of your uploaded photo's</li>
					<li>Your GPS-location</li>
					<li>Any other useful data we can find</li>
				</ul>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>