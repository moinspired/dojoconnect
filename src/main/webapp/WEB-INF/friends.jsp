
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Network</title>
<link rel="stylesheet" type="text/css" href="css/fl.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style>
.navbar-right {
	margin-top: 15px;
	margin-right: 100px;
	color: white;
}

.logoutbtn {
	color: #ebacac;
}

body {
	background-color: #f5f5f5;
}

.navbar .navbar-nav {
	display: inline-block;
	float: none;
	vertical-align: top;
}

.logoutbtn {
	margin-right: 20px;
}

.navbar-inverse {
	background: #283e4a;
}

.mid-section {
	margin-top: 100px;
	background-color: white;
}

.network_size{
  
	font-weight: 200;
    font-size: 24px;
}

.friend {
	align-items: center;
    background: #fff;
    position: relative;
    opacity: 1;
    transition: visibility .4s ease-in,opacity .4s ease-in;
    border-bottom: 1px solid #e6e9ec;
}

.info {
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-weight: 400;
    font-size: 14px;
    line-height: 1.42857143;
    vertical-align: baseline;
    background: 0 0;
}

.navbar {
	margin-bottom: 0px;
}
.navbar-inverse{
	padding-bottom:0;
	margin-bottom: 0px;
}

@media ( max-width : 768px) {
	#logout_btn
	{ display: none; }
}

</style>
<body>
	<div class="container">
		<header role="banner" class="navbar navbar-fixed-top navbar-inverse">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Dojo Connect</a>
			</div>


			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/">Home</a></li>
					<li><a href="/users">My Network</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Me <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="user/${currentUser.id}">View Profile</a></li>
							<li><a href="/createProfile">Update Profile</a></li>
							<li><a href="logout">Sign out</a></li>
						</ul></li>
				</ul>

				<ul class="nav navbar-nav navbar-right" id="logout_btn">
					<li class="dropdown"><security:authorize
							access="isAuthenticated()">
							<a class="logoutbtn" href="logout"><span
								class="glyphicon glyphicon-log-in"></span> Logout</a>
						</security:authorize></li>
				</ul>
			</div>
		</div>
		</nav> 
		</header>



		<div class="mid-section well">
			<div class="network_size"><h2>${networks.size()} Connections</h2></div>
			<c:forEach var="network" items="${networks}">
				<div class="friend">
					<h3><a style="color:black;" href="/user/${network.id}">${network.getFirstName()} ${network.getLastName()}</a></h3>

					<c:forEach var="profile" items="${profiles}">
						<c:if test="${profile.id == network.id }">
						<div class="info">
							<p class="info-occupat">${profile.getHeadline()}</p>
							<p class="info-occupat">${profile.getEducation()}</p>
						</div>
						</c:if>
					</c:forEach>

				</div>
			</c:forEach>

		</div>

	</div>
</body>
</html>