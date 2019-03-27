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
                    <input  class="form-control   type="text" placeholder="Nhập Tên Phòng Ban" ng-model="keySearch">
                </div>
                <div class="col-4 form-inline">
                    <button class=" btn btn-success " data-toggle="modal" data-target="#phongbanAdd" ng-click="showAdd();">{{listLanguage.lblAddDeparts}}</button>
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
                        <button ng-click="showEdit(list);" data-toggle="modal" data-target="#phongbanEdit"  class="btn btn-outline-success btn-sm">
                        <i class="fa fa-pencil" style="font-size:20px;color:black"></i>
                        </button>
                        <button ng-click="showView(list);"  data-toggle="modal" data-target="#phongbanView"  class="btn btn-outline-success btn-sm">
                        <i class="fa fa-eye" style="font-size:20px;color:black"></i>
                        </button>
                        <button ng-click="deleteDeparts(list);" data-toggle="modal" data-target="#phongbanDelete"   class="btn btn-outline-success" btn-sm>
                        <i class="  fa fa-remove" style="font-size:20px;color:red"></i>
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
    <!-- STAR POUP ADD DEPARTSS -->
    <div class="modal fade" id="phongbanAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Thêm Phòng Ban</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="addDeparts.action" method="post" >
                    <div class="modal-body">
                        <div class="form-group">
                            <label  for="inputAddress">Tên Phòng Ban</label>
                            <input  ng-readonly="view" name = "nameDeparts" id="nameDeparts" ng-model="listTemp.name_departs" required type="text" class="form-control" >
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ Qua</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END POUP ADD DEPARTS -->
        <!-- STAR POUP EDIT DEPARTSS -->
    <div class="modal fade" id="phongbanEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Chỉnh Sửa Phòng Ban</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="editDeparts.action" method="post" >
                    <div class="modal-body">
                        <div class="form-group">
                            <label  for="inputAddress">Tên Phòng Ban</label>
                            <input  name = "nameDeparts" id="nameDeparts" ng-model="listTemp.name_departs" required type="text" class="form-control" >
                            <input type="hidden" name="idDeparts" value="{{listTemp.id_departs}}" ng-model="listTemp.id_departs">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Cập Nhập</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ Qua</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END POUP EDIT DEPARTS -->
          <!-- STAR POUP DELETE DEPARTSS -->
    <div class="modal fade" id="phongbanDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Xóa Phòng Ban</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="removeDeparts.action" method="post" >
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="text-info"  for="inputAddress">Bạn Có Muốn Xóa Phòng Ban {{listTemp.name_departs}} ?</label>
                            <input  name = "idDeparts" id="idDeparts" value="{{listTemp.id_departs}}"type="hidden" class="form-control" >
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Đồng Ý</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Bỏ Qua</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END POUP DELETE DEPARTS -->
</div>