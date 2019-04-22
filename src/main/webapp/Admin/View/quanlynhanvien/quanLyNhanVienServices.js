'use strict'
angular.module('managerStaffServices',[]).factory('quanlynhanvienservices',['$http','$rootScope', function($http,$rootScope){
	var services = {
					getListStaffs : getListStaffs,
					addStaffs1 : addStaffs1,
					updateStaff : updateStaff,
					deleteStaffs : deleteStaffs,
					sumpage : sumpage,
			        redirectPage:redirectPage,
			        getAboutStaffs : getAboutStaffs,
			        getAllDeparts : getAllDeparts,
			        uploadAvatar : uploadAvatar,
			        staffsNote:staffsNote
    				}
    return services;

		function getListStaffs(){
			var url = $rootScope.linkApi+"listStaffs.action";
			return $http.get(url);
				
			};
		function getAllDeparts(){
        var url = $rootScope.linkApi+"listDeparts.action";
        return $http.get(url);
    	};

		function getAboutStaffs(sl){
			var url = $rootScope.linkApi + "staffs/About/"+sl
			return $http.get(url);
		};
		function addStaffs1(id_departs,name_staff,gender,birthday,email,phone,note){
			var req = {
                method: 'GET',
                url :$rootScope.linkApi+"addStaff?id_departs="+id_departs+"&name_staff="+name_staff+"&gender="+gender+"&birthday="+birthday+"&email="+email+"&phone="+phone+"&note="+note,
            }
			
			return $http(req);
				
			};
			function staffsNote(id,type,reason,date){
				var data =  $.param({
					manv:id,
					type:type,
					reason:reason,
					date:date

				});
			var url =$rootScope.linkApi+"records?"+data;	
			           	return  $http.post(url,data,{});
				}

			function uploadAvatar(dataAvatar){
			var config = {
            transformRequest: angular.identity,
            transformResponse: angular.identity,
            headers: {
            	'Accept': 'text/plain',
                'Content-Type': undefined
            }
      		 }
        	var url =$rootScope.linkApi+"avatar";
         	var data = new FormData();
          	data.append("multipartFile", dataAvatar);
			return $http.post(url,data,config);

			}

		function updateStaff(id_staffs,id_departs,name_staff,gender,birthday,email,phone,note){
				 var req = {
                method: 'GET',
                url:$rootScope.linkApi+"editStaff?id="+id_staffs+"&id_departs="+id_departs+"&name_staff="+name_staff+"&gender="+gender+"&birthday="+birthday+"&email="+email+"&phone="+phone+"&note="+note,
            }
			 return $http(req);	
			};

		function deleteStaffs(id_staffs){
        return $http.get($rootScope.linkApi+'removeStaff.action?id='+id_staffs);

				
			};

		function sumpage(showOnePage){
			return $http.get($rootScope.linkApi+"staffs/sumPage/"+showOnePage)
				
			};


		function redirectPage(page,show){
			return $http.get($rootScope.linkApi+"staffs/navigationPage/"+page+"/"+show);
				
			};
}])