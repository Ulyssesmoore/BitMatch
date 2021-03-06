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
		<c:set var="offset" scope="request" value="${empty param.start? 0: param.start}"/>
		<c:set var="amount" scope="request" value="${empty param.filter? 6: param.filter}"/>
		<div id="minimum">
			<div class="wrapper" id="alluserdiv">
				<h1 class="header accountname"><span class="icon icon-users"></span>Browse Users</h1>
				<div id="pages">
					<c:if test="${offset!=0}">
						<a href="/community/allusers.jsp?start=0&filter=${amount}">&lt; First</a>
						<a href="/community/allusers.jsp?start=${offset-1}&filter=${amount}">&lt;</a>
					</c:if>
					<c:forEach var="page" begin="${offset}" end="${fn:replace(((userlist.size()/amount)-(userlist.size()/amount)%1),'.0','') }">
						<c:if test="${page < offset+3 }">
							<c:if test="${offset==page }">
								<a id="selectedpage" href="/community/allusers.jsp?start=${page}&filter=${amount}">${page+1}</a>
							</c:if>
							<c:if test="${offset!=page }">
								<a href="/community/allusers.jsp?start=${page}&filter=${amount}">${page+1}</a>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${offset+2 < fn:replace(((userlist.size()/amount)-(userlist.size()/amount)%1),'.0','')}">
						<a href="/community/allusers.jsp?start=${offset+1}&filter=${amount}">&gt;</a>
						<a href="/community/allusers.jsp?start=${fn:replace(((userlist.size()/amount)-(userlist.size()/amount)%1),'.0','')}&filter=${amount}">&gt; Last</a>
					</c:if>
				</div>
				<div id="users">
					<c:forEach items="${userlist}" var="user" begin="${offset*amount}" end="${offset*amount+(amount-1)}">
						<c:if test="${user.username.equals(loggedUser.username) }">
							<a href="/user/myaccount.jsp">
						</c:if>
						<c:if test="${!user.username.equals(loggedUser.username) }">
							<a href="/community/GetUserServlet.do?userpage=${user.username}">
						</c:if>									
							<div class="shortdescription">
								<div class="otheravatar" style="background-image:url('../userresource/${user.username}.jpg'), url('../resource/standardimg.jpg');"></div>
								<div class="shortdetails">
									<p>${user.name}</p>
									<p>Gender: 
										<c:if test='${user.gender.equals("Male")}'><span class="icon icon-mars"></span></c:if>
										<c:if test='${user.gender.equals("Female")}'><span class="icon icon-venus"></span></c:if>
									</p>
									<p>Age: ${user.age}</p>
									<p>Looking for:
										<c:if test='${user.sexuality.equals("I like men")}'><span class="icon icon-mars"></span></c:if>
										<c:if test='${user.sexuality.equals("I like women")}'><span class="icon icon-venus"></span></c:if>
										<c:if test='${user.sexuality.equals("I like both")}'><span class="icon icon-venus-mars"></span></c:if>
									</p>
								</div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
			<div id="pagefilter">
				<p>Results per page:</p>
				<select id="amounts">
					<option>6</option>
					<option>12</option>
					<option>24</option>
					<option>48</option>
					<c:forEach items="${param.filter}" var="item">
						<option class="invisible" value="${item}"${(param.filter == item) ? " selected='selected'" : "" }>${item}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>