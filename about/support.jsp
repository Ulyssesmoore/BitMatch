<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Support</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div id="editavatardiv">
			<div class="wrapper avatar">
				<h1 class="header accountname">Support</h1>
				<p>Welcome to our support page.</p>
				<p>If you have a problem you need our help with, send us a message using the button below and we will try and help you as fast as we can. This is our BitMatch guarantee.</p>
				<div id="centerlink">				
					<a id="supportlink" href="mailto:support@bitmatch.com">Ask Support</a>
				</div>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>