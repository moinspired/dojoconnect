<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/homePage.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	background-color: #f5f5f5;
}

.navbar-inverse {
	background: #283e4a;
}

.navbar {
	margin-bottom: 0px;
	border: 1px solid transparent;
}

header {
	margin-bottom: 100px;
}

@media ( max-width : 768px) {
	.profile {
		position: fixed;
		width: 30%;
	}
	.pv-top-card-section__information {
		font-size: 1em;
	}
	.pv-top-card-section__information h3 {
		font-size: 1em;
	}
	.entity-list-item {
		font-size: .5em;
	}
	#logout_btn
	{ display: none; }
}
</style>
</head>
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


		<div class="row" id="mc_container">
			<div class="col-sm-4 profile" style="background-color: lavender;">

				<div class="top-section well" id="top_section">
					<img class="background-img"
						src="${pageContext.request.contextPath}/resources/img/background.jpg">
					<div class="profile-section">
						<div class="pv-top-card-section__information">
							<h3>
								<c:out value="${currentUser.firstName} ${currentUser.lastName}"></c:out>
							</h3>
							<p class="section-info-parag">
								<c:out value="${userProfile.headline}"></c:out>
							</p>
							<p class="section-info-parag">
								<c:out value="${userProfile.education}"></c:out>
							</p>
						</div>
						<div class="entity-list-item">
							<p>${currentUser.getFriends().size() + currentUser.getUserFriends().size()}</p>
							<p>Connections</p>
							<p>Grow your network</p>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-6 two-column left-column" id="left_column">
				<div class="well" id="post_message">
					<form style="display: inline;" action="/messages" method="post">
						<div>
							<textarea name="message" class="form-control"
								placeholder="Share an article, photo, video or idea"
								style="min-width: 100%"></textarea>
						</div>
						<div style="display: inline;">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input id="new_message"
								class="message-btn btn btn-secondary btn-sm" type="submit"
								value="Post a message">
						</div>
					</form>
					<!--  
					<form style="display: inline;" action="/share/image" method="post">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> <input  style="display: inline;" id="new_message"
								class="message-btn btn btn-secondary btn-sm" type="submit"
								value="Images">
					</form>-->

				</div>

				<div class="wall">
					<c:forEach items="${messages}" var="msg">
						<div class="detailBox">

							<div class="titleBox">
								<label>Message Box</label>
								<button type="button" class="close" aria-hidden="true">&times;</button>
							</div>
							<div class="commentBox">
								<p class="taskDescription">${ msg.getMessage() }</p>
								<div class="sub-text">${msg.getMessageLikes().size()}
									likes</div>
								<div class="social-action-bar">
									<a href="/like/message/${msg.id}" class="btn btn-default"><span
										class="glyphicon glyphicon-thumbs-up"></span></a>
								</div>
							</div>

							<div class="actionBox">
								<div class="comment">
									<ul class="commentList">
										<c:forEach items="${msg.getComments()}" var="cmt">
											<li>
												<p style="line-height: 16px;" class="commentText">
													<span><b>${cmt.getUser().getFirstName()}
															${cmt.getUser().getFirstName()} </b></span>${ cmt.getComment() }</p> <%@ page
													import="java.text.SimpleDateFormat"%>
												<%@ page import="java.util.Date"%> <%
										     	SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MMM-yyyy");	 
										        pageContext.setAttribute("DATE_FORMAT", new SimpleDateFormat("MMM dd, yyyy") );
											%> <span class="date sub-text">on
													${DATE_FORMAT.format(cmt.getCreatedAt())}</span>
												<div class="social-action-bar sub-text">

													<c:forEach items="${commentLikes}" var="cl">
														<c:if test="${cl.getComment().getId() == cmt.id}">

														</c:if>
													</c:forEach>
													${cmt.getCommentLikes().size()} <a
														href="/like/comment/${cmt.id}" class="sub-text">likes</a>
												</div>
											</li>
										</c:forEach>
									</ul>
								</div>
								<form class="form-inline" action="/comments/${msg.id}"
									method="post">
									<div class="comment-container">
										<div class="form-group">
											<input name="comment" class="form-control" type="text"
												placeholder="Your comments" />
										</div>
										<div class="form-group">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" />
											<button class="btn btn-default">Add</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>