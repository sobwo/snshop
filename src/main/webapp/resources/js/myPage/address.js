var plusBtn = $(".plus_address");
var popup_wrap = $(".basic_popup_wrap");
var cancel = $(".popup_cancel");
var cancel_bottom = $(".basic_btn_1");

//팝업창
popup_wrap.css('height',window.outerHeight);

plusBtn.eq(0).click(function(){
	popup_wrap.show();
});

cancel.click(function(){
	popup_wrap.hide();
});

cancel_bottom.click(function(){
	popup_wrap.hide();
});

//유효성검사
var basic_name = $("#basic_name");
var basic_phone = $("#basic_phone");
var basic_AddrNum = $("#basic_AddrNum");
var basic_Addr = $("#basic_Addr");
var basic_AddrDetail = $("#basic_AddrDetail");

basic_name.on("input",function(){
	if(basic_name.val()=='' || basic_name.val().length<3 || basic_name.val().length>10) {
		basic_name.css('border-bottom','2px solid #f00');
		basic_msg.eq(0).show();
	}
	else {
		basic_name.css('border-bottom','2px solid #222');
		basic_msg.eq(0).hide();
	}
});

basic_phone.on("input",function(){
	if(basic_phone.val()=='' || isNaN(basic_phone.val())) {
		basic_phone.css('border-bottom','2px solid #f00');
		basic_msg.eq(1).show();
	}
	else {
		basic_phone.css('border-bottom','2px solid #222');
		basic_msg.eq(1).hide();
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



		