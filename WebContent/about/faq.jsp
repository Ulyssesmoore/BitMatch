<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | FAQ</title>
		<%@ include file="/templates/imports.jsp" %>
	</head>
	<body>
		<%@ include file="/templates/navbar.jsp" %>
		<%@ include file="/templates/policy.jsp" %>
		<div id="editavatardiv">
			<div class="wrapper aboutpages">
				<h1 class="header accountname">Frequently Asked Questions</h1>
				<strong>Why can't I browse other users?</strong>
				<p>It seems you haven't registered yet, click <a class="inlinelink" href="/register.jsp">this</a> link to register.</p>
				<strong>How do I date other users?</strong>
				<p>First you should register and log in to our website. After that use our matchmaker to find you ideal match or just browse other users yourself. When you find someone you're interested in, open up their profile and click the date button to send them a message</p>
				<strong>Why does a dinosaur appear when I search for this site?</strong>
				<p>This is an obvious case of no internet connection. Wait, how are you even reading this?</p>
				<strong>Why can I find my profile picture all over the internet?</strong>
				<p>As described in our <a id="inlinepolicylink" href="#">privacy policy</a>, we may use your uploaded photo's to improve our services. Since you've accepted these terms this may happen.</p>
				<strong>Can I like other users?</strong>
				<p>Not as of yet, however we will integrate this function in the future.</p>
				<strong>My question can't be found here.</strong>
				<p>If your questions still are unanswered, please visit our <a class="inlinelink" href="/about/support.jsp">support</a> page for a more specific help.</p>
			</div>
		</div>
		<%@ include file="/templates/footer.jsp" %>
	</body>
</html>