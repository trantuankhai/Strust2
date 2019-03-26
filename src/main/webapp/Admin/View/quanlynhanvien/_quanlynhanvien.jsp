<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div ng-controller="quanlynhanviencontroller">
    <div class="container-fluid">
        <div class="card-body">
            <div class="row add">
                    <div class="col-3 form-inline ">
                        <span class="font-weight-bold">Show: </span>
                        <select ng-model="changeStaffs" ng-change="showChange();" class="form-control" >
                            <option ng-value="10">10</option>
                            <option ng-value="20">20</option>
                            <option ng-value="50">50</option>
                            <option ng-value="100">100</option>
                        </select>
                    </div>
                <div class="col-3 form-inline ">
                    <select class="form-control" ng-model ="departs" >
                        <option value="">-- {{listLanguage.lblFilter}} --</option>
                        <option >{{name.name_departs}}</option>
                    </select>
                </div>
                <div class="col-3 form-inline ">
                    <button ng-click="showAddStaffs();" class="btn" data-toggle="modal" data-target="#nhanvien">{{listLanguage.lblAddStaffs}}</button>
                </div>
                <div class="col-3 form-inline">
                    <input  class="form-control" ng-model="seachName"   type="text" placeholder="Nhập Tên Nhân Viên" ng-model="keySearch">
                </div>
                
            </div>
            <table id="example1" class="table table-bordered table-responsive-xl table-hover display">
                <thead>
                    <tr>
                        <th>{{listLanguage.lblCodeStaffs}}</th>
                        <th>{{listLanguage.lblNameDeparts}}</th>
                        <th>{{listLanguage.lblNameStaffs}}</th>
                        <th>{{listLanguage.lblGenderStaffs}}</th>
                        <th>{{listLanguage.lblAvatarStaffs}}</th>
                        <th>{{listLanguage.lblPhoneStaffs}}</th>
                        <th>{{listLanguage.lblNoteStaffs}}</th>
                        <th>{{listLanguage.lblAction}}</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="list in listStaffs.staffs | filter :{'name' : seachName} |filter: {'departs':{id_departs:departs}}">
                        <td>NV{{list.id_staffs}}</td>
                        <td>{{list.departs.name_departs}}</td>
                        <td>{{list.name}}</td>
                        <td ng-if="list.gender == 0">Nữ</td>
                        <td ng-if="list.gender == 1">Nam</td>
                        <td><img width="100" height="100" src="http://localhost:8080/assgment/avatar/{{list.photo}}"></td>
                        <td>{{list.phone}}</td>
                        <td>{{list.note}}</td>
                        <td>
                            <button data-toggle="modal" data-target="#nhanvien" ng-click="showEditStaffs(list);" class="btn"><i class="fa fa-pencil"></i></button>
                            <button data-toggle="modal" data-target="#nhanvien" ng-click="showViewStaffs(list);" class="btn"><i class="fa fa-eye"></i></button>
                            <button  ng-click="deleteStaffs(list,$index);" class="btn"><i class="fa fa-trash"></i></button>
                            <button data-toggle="modal" data-target="#nhanvien"  ng-click="showNote(list);" class="btn"><i class="fa fa-edit"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div ng-show = "sumPage>1" class="row float-left">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span
                                class="sr-only">Previous</span>
                            </a>
                        </li>
                        <li ng-repeat="x in [].constructor(sumPage) track by $index" ><a ng-click="redirectPage($index)" class="page-link">{{$index+1}}</a></li>
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
    </div>
    <div class="modal fade bd-example-modal-lg" id="nhanvien" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 ng-show="checkAdd" class="modal-title" id="exampleModalLongTitle">Thêm Nhân Viên</h5>
                    <h5 ng-show="checkEdit" class="modal-title" id="exampleModalLongTitle">Sửa Thông Tin Nhân Viên</h5>
                    <h5 ng-show="checkView" class="modal-title" id="exampleModalLongTitle">Xem Thông Tin Nhân Viên</h5>
                    <h5 ng-show="checkNote" class="modal-title" id="exampleModalLongTitle">Ghi Nhận Thành Tích</h5>
                    <button type="button" class="close" ng-click="boQua()" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" ng-show="checkNote">
                    <form class="form-horizontal" name= "formRecords" >
                        <div class="row">
                            <div class="col-10">
                                <span class="font-weight-bold">Lý Do:</span>
                                <textarea name="" required ng-model ="records.reason"  class="form-control" placeholder="Lý do"></textarea>
                            </div>
                            <div class="col-2">
                                <span class="font-weight-bold">Hình Thức</span>
                                <select  ng-model="records.hinhthuc"class="form-control" >
                                    <option ng-value="1">Thưởng</option>
                                    <option ng-value="-1">Phạt</option>
                                </select>
                                
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-body" ng-show="checkView || checkEdit || checkAdd">
                    <form class="form-horizontal" name= "formStaffs">
                        <div class="row">
                            <div class="col-8">
                                <span class="font-weight-bold">Họ Và Tên:</span>
                                <input name="nameStaffs" required ng-model ="tempStaffs.name" ng-readonly="checkView"
                                type="text" class="form-control" placeholder="FullName">
                            </div>
                            <div class="col-4">
                                <span class="font-weight-bold">Giới Tính:</span>
                                <select ng-model="tempStaffs.gender"  ng-readonly="checkView"  class="form-control" >
                                    <option ng-value="1">Nam</option>
                                    <option ng-value="0">Nữ</option>
                                </select>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8 ">
                                <span class="font-weight-bold">Hình Ảnh:</span>
                                <input required file-model="tempStaffs.photo" accept="image/gif,image/jpeg" ng-readonly="checkView "ng-show="checkAdd || checkEdit" type="file"  class="form-control">
                                <img class="mt-2" width="50" height="50" ng-show="checkView"  src="http://localhost:8080/avatar/{{tempStaffs.photo}}">
                            </div>
                            <div  class="col-4 ">
                                <span class="font-weight-bold">Ngày Sinh:</span>
                                <input pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" required  ng-model="tempStaffs.birthday" ng-readonly="checkView"type="text" class="form-control">
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <span class="font-weight-bold">Lương</span>
                                <input required ng-model="tempStaffs.salary" ng-readonly="checkView"type="text"  class="form-control" placeholder="Nhập Lương">
                            </div>
                            <div class="col-4">
                                <span class="font-weight-bold">Phòng Ban</span>
                                <select required  ng-model="tempStaffs.departs.id_departs"  ng-readonly="checkView"  class="form-control">
                                    <option ng-repeat="list in listDeparts" ng-value="{{list.id_departs}}">{{list.name_departs}}</option>
                                </select>
                            </div>
                            <div class="col-4">
                                <span class="font-weight-bold">Cấp Độ</span>
                                <select  ng-model="tempStaffs.rank_staff" ng-readonly="checkView"  class="form-control">
                                    <option ng-repeat="n in [10] | foreach" ng-value="{{n+1}}">{{n+1}}</option>>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <span class="font-weight-bold">Email</span>
                                <input  pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" required ng-model="tempStaffs.email" ng-readonly="checkView"type="text"  class="form-control" placeholder="Nhập Email">
                            </div>
                            <div class="col-4">
                                <span class="font-weight-bold">Điện thoại</span>
                                <input pattern="0[0-9s.-]{9,13}" required ng-model="tempStaffs.phone" ng-readonly="checkView"type="text" class="form-control" placeholder="Nhập Số Điện Thoại">
                            </div>
                        </div>
                        <div class="form-group">
                            <label >Ghi Chú</label>
                            <input  ng-model="tempStaffs.note" ng-readonly="checkView"type="text" class="form-control"  placeholder="Ghi Chú">
                        </div>
                    </form>
                    
                </div>
                <div class="modal-footer">
                    <div ng-show="checkAdd || checkEdit" class="float-left col-8">
                        <span class="text-danger">Chú ý: Phải điền đầy đủ các trường  </span><br>
                        <span  class="text-danger" >- Họ và tên không được rỗng</span><br>
                        <span  class="text-danger" >- Lương phải là một số</span><br>
                        <span class="text-danger" >- Mail đúng định dạng ..@gmail.com</span><br>
                        <span  class="text-danger" >- Số điện thoại phải từ 10-11 số bắt đầu bằng số 0</span>
                    </div>
                    <div class="float-right col-4  ">
                        <button type="submit" ng-disabled="formStaffs.$invalid"  ng-show="checkAdd" ng-click="addStaffs();" class="btn btn-primary">Thêm</button>
                        <button  type="submit" ng-disabled="formStaffs.$invalid" ng-show="checkEdit" ng-click="updateStaffs();" class="btn btn-primary">Cập Nhập</button>
                        <button  type="submit" ng-show="checkNote" ng-disabled="formRecords.$invalid" ng-click="noteStaffs();" class="btn btn-primary">Ghi Nhận</button>
                        <button type="button" class="btn btn-secondary" ng-click="boQua()" data-dismiss="modal">Bỏ Qua</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>