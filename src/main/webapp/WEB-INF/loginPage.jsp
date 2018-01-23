<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign-Up/Login Form</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link
	href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	color: #2a3e4a;
	background-color: #3c4b5b;
}
a {
 color: #2a3e4a;
 background-color: #E8E8E9;
}
.tab-content{
	padding: 25px;
    background-color: #fff;
    font-family: Gotham-Rounded-Book;
  
}

.button{
    font-size: 10px;
    letter-spacing: 2px;
    text-transform: uppercase;
    padding: 5px 12px;
}


.container {
    width: 600px;
}

.page-header {
    padding-bottom: 9px;
    margin: 40px 0 20px;
    border-bottom: 0px solid #eee;
    color: white;
}

.modal-content{
	color: white;
}

</style>
</head>
<body>
		
	<div class="container">
	  <div class="page-header">
	  
    <h1>Dojo Professional Connection</h1>    

  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Discover more...
</button>
  
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h1 style="color:#3a7fa0" class="modal-title">Welcome to Dojo Connect</h1>
        </div>
        <div class="modal-body">
          <p style="color:#3a7fa0">This platform is inspired by LinkedIn, an employment-oriented social networking website. Dojo Connect takes a simplified approach aiming to bring easy navigation throughout every click. 
          Please register (the secured feature directs newly registered user to the login tab) to discover more...</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

  </div>
		<div class="test"></div>
		<div class="bs-example">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#sectionA">Login</a></li>
				<li><a data-toggle="tab" href="#sectionB">Registration</a></li>
				
			</ul>
			<div class="tab-content ">
				<div>
					<c:if test="${logoutMessage != null}">
						<c:out value="${logoutMessage}"></c:out>
					</c:if>

					<c:if test="${errorMessage != null}">
						<c:out value="${errorMessage}"></c:out>
					</c:if>
				</div>

				<p></p>

				<div id="sectionA" class="tab-pane fade in active">
					<form method="POST" action="/login">
						<h3>Welcome Back</h3>
						<div class="form-group">
							<label for="username">Email</label> <input type="email"
								class="form-control" id="username" name="username" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control" id="password" name="password" />
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="submit"
							class="btn btn-default btn-primary" value="Login" />
					</form>

				</div>
				<div id="sectionB" class="tab-pane fade">
					<h1>Be great at what you do</h1>
					<h4>Get started - it's free</h4>

					<p>
						<form:errors path="user.*" />
					</p>
					
					<form:form method="POST" action="/registration" modelAttribute="user">
						<div class="form-group">
							<form:label path="firstName">First name:</form:label>
							<form:input class="form-control" path="firstName" />
						</div>
							<div class="form-group">
							<form:label path="lastName">Last name:</form:label>
							<form:input class="form-control" path="lastName" />
						</div>
						<div class="form-group">
							<form:label path="username">Email:</form:label>
							<form:input class="form-control" path="username" />
						</div>
						<div class="form-group">
							<form:label path="password">Password:</form:label>
							<form:password class="form-control" path="password" />
						</div>
						<div class="form-group">
							<form:label path="passwordConfirmation">Password Confirmation:</form:label>
          					<form:password class="form-control" path="passwordConfirmation"/>
						</div>
						<input type="submit"  class="btn btn-default btn-primary" value="Join now" />
					 </form:form>
				</div>
			</div>
		</div>
	</div>
	<!-- /form -->
</body>
</html>