<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | Edit Avatar</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div id="editavatardiv">
			<div class="wrapper">
				<h1 class="header accountname"><span class="icon icon-pencil"></span>Edit your avatar</h1>
				<form action="/user/ChangeAvatarServlet.do" method="post" enctype="multipart/form-data">
					<div id=avatardiv>
						<div id="avatarname">
							<input id="uploadFile" placeholder=" Choose File" disabled="disabled" />
						</div>
						<div class="fileUpload btn btn-primary">
						    <span>Browse</span>
						    <input id="uploadBtn" name="file" type="file" class="upload" />
						</div>
					</div>
					<p>Only upload image files with max size 500x500. Please don't upload any inappropriate photo's.</p>
					<input type="submit" value="Upload File"/>
				</form>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>