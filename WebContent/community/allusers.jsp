<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Browse Users</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div>
			<div class="wrapper" id="alluserdiv">
				<h1 class="header accountname"><span class="icon icon-users"></span>Browse Users</h1>
				<c:forEach items="${ DateService.allUsers}">
					<p></p>
				</c:forEach>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>