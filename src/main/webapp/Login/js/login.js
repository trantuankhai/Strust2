function validateLogin(){
	if($('.user').val() == ''){
		alert('Bạn chưa nhập UserName');
		$('.user').focus()
		return false;
	}else if($('.Password').val() == '')
		{
		alert('Bạn chưa nhập PassWord');
		$('.Password').focus();
		return false;
		}else{
			return true;
		}
}