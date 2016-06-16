<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Delete Profile</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div id="deletion">
			<form id="deleteform" action="/user/DeleteServlet.do" method="post">
				<h1>Confirmation</h1>
				<p>Are you sure you want to delete your account?</p>
				<div id="confirmdiv">
					<input type="submit" value="Yes"/><a href="#" id="dontdelete">No</a>
				</div>
			</form>
		</div>
		<div id="editavatardiv">
			<div class="wrapper avatar">
				<h1 class="header accountname">Delete Your Account</h1>
				<p>By navigating to this page, you have the intention to stop using our services. Please use the button below to proceed deleting your account. We wish you the best of luck in finding your ideal match.</p>
				<div id="centerlink">
					<a id="deletelink" href="#">Delete Account</a>
				</div>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>