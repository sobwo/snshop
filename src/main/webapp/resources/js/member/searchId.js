var memberCodeBtn = $("#memberCodeBtn");

$(document).ready(function(){
	$('.searchPhone').hide();
	$('.searchEmail').hide();
	$("input:radio[name=searchMeasure]").click(function(){
		if($("input[name=searchMeasure]:checked").val() == "phone"){
			$('.searchEmail').hide();
			$('.searchPhone').show();
			$('.searchPhone_area').css('height','250px');
			$('.searchEmail_area').css('height','150px');
		}
		else if($("input[name=searchMeasure]:checked").val() == "email"){
			$('.searchEmail').show();
			$('.searchPhone').hide();
			$('.searchPhone_area').css('height','150px');
			$('.searchEmail_area').css('height','250px');
		}
	});
});

$('#memberName_phone, #memberPhone, #memberName_email, #memberEmail').on('input',function(){
	var inputName_phone = $('#memberName_phone').val();
	var inputName_email = $('#memberName_email').val();
	var inputPhone = $('#memberPhone').val();
	var inputEmail = $('#memberEmail').val();

	if((inputName_phone != '' && inputPhone != '') || (inputName_email != '' && inputEmail != '' && memberCodeBtn.val() == 'yes')){
		$('.searchBtn').prop('disabled', false);
		$('.searchBtn').css('background-color', '#222');
	}
	else{ 
		$('.searchBtn').css('background-color', '#ebebeb');
		$('.searchBtn').prop('disabled', true);
	}
});


