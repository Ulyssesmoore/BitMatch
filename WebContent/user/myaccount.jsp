<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | My Account</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div id="accountdiv">
			<div id="mainaccount">
				<h1 class="header accountname"><span class="icon icon-user"></span>Account of ${loggedUser.name }</h1>
				<div id="divider">
					<div id="picwrapper">
						<div id="profilepic" style="background-image:url('../resource/${loggedUser.username}.jpg'), url('../resource/standardimg.jpg');"></div>
						<a id="editavatarlink" href="/user/editavatar.jsp"><span class="icon icon-pencil"></span>Edit Avatar</a>
						<div id="userdata">
							<div id="details">
								<ul>
									<li>Name</li>
									<c:if test="${fn:length(loggedUser.name)>15}">
										<br>
									</c:if>
									<li>Gender</li>
									<li>Age</li>
									<li>Date of Birth</li>
									<li>Sexuality</li>
									<li>Minimum age of match</li>
									<li>Maximum age of match<br/></li>
									<c:if test="${not empty loggedUser.job}">
										<li>Job</li>
									</c:if>
									<c:if test="${not empty loggedUser.hobby}">
										<li>Hobbies</li>
									</c:if>
									<c:if test="${not empty loggedUser.hometown}">
										<li>Hometown</li>
									</c:if>
									<c:if test="${not empty loggedUser.country}">
										<li>Country</li>
									</c:if>
								</ul>
							</div>
							<div id="detaildata">
								<ul>
									<li>${loggedUser.name }</li>
									<li>${loggedUser.gender }</li>
									<li>${loggedUser.age }</li>
									<li>${loggedUser.birthDate }</li>
									<li>${loggedUser.sexuality }</li>
									<li>${loggedUser.minAge }<br/><br/></li>
									<li>${loggedUser.maxAge }<br/><br/></li>
									<c:if test="${not empty loggedUser.job}">
										<li>${loggedUser.job }</li>
									</c:if>
									<c:if test="${not empty loggedUser.hobby}">
										<li>${loggedUser.hobby }</li>
									</c:if>
									<c:if test="${not empty loggedUser.hometown}">
										<li>${loggedUser.hometown }</li>
									</c:if>
									<c:if test="${not empty loggedUser.country}">
										<li>${loggedUser.country }</li>
									</c:if>					
								</ul>
							</div>
						</div>
					</div>
					<div id="descriptionwrapper">
						<div id="description">
							<h1>About me</h1>
							<c:if test="${empty loggedUser.description }">
								<p>This user has no description yet</p>
							</c:if>
							<c:if test="${not empty loggedUser.description }">
								<p>${loggedUser.description }</p>
							</c:if>
						</div>
					</div>	
				</div>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>