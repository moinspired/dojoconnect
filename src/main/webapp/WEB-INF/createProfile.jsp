<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
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
	margin-top: 15px;
	margin-right: 10000;
	color: white;
}

.logoutbtn {
	color: #ebacac;;
}


.centered {
	text-align: center;
	font-size: 0;
	padding-top: 40px;
	margin-top: 100px;
}

.centered>div {
	float: none;
	display: inline-block;
	text-align: left;
	font-size: 13px;
}

.page-header {
	text-align: center;
}

.navbar-inverse {
	background: #283e4a;
}
.navbar {
	margin-bottom: 0px;
}
.navbar-inverse{
	padding-bottom:0;
	margin-bottom: 0px;
}
.logoutbtn {
	margin-right: 20px;
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
	

		<form action="/createProfile" method="post">
			<div class="row centered well well-lg">
				<div class="col-sm-4 col-md-4">
					<div class="form-group">
						<label for="headline">Headline</label> <input type="text"
							class="form-control center-block" name="headline">
					</div>

					<div class="form-group">
						<label for="headline">Current Position</label> <input type="text"
							class="form-control center-block" name="currentPosition">
					</div>
					<div class="form-group">
						<label for="headline">Education</label> <input type="text"
							class="form-control center-block" name="education">
					</div>
					<div class="form-group">
						<label for="comment">Summary:</label>
						<textarea name="summary" style="overflow: hidden"
							class="form-control" rows="5" id="comment"></textarea>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="submit" class="btn btn-default pull-right">Submit</button>
				</div>
			</div>
		</form>
	</div>
</body>