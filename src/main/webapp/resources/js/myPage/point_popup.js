var register = $("#register");
var popup_wrap = $("#point_popup_wrap");

var cancel = $(".popup_cancel");
var cancel_bottom = $(".basic_btn_1");

var admin_register = $("#admin_register");
var admin_popup_wrap = $("#admin_point_popup_wrap")

//관리자 팝업창
admin_popup_wrap.css('height',window.outerHeight);

admin_register.click(function(){
	admin_popup_wrap.show();
});


//팝업창
popup_wrap.css('height',window.outerHeight);

register.click(function(){
	popup_wrap.show();
});

cancel.click(function(){
	popup_wrap.hide();
});

cancel_bottom.click(function(){
	popup_wrap.hide();
});

//유효성검사
var coupon = $("#coupon");

coupon.on("input",function(){
	if(coupon.val()!='') {
		$('.basic_btn_2').eq(0).css('background-color', '#222');
		$('.basic_btn_2').eq(0).prop('disabled', false);
	}
	else {
		$('.basic_btn_2').eq(0).css('background-color', '#ebebeb');
		$('.basic_btn_2').eq(0).prop('disabled', true);
	}
});


		