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

//memberJoin 로그인 버튼
joinBtn = $("#joinBtn");

joinBtn.click(function(){
	check();
});

function check(){
	var isYN;
	
	let memberPw = $("#memberPw").val();
	let memberPw2 = $("#memberPw2").val();
	let memberPhone = $("#memberPhone").val();
	
	$("#pw2Msg").text("");
	$("#phoneMsg").text("");
				
	if(memberPw!=memberPw2){
		$("#pw2Msg").text("비밀번호가 일치하지 않습니다."); 
		$("#memberPw2").focus();
		isYN = 0;
	}

	else if(isNaN(memberPhone)){
		$("#phoneMsg").text("숫자를 입력해주세요."); 
		$("#memberPhone").focus();
		isYN = 0;
	}
	else
		alert("등록완료");
// 	else IdCheck();
}

function IdCheck(){
	let memberId = $("#memberId").val();
	var isYN;
	$.ajax({
		url: "${pageContext.request.contextPath}/member/memberIdCheck.do",		
		method: "POST",
		data: {"memberId": memberId },
		dataType: "json",
		success : function(data){
				if (data.value == 1){
					$("#idMsg").text("중복된 ID 입니다.");
					$("#memberId").focus();
				}
				else{
					alert("회원가입 완료");	
					var fm = document.frm;
					fm.action ="${pageContext.request.contextPath}/member/memberJoinAction.do";
					fm.method = "post";
					fm.submit();
					fm.reset();
				}
			},
			error : function(request,status,error){
				alert("다시 시도하시기 바랍니다.");		
			}	
	});	
}
