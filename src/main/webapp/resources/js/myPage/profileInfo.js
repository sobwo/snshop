var modify_btn = $(".modify_btn");
var modify_info = $(".profile_modify_info");
var info_status = $(".modify_info_status");
var cancel = $(".modify_btn_1");
var check = $(".modify_btn_2");

var modify_pw = $("#modify_pw");
var modify_pw2 = $("#modify_pw2");
var modify_name = $("#modify_name");
var modify_email = $("#modify_email");
var modify_phone = $("#modify_phone");

var pw_msg = $("#pw_msg");
var name_msg = $("#name_msg");
var email_msg = $("#email_msg");
var phone_msg = $("#phone_msg");


for(var i=0;i<5;i++)
	modify(i);


$("#man,#woman").on("click",function(){
	check.eq(4).css('background-color', '#222');
	check.eq(4).prop('disabled', false);
});


//변경버튼 클릭시 이벤트
function modify(index){
	modify_btn.eq(index).click(function(){
		modify_info.eq(index).show();
	});
	
	cancel.eq(index).click(function(){
		info_status.eq(index).val("");
		modify_info.eq(index).hide();
	});
	
	check.eq(index).click(function(){
		modify_info.eq(index).hide();
		//ajax
	});
}

modify_pw2.on("input",function(){
	if(modify_pw.val() != '' && modify_pw2.val() != ''){
		check.eq(0).css('background-color', '#222');
		check.eq(0).prop('disabled', false);
	}
	else{
		check.eq(0).css('background-color', '#ebebeb');
		check.eq(0).prop('disabled', true);
	}
});

modify_name.on("input",function(){
	if(modify_name.val() != '' && modify_name.val().length >=2 && modify_name.val().length <= 10){
		check.eq(1).css('background-color', '#222');
		check.eq(1).prop('disabled', false);
		modify_name.css('border-bottom','2px solid #222');
		name_msg.text("");
	}
	else{
		check.eq(1).css('background-color', '#ebebeb');
		check.eq(1).prop('disabled', true);
		modify_name.css('border-bottom','2px solid #f00');
		name_msg.text("이름은 2자 이상, 10자이하로 작성해주세요.");
	}
});

modify_email.on("input",function(){
	if(modify_email.val() != '' && modify_email.val().indexOf('@') != -1){
		check.eq(2).css('background-color', '#222');
		check.eq(2).prop('disabled', false);
		modify_email.css('border-bottom','2px solid #222');
		email_msg.text("");
	}
	else{
		check.eq(2).css('background-color', '#ebebeb');
		check.eq(2).prop('disabled', true);
		modify_email.css('border-bottom','2px solid #f00');
		email_msg.text("올바른 이메일 형식이 아닙니다. EX)snshop@naver.com");
	}
});

modify_phone.on("input",function(){
	if(modify_phone.val() != '' && !isNaN(modify_phone.val())){
		check.eq(3).css('background-color', '#222');
		check.eq(3).prop('disabled', false);
		modify_phone.css('border-bottom','2px solid #222');
		phone_msg.text("");
	}
	else{
		check.eq(3).css('background-color', '#ebebeb');
		check.eq(3).prop('disabled', true);
		modify_phone.css('border-bottom','2px solid #f00');
		phone_msg.text("숫자를 입력해주세요.");
	}
});

// 이미지 파일 필터링을 위한 함수
function imageFilter(input) {
// 선택한 파일 가져오기
	var file = input.files[0];
	// 파일의 확장자 가져오기
	var ext = file.name.split('.').pop().toLowerCase();
	// 확장자가 이미지 파일인지 확인
	if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
		alert("이미지 파일만 선택 가능합니다.");
		input.value = "";
	}
}