var tab = $(".tab_category");
var tab_count = $(".tab_count");
var tab_title = $(".tab_title");
var search_filter_btn = $('.search_filter');
var search_head = $('.search_head');
var status_item = $('.status_item');
var search_filter_txt = $(".search_filter_txt");

var purchaseItemIng = $(".purchaseItemIng");
var purchaseItemEnd = $(".purchaseItemEnd");
var saleItemEnd = $(".saleItemEnd");
var price_filter = $(".price_filter");

var purchase_index = $(".purchase_index");
var price_filter_index = $(".price_filter_index");

var btn_search = $(".btn_search");

var popup_wrap;

$(document).ready(function() {
    // URL에서 value 파라미터 추출
    var value = purchase_index.val();
    
    if (value==0){
    	setTab(0);
		search_filter_btn.hide(); // 전체 메뉴에서는 해당 버튼이 안보이게
		search_head.css('justify-content','flex-end'); // 그에 맞는 버튼 위치 조절
    }
    
    // value 값에 따라서 동작하는 코드 작성
    if (value == 1) {
        setTab(1);
        search_filter_btn.show(); // 해당 버튼에서만 버튼 보이게
        search_head.css('justify-content','space-between');
        popup(1);
    }
    
    if (value == 2){
		setTab(2);
		search_filter_btn.show(); // 전체 메뉴에서는 해당 버튼이 안보이게
		search_head.css('justify-content','space-between');
		popup(2);
    }
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
