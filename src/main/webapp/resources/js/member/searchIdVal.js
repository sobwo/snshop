$(document).ready(function(){});
			
$('input[name=searchId]').on('click',function(){
	
	if($('#searchId').is(':checked')){
		$('.searchBtn').prop('disabled', false);
		$('.searchBtn').css('background-color', '#222');
	}
	else{ 
		$('.searchBtn').css('background-color', '#ebebeb');
		$('.searchBtn').prop('disabled', true);
	}
});
