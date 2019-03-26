'use strict'
appAdmin.controller('quanlyphongbancontroller', function($scope, $rootScope,
		$window, $http) {
	$scope.add = false;
	$scope.view = false;
	$scope.edit = false;
	$scope.changeValue = 10;
	$scope.showOnePage = 10;
	$scope.showAdd = function() {
		$scope.add = true;
		$scope.view = false;
		$scope.edit = false;
		clearFrom();
		$('#nameDeparts').focus();
	};
	$http.get('http://localhost:8080/assgment/listDeparts.action').then(
			function(res) {
				$scope.listDeparts = res.data;
			}, function(error) {
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
		$scope.listTemp = {
			'name_departs' : list.name_departs,
			"id_departs" : list.id_departs
		}
	};

	// }
});