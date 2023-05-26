$(document).ready(function(){});

//사이즈버튼
var sizePick_btn = $(".sizePick_btn");
var popup_cancel = $(".popup_cancel");
var popup_wrap_1 = $(".shopContent_popup_wrap");
var status_item_s = $(".status_item_s");
var size_view = $(".size_view");
var price_view = $(".price_view");

popup_wrap_1.css('height',window.outerHeight);

sizePick_btn.click(function(){
	popup_wrap_1.show();
});

status_item_s.on("click",function(){
	size_view.text($(this).find('span.item_size_s').text());
	popup_wrap_1.hide();
});

//즐겨찾기 버튼
var wish = $(".wish");
var popup_wrap_2 = $(".shopMain_popup_wrap");
var status_item_fb = $(".status_item_fb");
var size_view_fb = $(".size_view_fb");
var price_view_fb = $(".price_view_fb");

popup_wrap_2.css('height',window.outerHeight);

wish.click(function(){
	popup_wrap_2.show();
});

//공통
popup_cancel.click(function(){
	popup_wrap_1.hide();
	popup_wrap_2.hide();
	
});
			