<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin</title>
<!-- Bootstrap CSS -->
<link href="Admin/css/lib/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="Admin/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://daneden.github.io/animate.css/animate.min.css">
<link href="Admin/css/app/admin-styles.css" rel="stylesheet"
	type="text/css" />
<link href="Admin/css/app/styles.css" rel="stylesheet" type="text/css" />
<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	rel="stylesheet">
 <link href="https://cdn.datatables.net/autofill/2.3.3/css/autoFill.bootstrap4.min.css"
	rel="stylesheet"> 
<script src="Admin/ckeditor/ckeditor.js"></script>


<!-- Custom CSS -->
</head>
<body ng-app="adminApp" ng-controller="adminController">
	<div id="main">
		<!-- top bar navigation -->
		<div class="headerbar">
			<!-- LOGO -->
			<div class="headerbar-left">
				<a href="#!" class="logo"><img alt="Logo"
					src="Admin/images/logo.png" /> <span>Admin</span></a>
			</div>
			<nav class="navbar-custom">
				<ul class="list-inline float-right mb-0">
					<li class="float-left">
						<div>
							<div class="col-3 mt-2 form-inline">
								<select class="form-control" ng-model="language"
									ng-change="changeLanguage();">
									<option value="vi">VI_VN</option>
									<option value="us">EN_US</option>
								</select>
							</div>

						</div>
					</li>
					<li class="list-inline-item dropdown notif"><a
						class="nav-link dropdown-toggle nav-user" data-toggle="dropdown"
						role="button" aria-haspopup="false" aria-expanded="false"> <img
							src="Admin/images/avata.jpg" alt="Profile image"
							class="avatar-rounded">
					</a>
						<div class="dropdown-menu dropdown-menu-right profile-dropdown ">
							<!-- item-->
							<div class="dropdown-item noti-title">
								<h5 class="text-overflow">
									<small>Hello, </small>
								</h5>
							</div>
							<!-- item-->
							<a href="#!" style="color: black;"
								class="dropdown-item notify-item"> <i class="fa fa-user"></i>
								<span>Profile</span>
							</a>
							<!-- item-->
							<button class="dropdown-item notify-item" data-toggle="modal"
								data-target="#changepassword">
								<i class="fa fa-external-link"></i> <span>Đổi mật khẩu</span>
							</button>
							<!-- item-->
							<button ng-click="logOut();" class="dropdown-item notify-item">
								<i class="fa fa-external-link"></i> <span>Đăng xuất</span>
							</button>
						</div></li>
				</ul>
				<ul class="list-inline menu-left mb-0">
					<li class="float-left">
						<button class="button-menu-mobile open-left">
							<i class="fa fa-fw fa-bars"></i>
						</button>
					</li>
				</ul>
			</nav>
		</div>
		<div class="left main-sidebar">

			<div class="sidebar-inner leftscroll">
				<div id="sidebar-menu">

					<ul>
						<li class="submenu"><a class="active" href="index.html"><i
								class="fa fa-fw fa-bars"></i><span> Dashboard </span> </a></li>
						<li class="submenu"><a href="#!quan-ly-phong-ban"><i
								class="fa fa-bank"></i><span> {{listLanguage.lblDeparts}}
							</span> </a></li>

						<li class="submenu"><a href="#!quan-ly-nhan-vien"><i
								class="fa fa-users"></i><span> {{listLanguage.lblStaffs}}
							</span> </a></li>
						<li class="submenu"><a><i class="fa fa-line-chart"></i> <span>
									{{listLanguage.lblThongKe}}</span> <span class="menu-arrow"></span></a>
							<ul class="list-unstyled">
								<li><a href="#!thong-ke-thanh-tich-nhan-vien">{{listLanguage.lblThongKeByStaffs}}</a></li>
								<li><a href="#!thong-ke-thanh-tich-phong-ban">{{listLanguage.lblThongKeByDeparts}}</a></li>
							</ul></li>
					</ul>
					<div class="clearfix"></div>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
		<!-- End Sidebar -->
		<div class="content-page">

			<!-- Start content -->
			<div class="content" ng-view>
				<!-- NỘI DUNG TRANG WEB-->

				<!-- KẾT THÚC NỘI DUNG TRANG WEB-->
			</div>
			<!-- END content -->
		</div>
		<!-- END content-page -->

		<footer class="footer">
			<span class="text-right"> Copyright 2018 </span> <span
				class="float-right"> Powered by <a href="#"><b>TTK</b></a>
			</span>
		</footer>

	</div>
	<!-- JQUERY -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<!-- END main -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> 
<script src="https://cdn.datatables.net/autofill/2.3.3/js/autoFill.bootstrap4.min.js"></script> 
	<script src="Admin/js/lib/popper.min.js"></script>
	<script src="Admin/js/lib/bootstrap.min.js"></script>
	<!-- App js -->
	<script src="Admin/js/lib/pikeadmin.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.7.4/angular.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
	<script src="Admin/js/app/admin.js"></script>
	<script src="Admin/View/quanlyphongban/quanLyPhongBanServices.js"></script>
	<script src="Admin/View/quanlyphongban/quanLyPhongBanController.js"></script>
	<script src="Admin/View/quanlynhanvien/quanLyNhanVienServices.js"></script>
	<script src="Admin/View/quanlynhanvien/quanLyNhanVienController.js"></script>
</body>
</html>