

$(document).ready(function(){
	$('.searchPhone').hide();
	$('.searchEmail').hide();
	$("input:radio[name=searchMeasure]").click(function(){
		if($("input[name=searchMeasure]:checked").val() == "phone"){
			$('.searchEmail').hide();
			$('.searchPhone').show();
			$('.searchPhone_area').css('height','300px');
			$('.searchEmail_area').css('height','150px');
		}
		else if($("input[name=searchMeasure]:checked").val() == "email"){
			$('.searchEmail').show();
			$('.searchPhone').hide();
			$('.searchPhone_area').css('height','150px');
			$('.searchEmail_area').css('height','300px');
			}
		});
});
	
function btnCheck() {
	if($("#memberCodeBtn_phone").val() == 'yes' || $("#memberCodeBtn").val() == 'yes'){
		$('.searchBtn').prop('disabled', false);
		$('.searchBtn').css('background-color', '#222');
	}
	else{ 
		$('.searchBtn').css('background-color', '#ebebeb');
		$('.searchBtn').prop('disabled', true);
	}
}
	
