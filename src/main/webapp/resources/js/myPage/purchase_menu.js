//팝업기능
function popup(index) {
	//각 메뉴에따른 팝업 버튼 내부 아이템 적용
	if(index==1)
		popup_wrap = $(".ing_popup");
	else if(index==2)
		popup_wrap = $(".end_popup");
	
	var popup_cancel = $(".popup_cancel");
	
	popup_wrap.css('height',window.outerHeight); //현재 브라우저 높이 구해서 적용
	
	search_filter_btn.click(function(){
		popup_wrap.show();
	});
	popup_cancel.click(function(){
		popup_wrap.hide();
		
	});
	
}

var popup_cancel_history = $(".popup_cancel_history");
$(".history_wrap").css('height',window.outerHeight);

popup_cancel_history.click(function(){
	$(".history_wrap").hide();
});