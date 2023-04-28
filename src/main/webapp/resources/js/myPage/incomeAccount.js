var ar_bankName = $("#ar_bankName");
var ar_accountNum = $("#ar_accountNum");
var ar_name = $("#ar_name");
var ar_msg = $(".ar_msg");


(ar_bankName, ar_accountNum, ar_name).on("input",function(){
	if(ar_bankName.val()!='' && ar_accountNum.val()!='' && ar_name.val() != ''
			&& isNaN(ar_accountNum.val()) == false){
		$('.ar_btn').eq(0).css('background-color', '#222');
		$('.ar_btn').eq(0).prop('disabled', false);
	}
	else {
		$('.ar_btn').eq(0).css('background-color', '#ebebeb');
		$('.ar_btn').eq(0).prop('disabled', true);
	}
	
	if(isNaN(ar_accountNum.val())==true)
		ar_msg.eq(0).show();
	else
		ar_msg.eq(0).hide();
});