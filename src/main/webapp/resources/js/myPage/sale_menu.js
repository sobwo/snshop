var tab = $(".tab_category");
var tab_count = $(".tab_count");
var tab_title = $(".tab_title");
var search_filter_btn = $('.search_filter');
var search_head = $('.search_head');
var status_item = $('.status_item');
var search_filter_txt = $(".search_filter_txt");
var popup_wrap;

$(document).ready(function(){
	search_head.css('justify-content','flex-end');
	search_filter_btn.hide(); // 전체 메뉴에서는 해당 버튼이 안보이게
});

//전체,진행중,종료 버튼 클릭시 기능
tab.eq(0).click(function() {
	setTab(0);
	search_filter_btn.hide(); // 전체 메뉴에서는 해당 버튼이 안보이게
	search_head.css('justify-content','flex-end'); // 그에 맞는 버튼 위치 조절
});

tab.eq(1).click(function() {
	setTab(1);  	
	search_filter_btn.show(); // 해당 버튼에서만 버튼 보이게
	search_head.css('justify-content','space-between');
	search_filter_txt.text("전체");
	popup(1);
	
});

tab.eq(2).click(function() {
	setTab(2);
	search_filter_btn.show(); // 전체 메뉴에서는 해당 버튼이 안보이게
	search_head.css('justify-content','space-between');
	search_filter_txt.text("전체");
	popup(2);
});

//팝업창 메뉴 클릭시 이벤트
status_item.on('click',function(){	
	var text = $(this).children('span').text();
	search_filter_txt.text(text);
	popup_wrap.hide();
});


//메뉴 클릭시 화면 버튼 스타일 변경
function setTab(index) {
	tab.css('border-bottom', '1px solid #d3d3d3');
	tab.eq(index).css('border-bottom', '2px solid #222');
	
	tab_count.css('color', '#222');
	tab_count.eq(index).css('color', '#f15746');
	
	tab_count.css('font-weight', 'normal');
	tab_count.eq(index).css('font-weight', 'bold');
	
	tab_title.css('font-weight', 'normal');
	tab_title.eq(index).css('font-weight', 'bold');
}

//팝업기능
function popup(index) {
	//각 메뉴에따른 팝업 버튼 내부 아이템 적용
	if(index==1)
		popup_wrap = $(".ing_popup");
	else if(index==2)
		popup_wrap = $(".sale_end_popup");
	
	var popup_cancel = $(".popup_cancel");
	
	popup_wrap.css('height',window.outerHeight); //현재 브라우저 높이 구해서 적용
	
	search_filter_btn.click(function(){
		popup_wrap.show();
	});
	popup_cancel.click(function(){
		popup_wrap.hide();
	});
}