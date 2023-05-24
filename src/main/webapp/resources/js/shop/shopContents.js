$(document).ready(function(){});
			
			
//사이즈버튼
	var sizePick_btn = $(".sizePick_btn");
	var popup_cancel = $(".popup_cancel");
	var popup_wrap = $(".shopContent_popup_wrap");
	var status_item_s = $(".status_item_s");
	var size_view = $(".size_view");
	var price_view = $(".price_view");

popup_wrap.css('height',window.outerHeight);

sizePick_btn.click(function(){
	popup_wrap.show();
});

status_item_s.on("click",function(){
	size_view.text($(this).find('span.item_size_s').text());
//	price_view.text($(this).find('span.item_price_s').text());
	popup_wrap.hide();
});

//공통
popup_cancel.click(function(){
	popup_wrap.hide();
	popup_wrap_2.hide();
	
});
			