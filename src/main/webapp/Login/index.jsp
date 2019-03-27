<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>Trang đăng nhập quản trị nhân viên công ty</title>
<!-- Meta tag Keywords -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Online Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- Meta tag Keywords -->

<!-- css files -->
<link rel="stylesheet" href='<s:url value="Login/css/style.css"/>'
	type="text/css" media="all" />
<!-- Style-CSS -->
<link rel="stylesheet" href="Login/css/font-awesome.css">
<!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->
<!-- online-fonts -->
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700,800&amp;subset=latin-ext"
	rel="stylesheet">
<!-- //online-fonts -->
</head>
<body>
	<!-- main -->
	<div class="center-container">
		<!--header-->
		<div class="header-w3l">
			<h1>Đăng Nhập Quản Trị</h1>
		</div>
		<!--//header-->
		<div class="main-content-agile">
			<div class="sub-main-w3">
				<div class="wthree-pro">
					<h2>Login Quick</h2>
				</div>
				<form action="checkLogin" name="formLogin" method="post"
					onsubmit="return validateLogin();">
					<div class="pom-agile">
						<input placeholder="Nhập UserName" name="userName" class="user"
							type="text"> <span class="icon1"><i
							class="fa fa-user" aria-hidden="true"></i></span>
					</div>
					<div class="pom-agile">
						<input class="Password" placeholder="Password" name="passWord"
							class="pass" type="password"> <span class="icon2"><i
							class="fa fa-unlock" aria-hidden="true"></i></span>
					</div>
					<s:actionerror />
					<div class="sub-w3l">
						<div class="right-w3l">
							<input id="login" type="submit" value="Login">
						</div>
					</div>
				</form>

			</div>
		</div>
		<!--//main-->
		<!--footer-->
		<div class="footer">
			<p>
				&copy; 2017 Online Login Form. All rights reserved | Design by <a
					href="#">TTK</a>
			</p>
		</div>
		<!--//footer-->
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="Login/js/login.js"></script>
</body>
</html>