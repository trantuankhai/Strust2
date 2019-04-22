  
'use strict'
var appAdmin = angular.module('adminApp', ['ngRoute','managerDepartsServices','managerStaffServices']);
appAdmin.run( function($rootScope){
  $rootScope.linkApi = 'http://localhost:8080/assgment/';       
  
});
appAdmin.directive('fileModel', ['$parse', function ($parse) {
    return {
       restrict: 'A',
       link: function(scope, element, attrs) {
          var model = $parse(attrs.fileModel);
          var modelSetter = model.assign;
          element.bind('change', function(){
             scope.$apply(function(){
                modelSetter(scope, element[0].files[0]);
             });
          });
       }
    }; 
}]);
appAdmin.filter('foreach', function () {
    return function (input) {
        var lowBound, highBound;
        switch (input.length) {
            case 1:
                lowBound = 0;
                highBound = parseInt(input[0]) - 1;
                break;
            case 2:
                lowBound = parseInt(input[0]);
                highBound = parseInt(input[1]);
                break;
            default:
                return input;
        }
        var result = [];
        for (var i = lowBound; i <= highBound; i++)
            result.push(i);
        return result;
    };
});

appAdmin.config(function($routeProvider) {
	$routeProvider.when("/", {
		controller : 'quanlyphongbancontroller',
		templateUrl : 'Admin/View/quanlyphongban/_quanlyphongban.jsp'
	}).when("/quan-ly-phong-ban", {
		templateUrl : 'Admin/View/quanlyphongban/_quanlyphongban.jsp',
		controller : 'quanlyphongbancontroller'
	}).when("/quan-ly-nhan-vien", {
		templateUrl : 'Admin/View/quanlynhanvien/_quanlynhanvien.jsp',
		controller : 'quanlynhanviencontroller'
	}).when("/thong-ke-thanh-tich-nhan-vien", {
		templateUrl : 'Admin/View/thongkethanhtichtheonhanvien/_thongketheonhanvien.html',
		controller : 'thongketheonhanviencontroller'
	}).when("/thong-ke-thanh-tich-phong-ban", {
		templateUrl : 'Admin/View/thongkethanhtichtheophongban/_thongketheophongban.html',
		controller : 'thongketheophongbancontroller'
	}).otherwise({
		templateUrl : "index.jsp"
	});
});
appAdmin.controller('adminController', function($scope , $rootScope, $window, $http){
  if($window.localStorage.getItem('language')=='vi'){
    $scope.language = 'vi';
    $scope.listLanguage = {
      'lblDeparts':'Quản Lý Phòng Ban',
       'lblStaffs':'Quản Lý Nhân Viên',
       'lblThongKe' :'Thống Kê Thành Tích',
       'lblThongKeByStaffs' :"Theo Nhân Viên",
       'lblThongKeByDeparts' :"Theo Phòng Ban",
       'lblAction' :"Hành Động",
       'lblCodeDeparts' :"Mã Phòng Ban",
       'lblNameDeparts' :"Tên Phòng Ban",
       'lblCodeStaffs' :"Mã Nhân Viên",
       'lblNameStaffs' :"Tên Nhân Viên",
       'lblGenderStaffs' :"Giới Tính",
       'lblAvatarStaffs' :"Hình Ảnh",
       'lblPhoneStaffs' :"Số Điện Thoại",
       'lblNoteStaffs' :"Ghi Chú",
       'lblAddStaffs' :"Thêm Nhân Viên",
       'lblAddDeparts' :"Thêm Phòng Ban",
       'lblDetail' :"Chi Tiết",
       'lblFilter' :"Loc Phòng Ban",
       'lblSeach':'Tìm Kiếm',
       'lblDateOfBirthday':"Ngày Sinh",
       'lblSumScore':'Tổng Điểm',
       'lblRecords':"Ghi Nhận",
       'lblTop10NhanVien':'Tốp 10 Nhân Viên Có Thành Tích Cao Nhất',
       'lblThongKeNhanVien':'Thống Kê Thành Tích Nhân Viên',
       'lblThongKePhongBan':'Thống Kê Thành Tích Theo Phòng Ban'
          }
  }else{
     $scope.language = 'us';
    $scope.listLanguage = {
      'lblDeparts':'Departs Manager',
       'lblStaffs':'Staffs Manager',
       'lblThongKe' :"Statistical Achievement",
       'lblThongKeByStaffs' :"According To Staffs",
       'lblThongKeByDeparts' :"According To Departs",
       'lblAction' :"Action",
       'lblCodeDeparts' :"Code Departs",
       'lblNameDeparts' :"Name Departs",
       'lblCodeStaffs' :"Code Staffs",
       'lblNameStaffs' :"Name Staffs",
       'lblGenderStaffs' :"Gender",
       'lblAvatarStaffs' :"Avatar",
       'lblPhoneStaffs' :"Phone",
       'lblNoteStaffs' :"Note",
       'lblAddStaffs' :"Add Staffs",
       'lblAddDeparts' :"Add Departs",
       'lblDetail' :"Detail",
        'lblFilter' :"Filter Departs",
        'lblSeach':'Search',
        'lblDateOfBirthday':"Date Of Birthday",
        'lblSumScore':'Sum Point',
        'lblRecords':"Records",
        'lblTop10NhanVien':'Top Ten Staffs',
        'lblThongKeNhanVien':'Statistics by Employee',
        'lblThongKePhongBan':'Statistics by Departs'

    }
  }
  
$scope.changeLanguage =function(){
  $window.localStorage.setItem('language',$scope.language);
  if($scope.language =='vi'){
    $scope.listLanguage = {
      'lblDeparts':'Quản Lý Phòng Ban',
       'lblStaffs':'Quản Lý Nhân Viên',
       'lblThongKe' :"Thống Kê Thành Tích",
       'lblThongKeByStaffs' :"Theo Nhân Viên",
       'lblThongKeByDeparts' :"Theo Phòng Ban",
       'lblAction' :"Hành Động",
       'lblCodeDeparts' :"Mã Phòng Ban",
       'lblNameDeparts' :"Tên Phòng Ban",
       'lblCodeStaffs' :"Mã Nhân Viên",
       'lblNameStaffs' :"Tên Nhân Viên",
       'lblGenderStaffs' :"Giới Tính",
       'lblAvatarStaffs' :"Hình Ảnh",
       'lblPhoneStaffs' :"Số Điện Thoại",
       'lblNoteStaffs' :"Ghi Chú",
       'lblAddStaffs' :"Thêm Nhân Viên",
       'lblAddDeparts' :"Thêm Phòng Ban",
       'lblDetail' :"Chi Tiết",
        'lblFilter' :"Loc Phòng Ban",
        'lblSeach':'Tìm Kiếm',
        'lblDateOfBirthday':"Ngày Sinh",
        'lblSumScore':'Tổng Điểm',
        'lblRecords':"Ghi Nhận",
        'lblTop10NhanVien':'Tốp 10 Nhân Viên Có Thành Tích Cao Nhất',
        'lblThongKeNhanVien':'Thống Kê Thành Tích Nhân Viên',
        'lblThongKePhongBan':'Thống Kê Thành Tích Theo Phòng Ban'

    }
  }else{
       $scope.listLanguage = {
     'lblDeparts':'Departs Manager',
       'lblStaffs':'Staffs Manager',
       'lblThongKe' :"Statistical Achievement",
       'lblThongKeByStaffs' :"According To Staffs",
       'lblThongKeByDeparts' :"According To Departs",
       'lblAction' :"Action",
       'lblCodeDeparts' :"Code Departs",
       'lblNameDeparts' :"Name Departs",
       'lblCodeStaffs' :"Code Staffs",
       'lblNameStaffs' :"Name Staffs",
       'lblGenderStaffs' :"Gender",
       'lblAvatarStaffs' :"Avatar",
       'lblPhoneStaffs' :"Phone",
       'lblNoteStaffs' :"Note",
       'lblAddStaffs' :"Add Staffs",
       'lblAddDeparts' :"Add Departs",
       'lblDetail' :"Detail",
       'lblFilter' :"Filter Departs",
        'lblSeach':'Search',
        'lblDateOfBirthday':"Date Of Birthday",
        'lblSumScore':'Sum Point',
        'lblRecords':"Records",
        'lblTop10NhanVien':'Top Ten Staffs',
        'lblThongKeNhanVien':'Statistics by Employee',
        'lblThongKePhongBan':'Statistics by Departs'

    }
  }

  };
});

