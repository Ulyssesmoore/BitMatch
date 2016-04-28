<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>BitMatch | My Account</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<link rel="stylesheet" type="text/css" href="/main.css"/>
		<link rel="shortcut icon" href="../resource/favicon.ico"/>
	</head>
	<body>
		<div id="accountdiv">
			<div id="mainaccount">
				<h1 class="header accountname">Account of ${loggedUser.name }</h1>
				<div id="profilewrapper">
					<div id="picwrapper">
						<div id="profilepic" style="background-image:url('../resource/${loggedUser.username}.jpg'), url('../resource/standardimg.jpg');"></div>
					</div>
					<div id="descriptionwrapper">
						<div id="description">
							<h1>About me</h1>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
							<p>Nullam elementum feugiat mi. Vivamus nec leo in ex iaculis malesuada vitae a mi. Quisque quis justo consequat, luctus purus fermentum, viverra justo. Integer vitae pulvinar mi. Sed ut varius neque, id sagittis orci. Praesent sollicitudin purus sed massa tempor, ut varius dolor tempus. Sed euismod venenatis magna et scelerisque.</p>
							<p>Etiam lacus turpis, fermentum sed ornare sit amet, tincidunt in felis. Praesent ac orci vitae diam dictum ornare. Praesent et mollis velit. Morbi scelerisque nisl id bibendum efficitur. Sed fringilla velit lectus. Morbi auctor dolor sed nisi sagittis, in aliquam ligula commodo. Mauris fringilla commodo libero sed cursus. Nam euismod consectetur felis, eu consectetur purus efficitur pulvinar. Maecenas ullamcorper mi mollis, convallis magna tempus, commodo magna. Nulla metus arcu, hendrerit eget mi ut, ultrices auctor enim.</p>
							<p>Morbi eleifend lorem vel feugiat consectetur. Duis eget aliquet tellus. Nunc faucibus pulvinar hendrerit. Aliquam maximus nulla et ultricies hendrerit. Nunc sed eros nulla. In hac habitasse platea dictumst. In tempor sapien in dolor aliquet, eget tristique leo posuere. Proin dignissim libero sit amet leo maximus, in tincidunt sapien aliquam. Nulla placerat metus ac dolor ornare dapibus. Nam ullamcorper justo eu viverra tristique. Sed eu ligula vitae mauris pharetra rhoncus.</p>
							<p>Aliquam dictum fringilla urna sed sodales. Integer et rhoncus velit. Donec non dignissim diam. Nam id ullamcorper mauris. In ac lacus in leo posuere lacinia nec ut tortor. Vivamus tincidunt fringilla tellus vitae dictum. Quisque ut sagittis turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed sed dapibus justo. Mauris sed purus lorem. Ut odio orci, fermentum nec nulla sed, vulputate efficitur odio. Sed eget tellus nisl. In at odio eget tortor elementum lacinia eu et ex.</p>
						</div>
					</div>
				</div>
				<div id="detailwrapper">
					<div id="details">
						<ul>
							<li>Name</li>
							<li>Gender</li>
							<li>Age</li>
							<li>Date of Birth</li>
							<li>Sexuality</li>
							<li>Minimum age of match</li>
							<li>Maximum age of match</li>
							
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
						</ul>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="/footer.jsp" %>
	</body>
</html>