<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div ng-controller="quanlyphongbancontroller">
    <div class="container-fluid">
        <div class="card-body">
            <div class="row add">
                <div class="col-4 form-inline ">
                    <span class="font-weight-bold">Show: </span>
                    <select class="form-control" ng-change="showAmount();" ng-model = "changeValue">
                        <option ng-value="10">10</option>
                        <option ng-value="20">20</option>
                        <option ng-value="50">50</option>
                        <option ng-value="100">100</option>
                    </select>
                </div>
                <div class="col-4 form-inline">
                    <span class="font-weight-bold">{{listLanguage.lblSeach}}:  </span>
                    <input  class="form-control"   type="text" placeholder="Nhập Tên Phòng Ban" ng-model="keySearch">
                </div>
                <div class="col-4 form-inline">
                    <button class=" btn btn-success " data-toggle="modal" data-target="#phongban" ng-click="showAdd();">{{listLanguage.lblAddDeparts}}</button>
                </div>
                
            </div>
        </div>
        {{list.name_departs}}
        <table id="example1" class="table table-bordered table-responsive-sm table-hover display text-center">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>{{listLanguage.lblCodeDeparts}}</th>
                    <th>{{listLanguage.lblNameStaffs}}</th>
                   <!--  <th>Số Lượng Nhân Viên</th> -->
                    <th>{{listLanguage.lblAction}}</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="list in listDeparts.departs | filter :{'name_departs' : keySearch}">
                    <td>{{$index+1}}</td>
                    <td>PB{{list.id_departs}}</td>
                    <td>{{list.name_departs}}</td>
                 <!--    <td></td> -->
                    <td>
                        <button ng-click="showEdit(list);" data-toggle="modal" data-target="#phongban"  class="btn btn-outline-success btn-sm">
                        <i class="fa fa-pencil" style="font-size:20px;color:black"></i>
                        </button>
                        <button ng-click="showView(list);"  data-toggle="modal" data-target="#phongban"  class="btn btn-outline-success btn-sm">
                        <i class="fa fa-eye" style="font-size:20px;color:black"></i>
                        </button>
                        <button ng-click="showDelete(list)" data-toggle="modal" data-target="#phongban"   class="btn btn-outline-success" btn-sm>
                        <i class=" fa fa-remove" style="font-size:20px;color:red"></i>
                        </button>
                    </td>
                    
                </tr>
            </tbody>
        </table>
        <div class="row float-left" ng-show="countPage>1">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item">
                        <a class="page-link" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span
                            class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li ng-repeat="x in [].constructor(countPage) track by $index" ><a ng-click="redirectPage($index)" class="page-link">{{$index+1}}</a></li>
                    <li class="page-item">
                        <a class="page-link"  aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
   <!-- STAR POUP -->
    <div class="modal fade" id="phongban" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" ng-show="add" >Thêm Phòng Ban</h5>
                    <h5 class="modal-title" ng-show="delete" >Xóa Phòng Ban</h5>
                    <h5 ng-show="view" class="modal-title" >Xem Phòng Ban</h5>
                    <h5 ng-show="edit" class="modal-title" >Chỉnh Sửa Phòng Ban</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form name = "myForm" >
                    <div class="modal-body">
                        <div class="form-group">
                            <label ng-show = "view || add || edit"  for="inputAddress">Tên Phòng Ban</label>
                            <label ng-show="delete"  for="inputAddress">Bạn có muốn xóa phòng ban {{listTemp.name_departs}} ?</label>
                            <input ng-show = "view || add || edit"  ng-readonly="view" id="nameDeparts" ng-model="listTemp.name_departs" name="nameDeparts" required type="text" class="form-control" >
                            <input type="hidden" name="idDeparts" value="{{listTemp.name_departs}}">
                            <span ng-show = "myForm.$invalid && myForm.nameDeparts.$dirty" style = "color : red; margin : 10px;">Tên phòng ban không được rỗng</span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button ng-show="add" ng-click="addDeparts();" type="submit" class="btn btn-primary" ng-disabled = "myForm.$invalid">Thêm</button>
                        <button ng-show="delete" ng-click="deleteDeparts();" type="submit" class="btn btn-primary">Đồng Ý</button>
                        <button ng-show="edit" ng-click="updateDeparts();" type="submit" class="btn btn-primary" ng-disabled = "myForm.$invalid">Cập Nhập</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ Qua</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END POUP -->
</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#example1').DataTable(
					/* {
					autoFill: true	
					} */
			);
		});
	</script>
