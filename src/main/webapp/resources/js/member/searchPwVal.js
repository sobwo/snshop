$(document).ready(function(){});
			
$('#searchId, #searchPw, #searchPw2').on('input',function(){
	var inputId = $('#searchId').val();
	var inputPw = $('#searchPw').val();
	var inputPw2 = $('#searchPw2').val();

	if(inputId != '' && inputPw != '' && inputPw2 != ''){
		$('.searchBtn').prop('disabled', false);
		$('.searchBtn').css('background-color', '#222');
	}
	else{ 
		$('.searchBtn').css('background-color', '#ebebeb');
		$('.searchBtn').prop('disabled', true);
	}
});
