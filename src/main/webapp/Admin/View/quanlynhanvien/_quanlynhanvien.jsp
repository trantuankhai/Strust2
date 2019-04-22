<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div ng-controller="quanlynhanviencontroller">
	<div class="container-fluid">
		<div class="card-body">
			<div class="row add">
				<div class="col-3 form-inline ">
					<span class="font-weight-bold">Show: </span> <select
						ng-model="changeStaffs" ng-change="showChange();"
						class="form-control">
						<option ng-value="10">10</option>
						<option ng-value="20">20</option>
						<option ng-value="50">50</option>
						<option ng-value="100">100</option>
					</select>
				</div>
				<div class="col-3 form-inline ">
					<select class="form-control" ng-model="departs">
						<option value="">-- {{listLanguage.lblFilter}} --</option>
						<option ng-repeat="name in listDeparts.departs"
							value="{{name.id_departs}}">{{name.name_departs}}</option>
					</select>
				</div>
				<div class="col-3 form-inline ">
					<button ng-click="showAddStaffs();" class="btn" data-toggle="modal"
						data-target="#addNhanvien">{{listLanguage.lblAddStaffs}}</button>
				</div>
				<div class="col-3 form-inline">
					<input class="form-control" ng-model="seachName" type="text"
						placeholder="Nhập Tên Nhân Viên" ng-model="keySearch">
				</div>

			</div>
			<table id="example1"
				class="table table-bordered table-responsive-xl table-hover display">
				<thead>
					<tr>
						<th>{{listLanguage.lblCodeStaffs}}</th>
						<th>{{listLanguage.lblNameDeparts}}</th>
						<th>{{listLanguage.lblNameStaffs}}</th>
						<th>{{listLanguage.lblGenderStaffs}}</th>
						<th>{{listLanguage.lblPhoneStaffs}}</th>
						<th>Email</th>
						<th>{{listLanguage.lblDateOfBirthday}}</th>
						<th>{{listLanguage.lblNoteStaffs}}</th>
						<th>{{listLanguage.lblAction}}</th>
					</tr>
				</thead>
				<tbody>
					<tr
						ng-repeat="list in listStaffs.listStaffs | filter :{'name' : seachName} |filter: {'departs':{id_departs:departs}}">
						<td>NV{{list.id_staffs}}</td>
						<td>{{list.departs.name_departs}}</td>
						<td>{{list.name}}</td>
						<td ng-if="list.gender == 0">Nữ</td>
						<td ng-if="list.gender == 1">Nam</td>
						<td>{{list.phone}}</td>
						<td>{{list.email}}</td>
						<td>{{list.birthday}}</td>
						<td>{{list.note}}</td>
						<td>
							<button data-toggle="modal" data-target="#editNhanvien"
								ng-click="showEdit(list);"
								class="btn btn-outline-success btn-sm">
								<i class="fa fa-pencil" style="font-size: 20px; color: black"></i>
							</button>
							<button ng-click="showRemove(list.name , list.id_staffs);"
								class="btn btn-outline-success btn-sm" data-toggle="modal"
								data-target="#deleteNhanvien">
								<i class="fa fa-remove" style="font-size: 20px; color: red"></i>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!--start add popup  -->
	<div class="modal fade bd-example-modal-lg" id="addNhanvien"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="text-center">Thêm nhân viên</h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" name="formStaffs">
						<div class="row">
							<div class="col-8">
								<span class="font-weight-bold">Họ Và Tên:</span> <input
									name="namestaff" type="text" class="form-control"
									placeholder="FullName" ng-model="name_staff" required>
								<span
									ng-show="formStaffs.namestaff.$dirty && formStaffs.namestaff.$invalid"
									style="color: red; margin: 5px;"> Tên nhân viên không
									được rỗng </span>
							</div>
							<div class="col-4">
								<span class="font-weight-bold">Giới Tính:</span> <select
									class="form-control" name="gender" required ng-model="gender">
									<option ng-value="1">Nam</option>
									<option ng-value="0">Nữ</option>
								</select> <span
									ng-show="formStaffs.gender.$dirty && formStaffs.gender.$invalid"
									style="color: red; margin: 5px;"> Bạn chưa chọn giới
									tinh </span>

							</div>
						</div>
						<div class="row">
							<div class="col-6 ">
								<span class="font-weight-bold">Ngày Sinh:</span> <input
									pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}"
									required type="text" class="form-control" name="birthday"
									ng-model="birthday"> <span
									ng-show="formStaffs.birthday.$dirty && formStaffs.birthday.$error.required"
									style="color: red; margin: 5px;"> Bạn chưa nhập ngày
									sinh </span> <span
									ng-show="formStaffs.birthday.$dirty && formStaffs.birthday.$error.pattern"
									style="color: red; margin: 5px;"> Ngày sinh chưa đúng
									định dạng </span>

							</div>
							<div class="col-6">
								<span class="font-weight-bold">Phòng Ban</span> <select required
									class="form-control" name="id_departs" ng-model="id_departs">
									<option ng-repeat="name in listDeparts.departs"
										ng-value="{{name.id_departs}}">{{name.name_departs}}</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-8">
								<span class="font-weight-bold">Email</span> <input
									pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" required type="text"
									class="form-control" placeholder="Nhập Email" name="email"
									ng-model="email"> <span
									ng-show="formStaffs.email.$dirty && formStaffs.email.$error.required"
									style="color: red; margin: 5px;"> Bạn chưa nhập địa chỉ
									email</span> <span
									ng-show="formStaffs.email.$dirty && formStaffs.email.$error.pattern"
									style="color: red; margin: 5px;"> Email chưa đúng định
									dạng </span>
							</div>
							<div class="col-4">
								<span class="font-weight-bold">Điện thoại</span> <input
									pattern="0[0-9s.-]{9,13}" required type="text"
									class="form-control" placeholder="Nhập Số Điện Thoại"
									name="phone" ng-model="phone"> <span
									ng-show="formStaffs.phone.$dirty && formStaffs.phone.$error.required"
									style="color: red; margin: 5px;"> Bạn chưa nhập số điện
									thoại</span> <span
									ng-show="formStaffs.phone.$dirty && formStaffs.phone.$error.pattern"
									style="color: red; margin: 5px;"> Số điện thoại chưa
									đúng định dạng </span>
							</div>
						</div>
						<div class="form-group">
							<label>Ghi Chú</label> <input type="text" class="form-control"
								placeholder="Ghi Chú" name="note" ng-model="note">
						</div>
				</div>
				<div class="modal-footer">
					<div class="float-left col-8">
						<span class="text-danger">Chú ý: Phải điền đầy đủ các
							trường </span><br> <span class="text-danger">- Họ và tên
							không được rỗng</span><br> <span class="text-danger">- Ngày
							sinh đúng định dạng</span><br> <span class="text-danger">-
							Mail đúng định dạng ..@gmail.com</span><br> <span
							class="text-danger">- Số điện thoại phải từ 10-11 số bắt
							đầu bằng số 0</span>
					</div>
					<div class="float-right col-4  ">
						<button type="button" class="btn btn-primary"
							ng-click="addNhanVien();" ng-disabled="formStaffs.$invalid">Thêm</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Bỏ Qua</button>
					</div>

				</div>
				</form>
			</div>
		</div>
	</div>
	<!--end add popup  -->
	<!-- START POPUP EDIT STAFFS -->
	<div class="modal fade bd-example-modal-lg" id="editNhanvien"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3>Cập nhập thông tin nhân viên</h3>
					<button type="button" class="close" ng-click="boQua()"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" name="formEditStaff">
						<div class="row">
							<div class="col-8">
								<span class="font-weight-bold">Họ Và Tên:</span> <input
									name="namestaff" required type="text" class="form-control"
									placeholder="FullName" ng-model="listStaffsTemp.name_staffs">
								<span
									ng-show="formEditStaff.namestaff.$dirty && formEditStaff.namestaff.$invalid"
									style="color: red; margin: 5px;"> Tên nhân viên không
									được rỗng </span>
							</div>
							<div class="col-4">
								<span class="font-weight-bold">Giới Tính:</span> <select
									class="form-control" name="gender"
									ng-model="listStaffsTemp.gender_staffs" required>
									<option ng-value="1">Nam</option>
									<option ng-value="0">Nữ</option>
								</select> <span
									ng-show="formEditStaff.gender.$dirty && formEditStaff.gender.$error.required"
									style="color: red; margin: 5px;"> Bạn chưa chọn giới
									tính </span>

							</div>
						</div>
						<div class="row">
							<div class="col-6 ">
								<span class="font-weight-bold">Ngày Sinh:</span> <input
									pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}"
									required type="text" class="form-control" name="birthday"
									ng-model="listStaffsTemp.birthday_staffs"> <span
									ng-show="formEditStaff.birthday.$dirty && formEditStaff.birthday.$error.required"
									style="color: red; margin: 5px;"> Bạn chưa nhập ngày
									sinh </span> <span
									ng-show="formEditStaff.birthday.$dirty && formEditStaff.birthday.$error.pattern"
									style="color: red; margin: 5px;"> Ngày sinh chưa đúng
									định dạng </span>


							</div>
							<div class="col-6">
								<span class="font-weight-bold">Phòng Ban</span> <select required
									class="form-control" name="id_departs"
									ng-model="listStaffsTemp.id_departs">
									<option ng-repeat="name in listDeparts.departs"
										ng-value="{{name.id_departs}}">{{name.name_departs}}</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-8">
								<span class="font-weight-bold">Email</span> <input type="text"
									class="form-control" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
									placeholder="Nhập Email" name="email"
									ng-model="listStaffsTemp.email_staffs" required> <span
									ng-show="formEditStaff.email.$dirty && formEditStaff.email.$error.required"
									style="color: red; margin: 5px;"> Bạn chưa nhập địa chỉ
									email</span> <span
									ng-show="formEditStaff.email.$dirty && formEditStaff.email.$error.pattern"
									style="color: red; margin: 5px;"> Email chưa đúng định
									dạng </span>
							</div>
							<div class="col-4">
								<span class="font-weight-bold">Điện thoại</span> <input
									pattern="0[0-9s.-]{9,13}" required type="text"
									class="form-control" placeholder="Nhập Số Điện Thoại"
									name="phone" ng-model="listStaffsTemp.phone_staffs"> <span
									ng-show="formEditStaff.phone.$dirty && formEditStaff.phone.$error.required"
									style="color: red; margin: 5px;"> Bạn chưa nhập số điện
									thoại</span> <span
									ng-show="formEditStaff.phone.$dirty && formEditStaff.phone.$error.pattern"
									style="color: red; margin: 5px;"> Số điện thoại chưa
									đúng định dạng </span>
							</div>
						</div>
						<div class="form-group">
							<label>Ghi Chú</label> <input type="text" class="form-control"
								placeholder="Ghi Chú" name="note"
								ng-model="listStaffsTemp.note_staffs">
						</div>
				</div>
				<div class="modal-footer">
					<div ng-show="checkAdd || checkEdit" class="float-left col-8">
						<span class="text-danger">Chú ý: Phải điền đầy đủ các
							trường </span><br> <span class="text-danger">- Họ và tên
							không được rỗng</span><br> <span class="text-danger">- Lương
							phải là một số</span><br> <span class="text-danger">- Mail
							đúng định dạng ..@gmail.com</span><br> <span class="text-danger">-
							Số điện thoại phải từ 10-11 số bắt đầu bằng số 0</span>
					</div>
					<div class="float-right col-4  ">
						<button type="button" class="btn btn-primary" ng-click=editStaff()
							ng-disabled="formEditStaff.$invalid">Cập Nhập</button>
						<button type="button" class="btn btn-secondary" ng-click="boQua()"
							data-dismiss="modal">Bỏ Qua</button>
					</div>

				</div>
				</form>
			</div>
		</div>
	</div>
	<!-- END POPUP EDIT STAFFS -->

	<!-- Modal -->
	<div class="modal fade" id="deleteNhanvien" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Xóa nhân
						viên</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<span class="font-weight-bold">Bạn có muốn xóa nhân viên
						{{name_staff}}</span> <input type="hidden" class="form-control" name="id"
						ng-model="id_staff">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						ng-click="removeStaff()">Đồng ý</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy bỏ</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END POPUP DELETE STAFFS -->
</div>