$(document).ready(function(){
	var today = new Date();
	today = today.toISOString().slice(0, 10);
	$(".calander").eq(1).val(today);
	monthAgo(2);
	
	var month = $(".month_link");
	
	month.eq(0).click(function(){
	    monthAgo(2);
	});
	
	month.eq(1).click(function(){
	    monthAgo(4);
	});
	
	month.eq(2).click(function(){
	    monthAgo(6);
	});
	
	function monthAgo(value){
		var monthCal = new Date(today); // today를 Date 객체로 변환
	    monthCal.setMonth(monthCal.getMonth() - value); // 월 계산
	    monthCal = monthCal.toISOString().slice(0, 10);
	    $(".calander").eq(0).val(monthCal);
	}
});