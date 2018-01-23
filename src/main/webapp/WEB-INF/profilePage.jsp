<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Network</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
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
	margin-top:15px;
	margin-right: 100px;
	color:white;
}
.logoutbtn {
    color: #ebacac;
}

body{
	background-color:#f5f5f5;
}

.well{
	background-color: white;
	padding: 0px;
	margin-top: 100px;
	
}
.background {
	width: 100%;
}

.pv-top-card-section__information {
	text-align: center;
    margin-bottom: 0px;
    padding: 0px 40px;
}
.logoutbtn {
	margin-right: 20px;
}

.logoutLblPos{
   position:fixed;
   right:110px;
   top:5px;
}
.section-info-parag{
    font-weight: 400;
}
.navbar-inverse{
	background: #283e4a;
}
.pv-top-card-section__summary-text{
	border-top: 1px #cdcfd2 solid;
	text-align: center;
	padding-top: 24px;
	margin-top: 24px;
	font-weight: 400;
    font-size: 14px;
   	line-height: 20px;
    color: rgba(0,0,0,.6);
    width: 70%;
   margin: auto;
}
p.pv-top-card-section__summary-text{
	color:red;
}
.profile-section{
padding:24px;
}

.dashboard{
	background-color:#6c8c9d;
    line-height: 24px;
    font-weight: 400;
    color: #fff;
    font-size: 20px;
    padding: 20px;
}
.grid-container {
  display: grid;
  grid-template-columns: auto auto auto;
  background-color: white;
}
.grid-item {
  border: 1px solid rgba(0, 0, 0, 0.8);
  padding: 20px;
  font-size: 30px;
  text-align: center;
}

.navbar {
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
							<li><a href="/user/${user.id}">View Profile</a></li>
							<li><a href="/createProfile">Update Profile</a></li>
							<li><a href="logout">Sign out</a></li>
						</ul></li>
				</ul>

			</div>
		</div>
		</nav> 
		</header>
		
		
		<div class="top-section well">
			<img class="background" src="${pageContext.request.contextPath}/resources/img/background.jpg">
			<div class="profile-section">
				<div class="pv-top-card-section__information">
					<h3><c:out value="${user.firstName} ${user.lastName}"></c:out></h3>
					<p class="section-info-parag"><c:out value="${userProfile.headline}"></c:out></p>
					<p class="section-info-parag"><c:out value="${userProfile.education}"></c:out></p>
				</div>
				<div class="pv-top-card-section__summary-text">
					<p class="section-info-parag"><c:out value="${userProfile.summary}"></c:out></p>
				</div>
			</div>
		</div>
		
		<div class="well dashboard">
			<h3>Your Dashboard</h3>
			<p><i>private to you</i></p>
			<div class="grid-container">
			  <div class="grid-item">1</div>
			  <div class="grid-item">2</div>
			  <div class="grid-item">3</div>
			 </div>
		</div>
		
	</div>
</body>
</html>