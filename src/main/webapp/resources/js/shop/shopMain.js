$(document).ready(function(){
   filter_cnt()
});
      
   //좌측 필터 + - 버튼 
      var filter_btn = $(".filter_btn");
      var filter_allSelect = $(".filter_allSelect");
      var filter_list_area = $(".filter_list_area");

      for(var i=0; i<4;i++){
         btn_filter(i);
      }
      
      function btn_filter(index){
         filter_btn.eq(index).on("click",function(){
            if(filter_btn.eq(index).val()=="open"){
               filter_list_area.eq(index).show();
               filter_btn.eq(index).text("-");
               filter_btn.eq(index).attr("value","close");
               filter_allSelect.eq(index).hide();
            }
            else{
               filter_list_area.eq(index).hide();
               filter_btn.eq(index).text("+");
               filter_btn.eq(index).attr("value","open");
               filter_allSelect.eq(index).show();
            }   
         });
      }
      
   //상품개수 
      
      
   //좌측 필터 초기화
   
      var reset = $(".reset")
      reset.on("click",function(){
         location.reload();
      });
   
   
   //   필터 개수 세기
      function filter_cnt(){
         var total_cnt = $('.f_div:checked').length;
         $("#total_cnt").text(total_cnt);
      }
		
	//상위 카테고리 클릭
      $(".item_top").on("click",function(){
         var plist_check = $(this).children(".filter_list_top");
         var childList = $(this).siblings(".filter_child_list");

         if(plist_check.is(":checked")==true) {
            childList.show();
           	childList.find(".f_div").prop('checked',false);
         }
         else {
            plist_check.prop('checked',false);
            childList.hide();
         }
         
		addList($(this));
		filterList();
      });
      
    //하위 카테고리 클릭
      $(".filter_child_list_in").on("click",function(){
		var clist_check = $(this).children(".f_div");
		var category = clist_check.prop('name');
		var child_list = $(this).parent('.filter_child_list');
		var item_top = child_list.siblings('.item_top');
		
         if(clist_check.is(":checked")==true) {
            $("#"+category).prop('checked',false);
         }
         else{
         	if($("."+category+':checked').length==0)$(this).closest(".filter_child_list").hide();
         };
         
		addList(item_top);
		addList($(this));
		filterList();
      });
      
      
      
      function addList(index) {
         var value;
         var name_div = index.children(".f_div");
         var check = 0;
         
         if(name_div.is(':checked')==true) {
            for(var i=0;i<=$(".teg_item").length;i++) {
               if(name_div.val()==$(".teg_item").eq(i).attr('name'))
                  check = 1;
            }
            
            if(check==0) {
            value = "<div class='teg_item' name='" + name_div.val() + "'><span>" + name_div.val()+"</span>";
            value += "<button class='teg_item_btn'>X</button></div>";
            $(".filter_teg_area").append(value);
            }
         }
         else {
            $("div[name="+name_div.val()+"]").detach();
         }
      }
   
	//클릭시 filter배열 추가	
		function filterList(){
			var teg = $(".teg_item");
			filter= [];
			
			for(var i =1;i<teg.length+1;i++){
				var f_div = $(".teg_item:nth-child("+i+")");
				var span = f_div.children('span').text();		
				filter.push(span);
			}
			alert(filter);
		}
		
   
   // 체크박스 옆 글자 클릭시
      
      $('.item').on('click',function(){
         
         var checkbox = $(this).siblings('.f_div');
         
         if(checkbox.is(':checked') == true){
            checkbox.prop("checked", false);
         }else{
            checkbox.prop("checked", true);
         }
      });
      
      
   //태그 div 버튼 클릭시 삭제 및 클릭 해제
      $(document).on('click','.teg_item_btn',function(){
         var name = $(this).parent('div').attr('name');
         $("input:checkbox[value='"+name+"']").prop("checked",false);
         $(this).parent('div').detach();
      });
      


//   //좌측 필터 성별
//      
//      var filter_gender = $(".filter_gender");
//      var item_gender = $(".item_gender");
//            
//      for(var i=0; i<filter_gender.length;i++){
//         gender_list_check(i);
//         item_gender_click(i);
//      }
//      
//      
//      function item_gender_click(index){
//         item_gender.eq(index).click(function(){
//            if(filter_gender.eq(index).is(':checked')){
//               filter_gender.eq(index).prop("checked", false).change();
//            }
//            else{
//               filter_gender.prop("checked",false).change();
//            }
//         });
//      }
//      
//      
//      function gender_list_check(index){
//         filter_gender.eq(index).change(function(){
//            if(this.checked){
//               $(".teg_gender").detach();
//               $(".teg_gender").prop("checked",false);
//               $(this).prop("checked",true);
//               $(".filter_teg_area").append("<div class='teg_item teg_gender' name='"+filter_gender.eq(index).val()+
//                     "'><span>"+filter_gender.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
//            }else{
//               $("div[name="+filter_gender.eq(index).val()+"]").detach();
//            
//            }
//         });
//      }
//      
   //좌측 필터 사이즈 
      
      var column_menu = $(".column_menu");
      
      for(var i=0; i<column_menu.length;i++){
         click_size(i);
      }
      
      function click_size(index){
         column_menu.eq(index).click(function(){
            
            $("div[name='teg_size']").detach();
            
            $(".filter_teg_area").append("<div class='teg_item' name='teg_size'><span>"+column_menu.eq(index).text()
                  +"</span><button class='teg_item_btn'>X</button></div>");
            
         });
      }

//   //좌측 필터 가격
//      var filter_price = $(".filter_price");
//      var item_price = $(".item_price");
//      
//      for(var i=0; i<filter_price.length;i++){
//         item_price_click(i);
//         filter_price_check(i);
//      }
//      
//      function item_price_click(index){
//         
//      item_price.eq(index).click(function(){
//            if(filter_price.eq(index).is(':checked')){
//               filter_price.eq(index).prop("checked", false).change();
//            }
//            else{
//               filter_price.eq(index).prop("checked", true).change();
//            }
//         });
//      }
//      
//      function filter_price_check(index){
//         filter_price.eq(index).change(function(){
//            if(this.checked){
//               $(".teg_price").detach();
//               $("input:checkbox[class='filter_price']").prop("checked",false);
//               $(this).prop("checked",true);
//               
//               $(".filter_teg_area").append("<div class='teg_item teg_price' name='"+filter_price.eq(index).val()+
//                     "'><span>"+filter_price.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
//            }else{
//               $("div[name="+filter_price.eq(index).val()+"]").detach();
//               
//            }
//         });
//      }

      //우측 필터버튼
      var list = $(".product_btn_list");
      function btn_list(){
         if ( list.css('display') === 'none'){
            list.show();
         }else{
            list.hide();
         }
      }

      //즐겨찾기 버튼
      var wish_btn = $(".wish_btn");
      var popup_wrap = $(".shopMain_popup_wrap");
      var popup_cancel = $(".popup_cancel");
      var status_item = $(".status_item_fb");
      
      popup_wrap.css('height',window.outerHeight);
      
      wish_btn.on("click",function(){
         popup_wrap.show();
      });
      
      popup_cancel.click(function(){
         popup_wrap.hide();
      });
      
      status_item.on("click",function(){
         popup_wrap.hide();
      });
      
      //리뷰 버튼
      
      