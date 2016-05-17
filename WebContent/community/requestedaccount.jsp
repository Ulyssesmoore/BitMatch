<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | ${requesteduser.name}'s Account</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div id="accountdiv">
			<div id="mainaccount">
				<h1 class="header accountname"><span class="icon icon-user"></span>Account of ${requesteduser.name }</h1>
				<div id="divider">
					<div id="picwrapper">
						<div id="profilepic" style="background-image:url('../userresource/${requesteduser.username}.jpg'), url('../resource/standardimg.jpg');"></div>
						<div class="link">
							<a id="datelink" href="mailto:${requesteduser.email}"><span class="icon icon-heart"></span>Date ${requesteduser.name }</a>
						</div>
						<div id="requesteduserdata">
							<div id="details">
								<ul>
									<li>Name</li>
									<c:if test="${fn:length(requesteduser.name)>20}">
										<br>
									</c:if>
									<li>Gender</li>
									<li>Age</li>
									<li>Date of Birth</li>
									<li>Sexuality</li>
									<li>Minimum age</li>
									<li>Maximum age</li>
									<c:if test="${not empty requesteduser.job}">
										<li>Job</li>
									</c:if>
									<c:if test="${not empty requesteduser.hobby}">
										<li>Hobbies</li>
									</c:if>
									<c:if test="${not empty requesteduser.hometown}">
										<li>Hometown</li>
									</c:if>
									<c:if test="${not empty requesteduser.country}">
										<li>Country</li>
									</c:if>
								</ul>
							</div>
							<div id="detaildata">
								<ul>
									<li>${requesteduser.name }</li>
									<li>${requesteduser.gender }</li>
									<li>${requesteduser.age }</li>
									<li>${requesteduser.birthDate }</li>
									<li>${requesteduser.sexuality }</li>
									<li>${requesteduser.minAge }</li>
									<li>${requesteduser.maxAge }</li>
									<c:if test="${not empty requesteduser.job}">
										<li>${requesteduser.job }</li>
									</c:if>
									<c:if test="${not empty requesteduser.hobby}">
										<li>${requesteduser.hobby }</li>
									</c:if>
									<c:if test="${not empty requesteduser.hometown}">
										<li>${requesteduser.hometown }</li>
									</c:if>
									<c:if test="${not empty requesteduser.country}">
										<li>${requesteduser.country }</li>
									</c:if>					
								</ul>
							</div>
						</div>
					</div>
					<div id="descriptionwrapper">
						<div id="description">
							<h1>About me</h1>
							<c:if test="${empty requesteduser.description }">
								<p>This user has no description yet</p>
							</c:if>
							<c:if test="${not empty requesteduser.description }">
								<pre id="aboutme">${requesteduser.description }</pre>
							</c:if>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>