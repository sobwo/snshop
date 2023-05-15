var plusBtn = $(".plus_address");
var popup_wrap = $(".basic_popup_wrap");
var cancel = $(".popup_cancel");
var cancel_bottom = $(".basic_btn_1");
var submit_button = $(".basic_btn_2");


var basic_name = $("#basic_name");
var basic_phone = $("#basic_phone");
var basic_AddrNum = $("#basic_AddrNum");
var basic_Addr = $("#basic_Addr");
var basic_AddrDetail = $("#basic_AddrDetail");

//팝업창
popup_wrap.css('height',window.outerHeight);

plusBtn.eq(0).click(function(){
	submit_button.val("2");
	popup_wrap.show();
	basic_AddrNum.val("");
	basic_AddrNum.css('border-bottom','1px solid #ebebeb');
	basic_Addr.val("");
	basic_Addr.css('border-bottom','1px solid #ebebeb');
	changeCss();
});

cancel.click(function(){
	popup_wrap.hide();
});

cancel_bottom.click(function(){
	popup_wrap.hide();
});

//유효성검사
basic_name.on("input",function(){
	if(basic_name.val()=='' || basic_name.val().length<3 || basic_name.val().length>10) {
		basic_name.css('border-bottom','2px solid #f00');
		$("#name_msg").show();
	}
	else {
		basic_name.css('border-bottom','2px solid #222');
		$("#name_msg").hide();
	}
});

basic_phone.on("input",function(){
	if(basic_phone.val()=='' || isNaN(basic_phone.val())) {
		basic_phone.css('border-bottom','2px solid #f00');
		$("#phone_msg").show();
	}
	else {
		basic_phone.css('border-bottom','2px solid #222');
		$("#phone_msg").hide();
	}
});

(basic_name,basic_phone,basic_AddrNum,basic_Addr,basic_AddrDetail).on("input",function(){
	if(basic_name.val()!='' && basic_phone.val()!='' && basic_AddrNum.val() != '' &&
			basic_Addr.val() != '' && basic_AddrDetail.val() != '') {
		$('.basic_btn_2').eq(0).css('background-color', '#222');
		$('.basic_btn_2').eq(0).prop('disabled', false);
	}
	else {
		$('.basic_btn_2').eq(0).css('background-color', '#ebebeb');
		$('.basic_btn_2').eq(0).prop('disabled', true);
	}
});

$("#basic_AddrNum").click(function(){
    new daum.Postcode({
        oncomplete: function(data) { //선택시 입력값 세팅
        	$("#basic_AddrNum").val(data.zonecode); //우편번호
            $("#basic_Addr").val(data.address) // 주소 넣기
           	$("#basic_AddrDetail").focus(); //상세입력 포커싱
        }
    }).open();
});

function changeCss() {
	basic_name.val("");
	basic_name.css('border-bottom','1px solid #ebebeb');
	$("#name_msg").hide();
	basic_phone.val("");
	basic_phone.css('border-bottom','1px solid #ebebeb');
	$("#phone_msg").hide();
	basic_AddrDetail.val("");
	basic_AddrDetail.css('border-bottom','1px solid #ebebeb');
	$('.basic_btn_2').eq(0).css('background-color', '#ebebeb');
	$('.basic_btn_2').eq(0).prop('disabled', true);
}

		