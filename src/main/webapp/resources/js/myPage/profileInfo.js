var modify_btn = $(".modify_btn");
var modify_info = $(".profile_modify_info");
var info_status = $(".modify_info_status");
var cancel = $(".modify_btn_1");
var check = $(".modify_btn_2");

for(var i=0;i<5;i++)
	modify(i);

$("#man,#woman").on("click",function(){
	check.eq(4).css('background-color', '#222');
	check.eq(4).prop('disabled', false);
});


//수정버튼 클릭시 이벤트
function modify(index){
	modify_btn.eq(index).click(function(){
		modify_info.eq(index).show();
	});
	
	info_status.eq(index).on("input",function(){
		if(info_status.eq(index).val() != ''){
			check.eq(index).css('background-color', '#222');
			check.eq(index).prop('disabled', false);
		}
		else {
			check.eq(index).css('background-color', '#ebebeb');
			check.eq(index).prop('disabled', true);
		}
	});
	
	cancel.eq(index).click(function(){
		modify_info.eq(index).hide();
	});
	
	check.eq(index).click(function(){
		modify_info.eq(index).hide();
		//ajax
	});
}