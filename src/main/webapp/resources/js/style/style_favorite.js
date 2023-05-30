
//팔로우버튼
var follow_button = $("#follow-button");

follow_button.on("click",function(){
//팔로우버튼 클릭시 db에서 그 해당사람이 팔로우인지 확인 후 색 변경
});

//팝업버튼
/*var comment_btn = $(".comment_btn");*/
var popup_wrap = $(".popup_wrap");
var cancel_popup = $(".cancel_popup");

popup_wrap.css('height',window.outerHeight);
/*
comment_btn.on("click",function(){
	popup_wrap.show();
});
*/
cancel_popup.click(function(){
	popup_wrap.hide();
});
/*
function comment_btn(id,content){
	popup_wrap.show();
	$(".user_id").text(id);
	${".content_top").text(content);
	
}
*/
function comment_btn(id, content) {
    popup_wrap.show();
    $(".user_id").text(id);
    $(".content_top").text(content);
}


//댓글쓸때 css변경
var comment = $(".comment_input");
var submit_comment = $(".submit_comment");
comment.on("input",function(){
if(comment.val()!=""){
	comment.css("width","212px");
	submit_comment.show();
}
else{
	comment.css("width","262px");
		submit_comment.hide();
	}
});

//답글쓰기
reply_comment_btn = $(".reply_comment_btn");
reply_comment_btn.on("click",function(){
comment.val("#"+$(this).parent('div').siblings('a').text());
});


/* 하트색상?*/


