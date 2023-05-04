
$(document).ready(function(){});

$('#memberId,#memberPw').on('input',function(){
	var inputId = $('#memberId').val();
	var inputPw = $('#memberPw').val();

	if(inputId != '' && inputPw != ''){ 
		$('#loginBtn').css('background-color', '#222');
		$('#loginBtn').prop('disabled', false);
	}
	else {
		$('#loginBtn').css('background-color', '#ebebeb');
		$('#loginBtn').prop('disabled', true);
	}
});

function login(){
	alert("로그인");
}