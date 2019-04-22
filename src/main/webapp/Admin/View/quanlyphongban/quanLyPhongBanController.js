'use strict'
appAdmin.controller('quanlyphongbancontroller', function($scope ,quanLyPhongBanServices, $rootScope, $window, $http) {
	$scope.add = false;
	$scope.view = false;
	$scope.edit = false;
	$scope.delete = false;
	$scope.changeValue = 10;
	$scope.showOnePage = 10;
	$scope.showAdd = function() {
		$scope.add = true;
		$scope.view = false;
		$scope.edit = false;
		$scope.delete = false;
		clearFrom();
		$('#nameDeparts').focus();
	};
	quanLyPhongBanServices.listDeparts().then(function(res){
		$scope.listDeparts = res.data;
	},function(error){
		console.log(error);
	});
	function clearFrom() {
		$scope.listTemp = {
			'name_departs' : null,
			"id_departs" : null
		}
	}
	$scope.showEdit = function(list) {
		$scope.edit = true;
		$scope.add = false;
		$scope.view = false;
		$scope.delete = false;
		$scope.departsTemp = list;
		$scope.listTemp = {
			'name_departs' : list.name_departs,
			"id_departs" : list.id_departs
		}
	};
	$scope.showView = function(list) {
		$scope.view = true;
		$scope.edit = false;
		$scope.add = false;
		$scope.delete = false;
		$scope.listTemp = {
			'name_departs' : list.name_departs,
			"id_departs" : list.id_departs
		}
	};

	$scope.showDelete= function(list)
	{
		$scope.view = false;
		$scope.edit = false;
		$scope.add = false;
		$scope.delete = true;
		$scope.listTemp = {
			'name_departs' : list.name_departs,
			"id_departs" : list.id_departs
		}
	};
$scope.addDeparts = function()
{
	quanLyPhongBanServices.addDeparts($scope.listTemp.name_departs).then(function(res){
		$scope.listDeparts = res.data;
		$('#phongban').modal('toggle');
		alert('Add Depart Success');

	},function(error){

	})
}
$scope.updateDeparts = function()
{
	quanLyPhongBanServices.updateDeparts($scope.listTemp.id_departs,$scope.listTemp.name_departs).then(function(res){
		$scope.listDeparts = res.data;
		$('#phongban').modal('toggle');
		alert('Update Depart Success');
	},function(error){
		console.log(error);
	})
}
$scope.deleteDeparts = function()
{
	quanLyPhongBanServices.deleteDeparts($scope.listTemp.id_departs).then(function(res){
		$scope.listDeparts = res.data;
		$('#phongban').modal('toggle');
		alert('Delete Depart Success');
	},function(error){
		console.log(error);
	})
}
});