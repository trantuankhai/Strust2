'use strict'
var loginApp = angular.module('appLogin',[]);
loginApp.controller('loginController', function($scope,$http,$rootScope,$window,$interval){
	$rootScope.linkApi =' http://localhost:8080/';
		function setCookie(cname, cvalue, minus) {
	    var d = new Date();
	    d.setTime(d.getTime() + (minus*60*1000));
	    var expires = "expires="+ d.toUTCString();
	    document.cookie = cname + "=" + cvalue + "; " + expires;
		}
	$scope.logIn = function(){
		var url = $rootScope.linkApi+'assgment/checkLogin?';
		if( $scope.userName == undefined ||  $scope.userName ==="" ||  $scope.userName ===null ){
			alert("Bạn chưa nhập tên đăng nhập ");
			$('.user').focus();
			return;
			
		}else if($scope.passWord == undefined ||  $scope.passWord ==="" ||  $scope.passWord ===null){
			alert("Bạn Chưa nhập PassWord");
			$('.Password').focus();
			return;
		}else{
			var user = $.param({
				userName:$scope.userName.trim(),
				passWord:$scope.passWord.trim()
				})
//			var data = {'userName':$scope.userName,
//						'passWord':$scope.passWord}
			var data = new FormData();
				data.append('userName',$scope.userName);
				data.append('passWord',$scope.passWord);
			var  config = {
				headers: {
						'Accept': 'text/plain'
						}
			}
		$http.get(url+user,data,config).then(function(res){
			console.log(res);
//			if(res.data==='error password'){
//				alert("Sai mật khẩu vui lòng thử lại");
//				 $scope.passWord="";
//				$('.Password').focus();
//			}else if(res.data==='error username'){
//				alert("Tài khoản không tồn tại");
//					$('.user').focus();
//
//			}
//			else{
//
//				setCookie('token',res.data,5);
//
//				$window.localStorage.setItem("token",res.data);
//				//$http.defaults.headers.common.Authorization = 'Bearer ' +res.data;
//				$window.location.href = "../Admin";
//			}

		},function(error){
			console.log(error)

		});	

		}
	}	
	$(document).on("keypress", function(e){
    if(e.which == 13){
        $('#login').click();
    }
});	
	
	
});
