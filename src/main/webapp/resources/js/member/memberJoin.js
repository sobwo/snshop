$(document).ready(function(){});

$('#memberId, #memberPw, #memberPw2, #memberName, #memberPhone, #memberEmail').on('input',function(){
	var inputId = $('#memberId').val();
	var inputPw = $('#memberPw').val();
	var inputPw2 = $('#memberPw2').val();
	var inputName = $('#memberName').val();
	var inputPhone = $('#memberPhone').val();
	var inputEmail = $('#memberEmail').val();

	if((inputId != '') && (inputPw != '') && (inputPw2 != '') && (inputName != '') && (inputPhone != '') && (inputEmail != '')){
		$('#joinBtn').prop('disabled', false);
		$('#joinBtn').css('background-color', '#222');
	}
	else{ 
		$('#joinBtn').css('background-color', '#ebebeb');
		$('#joinBtn').prop('disabled', true);
	}
});

joinBtn = $("#joinBtn");

joinBtn.click(function(){
	check();
});


function check(){
	let memberPw = $("#memberPw").val();
	let memberPw2 = $("#memberPw2").val();
	let memberPhone = $("#memberPhone").val();
	let memberEmail = $("#memberEmail").val();
	
	$("#pw2Msg").text("");
	$("#phoneMsg").text("");
				
	if(memberPw!=memberPw2){
		$("#pw2Msg").text("비밀번호가 일치하지 않습니다."); 
		$("#memberPw2").focus();
	}
	
	if(memberEmail.indexOf('@') == -1) {
		$("#emailMsg").text("올바른 형식으로 작성해주세요.");
		$("#memberEmail").focus();
	}

	else if(isNaN(memberPhone)){
		$("#phoneMsg").text("숫자를 입력해주세요."); 
		$("#memberPhone").focus();
	}

	else IdCheck();

}

