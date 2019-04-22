'use strict'
appAdmin.controller('quanlynhanviencontroller', function($scope ,quanlynhanvienservices, $rootScope, $window, $http){
	$scope.checkEdit = false;
	$scope.checkAdd = false;
	$scope.checkView = false;
	$scope.checkNote = false;
	$scope.changeStaffs = 10;
	$scope.showOnePage = 10;
	quanlynhanvienservices.getAllDeparts().then(function(res){
		$scope.listDeparts = res.data;

	},function(error){

	});
	quanlynhanvienservices.getListStaffs().then(function(res){
		$scope.listStaffs = res.data;
	},function(error){
		console.log(error);
	});
	$scope.showEdit = function(list) {
		$scope.listStaffsTemp = {
			'id_staff' : list.id_staffs,
			'id_departs' : list.departs.id_departs,
			'name_staffs' : list.name,
			'gender_staffs' : list.gender,
			'birthday_staffs' : list.birthday,
			'email_staffs' : list.email,
			'phone_staffs' : list.phone,
			'note_staffs' : list.note
		}

	}
$scope.addNhanVien = function()
	{
	quanlynhanvienservices.addStaffs1($scope.id_departs,$scope.name_staff,$scope.gender,$scope.birthday,$scope.email,$scope.phone,$scope.note).then(function(res){
		$scope.listStaffs = res.data;
		$('#addNhanvien').modal('toggle');
		alert('Add Staff Success');
	},function(error){
		
	});
	}
	$scope.showRemove = function(x, y) {
		$scope.id_staff = y;
		$scope.name_staff = x;
	}
	$scope.removeStaff = function(){
		quanlynhanvienservices.deleteStaffs($scope.id_staff).then(function(res){
			$scope.listStaffs = res.data;
			$('#deleteNhanvien').modal('toggle');
			alert('Remove Staff Success');
		},function(error){
			console.log(error);

		})

};
$scope.editStaff = function()

	{
	quanlynhanvienservices.updateStaff($scope.listStaffsTemp.id_staff,$scope.listStaffsTemp.id_departs,$scope.listStaffsTemp.name_staffs,$scope.listStaffsTemp.gender_staffs,$scope.listStaffsTemp.birthday_staffs,$scope.listStaffsTemp.email_staffs,$scope.listStaffsTemp.phone_staffs,$scope.listStaffsTemp.note_staffs).then(function(res){
		$scope.listStaffs = res.data;
		$('#editNhanvien').modal('toggle');
		$scope.listStaffsTemp = {
				'id_staff' : list.id_staffs,
				'id_departs' : list.departs.id_departs,
				'name_staffs' : list.name,
				'gender_staffs' : list.gender,
				'birthday_staffs' : list.birthday,
				'email_staffs' : list.email,
				'phone_staffs' : list.phone,
				'note_staffs' : list.note
			}
		alert('Update Staff Success');
	},function(error){
		
	})
	}
	$scope.showChange = function(){
		quanlynhanvienservices.getAboutStaffs($scope.changeStaffs).then(function(res){
			$scope.listStaffs = res.data;
		quanlynhanvienservices.sumpage($scope.changeStaffs).then(function(res){
		$scope.sumPage = res.data;
	},function(error){

	});

		},function(error){

		})
	}
	$scope.redirectPage = function(index){
		var page = index*$scope.showOnePage;
		quanlynhanvienservices.redirectPage(page,$scope.showOnePage).then(function(res){
			$scope.listStaffs = res.data;
		})


	}
		$scope.boQua = function(){
				clear();
		}
	function clear(){
				$scope.tempStaffs = {
					    "id_staffs":null,
					    "departs": {
					      "id_departs": 1,
					      "name_departs":null
					    },
					    "name": null,
					    "gender": 1,
					    "birthday": null,
					    "photo": null,
					    "email": null,
					    "phone": null,
					    "salary": null,
					    "rank_staff": 1,
					    "note": null
					 	 }

			}
		$scope.showAddStaffs = function(){
			$scope.name_staff = "";
			$scope.gender = 1;
			$scope.birthday = "";
			$scope.id_departs = 4;
			$scope.email = "";
			$scope.phone = "";
			$scope.note = "";
//			alert(1);
			
		};
		$scope.showNote = function(list){
			$scope.checkNote = true;
			$scope.checkAdd = false;
			$scope.checkView = false;
			$scope.checkEdit = false;
			$scope.records.hinhthuc = 1;
			$scope.idNote = list.id_staffs;

	};
		$scope.clearForm =function(){
			$scope.tempStaffs.name = "";
			$scope.tempStaffs.gender=1;
			$scope.tempStaffs.birthday ="";
			$scope.tempStaffs.salary="";
			$scope.tempStaffs.departs.id_departs="";
			$scope.tempStaffs.rank_staffs = 1;
			$scope.tempStaffs.email = "";
			$scope.tempStaffs.phone = "";
			$scope.tempStaffs.note="";

		};
		$scope.showViewStaffs = function(list){
			$scope.checkView = true;
			$scope.checkEdit = false;
			$scope.checkAdd = false;
			$scope.checkNote = false;
			$scope.tempStaffs = {
									    "id_staffs": list.id_staffs,
									    "departs": {
									      "id_departs": list.departs.id_departs,
									      "name_departs":list.departs.name_departs
									    			},
									    "name": list.name,
									    "gender": list.gender,
									    "birthday": list.birthday,
									    "photo": list.photo,
									    "email": list.email,
									    "phone": list.phone,
									    "salary": list.salary,
									    "rank_staff": list.rank_staff,
									    "note": list.note
					  			}
		};

		$scope.noteStaffs = function(){
			var date = new Date();
			var dateStr = date.getDate()+"/"+(date.getMonth()+1)+"/"+date.getFullYear()+" "+date.getHours()+":"+date.getMinutes();
			quanlynhanvienservices.staffsNote($scope.idNote,$scope.records.hinhthuc,$scope.records.reason,dateStr).then(function(res){
				$scope.records.reason ='';
				$("#nhanvien").modal("toggle");

			},function(error){
				console.log(error);
			});
			
		}
		$scope.addStaffs = function(){
			var	  staffs1 ={
							"staffs":{
							  "birthday": $scope.tempStaffs.birthday,
							  "departs": {
							    "id_departs": $scope.tempStaffs.departs.id_departs,
							    "name_departs": $scope.tempStaffs.departs.name_departs
							  },
							  "email": $scope.tempStaffs.email,
							  "gender":$scope.tempStaffs.gender,
							  "id_staffs": 0,
							  "name":  $scope.tempStaffs.name,
							  "note":  $scope.tempStaffs.note,
							  "phone":  $scope.tempStaffs.phone,
							  "photo": $scope.tempStaffs.photo.name,
							  "rank_staff":$scope.tempStaffs.rank_staffs,
							  "salary": $scope.tempStaffs.salary
							}
						}
						console.log(staffs1);

		              //  var config =  {
			             //    'Accept': 'text/html',
			           		// 'Content-Type': 'application/json'
		            		// }
					quanlynhanvienservices.addStaffs1(staffs1).then(function(res){
					console.log(res.data);
					// if(res.data === -1){
					// 	alert("Thêm Nhân Viên Thất Bại");
					// }else{
					// 		$scope.Staffs.id_staffs=res.data;
					// 		quanlynhanvienservices.uploadAvatar($scope.tempStaffs.photo).then(function(res){
					// 				$scope.listStaffs.push($scope.Staffs);
					// 				$('#nhanvien').modal('toggle');

					// 	},function(error){
					// 		console.log(error)

					// 	});
					// }

				},function(error){
					console.log(error);
				})


		};
		$scope.updateStaffs = function(){
			if($scope.tempStaffs.photo.name == null || $scope.tempStaffs.photo.name ==='' || $scope.tempStaffs.photo.name == undefined){
							var dataStaffs = {
										"id_staffs": $scope.tempStaffs.id_staffs,
									    "departs": {
									      "id_departs":$scope.tempStaffs.departs.id_departs,
									      "name_departs":$scope.tempStaffs.departs.name_departs
									    			},
									    "name":$scope.tempStaffs.name,
									    "gender": $scope.tempStaffs.gender,
									    "birthday": $scope.tempStaffs.birthday,
									    "photo": $scope.avatar,
									    "email": $scope.tempStaffs.email,
									    "phone": $scope.tempStaffs.phone,
									    "salary": $scope.tempStaffs.salary,
									    "rank_staff": $scope.tempStaffs.rank_staff,
									    "note": $scope.tempStaffs.note
						};
			quanlynhanvienservices.updateStaff($scope.tempStaffs.id_staffs,dataStaffs).then(function(res){
				$scope.listTemp.id_staffs = $scope.tempStaffs.id_staffs;
				$scope.listTemp.departs.id_departs = $scope.tempStaffs.departs.id_departs;
				$scope.listTemp.departs.name_departs = $scope.tempStaffs.departs.name_departs;
				$scope.listTemp.name = $scope.tempStaffs.name;
				$scope.listTemp.gender = $scope.tempStaffs.gender;
				$scope.listTemp.birthday = $scope.tempStaffs.birthday;
				$scope.listTemp.photo = $scope.tempStaffs.photo;
				$scope.listTemp.email = $scope.tempStaffs.email;
				$scope.listTemp.phone = $scope.tempStaffs.phone;
				$scope.listTemp.salary = $scope.tempStaffs.salary;
				$scope.listTemp.rank_staff = $scope.tempStaffs.rank_staff;
				$scope.listTemp.note = $scope.tempStaffs.note;
				$scope.tempStaffs = $scope.listTemp;
				$("#nhanvien").modal("toggle");
//				quanlynhanvienservices.getListStaffs();
			},function(error){
				console.log(error);
			});

			}else{
					var dataStaffs = {
							"id_staffs": $scope.tempStaffs.id_staffs,
							"departs": {
						  	"id_departs":$scope.tempStaffs.departs.id_departs,
					   		"name_departs":$scope.tempStaffs.departs.name_departs
					 			},
							"name":$scope.tempStaffs.name,
							"gender": $scope.tempStaffs.gender,
							"birthday": $scope.tempStaffs.birthday,
							"photo": $scope.tempStaffs.photo.name,
							"email": $scope.tempStaffs.email,
							 "phone": $scope.tempStaffs.phone,
							"salary": $scope.tempStaffs.salary,
						 	"rank_staff": $scope.tempStaffs.rank_staff,
							"note": $scope.tempStaffs.note
							};
			quanlynhanvienservices.updateStaff($scope.tempStaffs.id_staffs,dataStaffs).then(function(res){
				quanlynhanvienservices.uploadAvatar($scope.tempStaffs.photo).then(function(res){
					$scope.listTemp.id_staffs = $scope.tempStaffs.id_staffs;
					$scope.listTemp.departs.id_departs = $scope.tempStaffs.departs.id_departs;
					$scope.listTemp.departs.name_departs = $scope.tempStaffs.departs.name_departs;
					$scope.listTemp.name = $scope.tempStaffs.name;
					$scope.listTemp.gender = $scope.tempStaffs.gender;
					$scope.listTemp.birthday = $scope.tempStaffs.birthday;
					$scope.listTemp.photo = res.data;
					$scope.listTemp.email = $scope.tempStaffs.email;
					$scope.listTemp.phone = $scope.tempStaffs.phone;
					$scope.listTemp.salary = $scope.tempStaffs.salary;
					$scope.listTemp.rank_staff = $scope.tempStaffs.rank_staff;
					$scope.listTemp.note = $scope.tempStaffs.note;
					$scope.tempStaffs = $scope.listTemp;
				$("#nhanvien").modal("toggle");
//				quanlynhanvienservices.getListStaffs()
				},function(error){

				})
				;
			},function(error){
				console.log(error);
			});

			}

		};

	// }
});