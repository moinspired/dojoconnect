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
.detailBox {
	margin-bottom: 20px;
	
	margin-top: 100px;
}

.user {
	border: 1px solid #bbb;
	background-color: white;
	text-align: center;
	padding-top:10px;
	height:150px;
}

.userboard {
	border: 1px solid #bbb;
}

.navbar .navbar-nav {
	display: inline-block;
	float: none;
	vertical-align: top;
}

.logoutbtn {
	margin-right: 20px;
}

.navbar-inverse{
	background: #283e4a;
}

.nonNetwork {
	
	margin-left: 20px;
	padding: 0;
}
.no-invit {
	background-color: white;
	padding: 10px 24px 9px;
	box-shadow: 0 2px 0px 0px #C0C0C0;
}
.nonNetwork-header{
	border: 1px solid #bbb;
	padding: 10px 24px 9px;
	background-color: white;
}
.info-occupat{
	font-weight: 400;
    font-size: 12px;
    line-height: 16px;
    color: rgba(0,0,0,.6);
}
.connectbtn {
	margin-top: 10px;
	margin-bottom: 10px;
}
.userboard {
	background-color:white;
	text-align:center;
}
.logoutLblPos{
   position:fixed;
   right:200px;
   top:5px;
   margin-top:10px;
   
}
.btn{
  padding:2px;

}

.invitations{
	background-color: #e6f7ff;
	border: 1px solid #bbb;
}
.btn-secondary {
    border-color: rgba(0,96,151,.25);
	padding: 1px 10px;;
	margin-left:70px;
    background-color: transparent;
    border-style: solid;
   }
   
.ignore-inv{
	float: right;
	margin-right:30px;
}
.inv-container{
	margin-bottom: 10px;
}

.navbar {
	margin-bottom: 0px;
}
.navbar-inverse{
	padding-bottom:0;
	margin-bottom: 0px;
}

@media ( max-width : 768px) {
	.detailBox{
		width: 100%;
		margin: 0 auto;
		margin-top: 100px;
	}
	.userboard{
		display:block;
		width: 100%;
	}
	.nonNetwork{
		width: 100%;
		margin-left: 0px;
	}
	
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


		<div class="row detailBox">
			<div class="well col-xs-6 col-sm-3 userboard">
				<p>${currentUser.getFriends().size() + currentUser.getUserFriends().size()}</p>
				<p>
					<b>Your connections</b>
				</p>
				<a href="/friends">See all</a>
			</div>
			<div class="nonNetwork col-xs-6">
				<c:choose>
					<c:when test="${invitations.size() != 0}">			
						<div class="row well invitations">
							<div>
						    	<p>The following people asked you to be their network.</p>
									<c:forEach var="inv" items="${invitations}">
											<div class="inv-container">
												<div class="col-xs-6">
													<a href="user/${inv.id}"><b style="color:black;">${inv.getFirstName()} ${inv.getLastName()}</b></a>
												</div>
												<div class="col-xs-6"> 
													<a href="/accept/user/${inv.id}"><button type="button" class="btn btn-secondary">Accept</button></a>
													<a class="ignore-inv" href="/ignore/user/${inv.id}">Ignore</a>
												</div>
											</div>
									</c:forEach>
							</div>
						</div>
					</c:when>
				<c:otherwise>
						<div class=" no-invit well">
							<p>No pending invitations</p>
						</div>

					</c:otherwise>
				</c:choose>

				<div class=" well nonNetwork-header">People you may know</div>
				<c:forEach var="user" items="${users}">
					<div class="col-xs-6 .col-sm-3 user">
						<p>
							<a style="color:black;" href="user/${user.id}"><b>${user.firstName}</b></a>
						</p>
						<div>
							<c:forEach var="profile" items="${profiles}">
								<c:if test="${profile.id == user.id }">
									<p class="info-occupat">${profile.getHeadline()}</p>
									<p class="info-occupat">${profile.getEducation()}</p>
								</c:if>
							</c:forEach>
						</div>
						
						<div class="btn-group">
						   <a href="connect/user/${user.id}"  class="connectbtn btn btn-primary">Connect</a>
						</div>
						
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>