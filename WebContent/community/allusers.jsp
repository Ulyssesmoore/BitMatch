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
				<div id="users">
					<c:forEach items="${userlist}" var="user">
						<a href="/community/GetUserServlet.do?userpage=${user.username}">								
							<div class="shortdescription">
								<div class="otheravatar" style="background-image:url('../userresource/${user.username}.jpg'), url('../resource/standardimg.jpg');"></div>
								<div id="shortdetails">
									<p>Name: ${user.name}</p>
									<p>Gender: 
										<c:if test='${user.gender.equals("Male")}'><span class="icon icon-mars"></span></c:if>
										<c:if test='${user.gender.equals("Female")}'><span class="icon icon-venus"></span></c:if>
									</p>
									<p>Age: ${user.age}</p>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>