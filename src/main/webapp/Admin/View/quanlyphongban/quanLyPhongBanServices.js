'use strict'
angular.module('managerDepartsServices', []).factory('quanLyPhongBanServices', ["$http", "$rootScope", function($http, $rootScope) {
    var service = {
            listDeparts : listDeparts,
            getTenDeparts : getTenDeparts,
            addDeparts:addDeparts,
            sumPage:sumPage,
            updateDeparts:updateDeparts,
            deleteDeparts:deleteDeparts,
            redirectPage:redirectPage,
            countStaffsInDeparts : countStaffsInDeparts
            };
        return service;   
    function getTenDeparts(soluong) {
            var link = $.param({
                    First : 0,
                    End : soluong
                });
          var url = $rootScope.linkApi+"departs/page?"+link;
        return $http.get(url);
    }
    function listDeparts(){
         var url =$rootScope.linkApi+"listDeparts";
        return $http.get(url); 
    }
     function addDeparts(departs) {
        return $http.post($rootScope.linkApi+'addDeparts.action?nameDeparts='+departs,departs,{});
    }
    function sumPage(showOnePage){
        var url = $rootScope.linkApi+"departs/sumPage/"+showOnePage;
        return $http.get(url);
    }

    function updateDeparts(id_departs,name_departs){
        return $http.get($rootScope.linkApi+'editDeparts.action?idDeparts='+id_departs+'&nameDeparts='+name_departs,{})
    }
    function deleteDeparts(id_departs){
        return $http.get($rootScope.linkApi+'removeDeparts.action?idDeparts='+id_departs);
    }
    function redirectPage(page,showOnePage){
                var link = $.param({
                    First : page,
                    End : showOnePage
                });
          var url = $rootScope.linkApi+"departs/page/?"+link;
        return $http.get(url);

    }
    function countStaffsInDeparts(id){
        var url  = $rootScope.linkApi+"departs/countStaffs/"+id;
        return $http.get(url);

    }

}]);