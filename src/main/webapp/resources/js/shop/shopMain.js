$(document).ready(function(){});
		
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
		
	//좌측 필터 초기화
	
		var reset = $(".reset")
		reset.on("click",function(){
			location.reload();
		});
	
		
	//좌측 필터(카테고리) 체크 버튼 클릭시 태그 div 생성 삭제
		
		var list_top = $(".filter_list_top");
		var filter_child_list = $(".filter_child_list");
		var list_bottom = $(".filter_list_bottom");
		var item =$(".item");
		var item_child =$(".item_child");

		for(var i=0; i<list_top.length;i++){
			list_top_check(i);
			item_click(i);
		}
		for(var i=0; i<list_bottom.length;i++){
			list_bottom_check(i);
			item_child_click(i);
		}
		
		
		function item_click(index){
			item.eq(index).click(function(){
				if(list_top.eq(index).is(':checked')){
					list_top.eq(index).prop("checked", false);
					$("div[name="+list_top.eq(index).val()+"]").detach();
					filter_child_list.eq(index).hide();
				}
				else{
					list_top.eq(index).prop("checked", true);
					filter_child_list.eq(index).show();
					list_bottom.prop("checked",false);
					$(".teg_child").detach();
		 			if($(".filter_teg_area").text().indexOf(list_top.eq(index).attr('name')) == -1)
					$(".filter_teg_area").append("<div class='teg_item teg_parent' name='"+list_top.eq(index).val()+
							"'><span>"+list_top.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}
			});
		}
		
		function list_top_check(index){
			list_top.eq(index).on("change",function(){
				
				if(this.checked){
					filter_child_list.eq(index).show();
					list_bottom.prop("checked",false);
					$(".teg_child").detach();
					$(".filter_teg_area").append("<div class='teg_item teg_parent' name='"+list_top.eq(index).val()+
							"'><span>"+list_top.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}else{
					$("div[name="+list_top.eq(index).val()+"]").detach();
					filter_child_list.eq(index).hide();
				}
			});
		}
		
		function item_child_click(index){
			
			item_child.eq(index).click(function(){
				if(list_bottom.eq(index).is(':checked')){
					list_bottom.eq(index).prop("checked", false);
					$("div[name="+list_bottom.eq(index).val()+"]").detach();
				}
				else{
					list_bottom.eq(index).prop("checked", true);
					list_top.prop("checked",false);
					$(".teg_parent").detach();
					$(".filter_teg_area").append("<div class='teg_item teg_child' name='"+list_bottom.eq(index).val()+
							"'><span>"+list_bottom.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}
			});
		}
		function list_bottom_check(index){
			list_bottom.eq(index).change(function(){
				if(this.checked){
					
					if(list_top.prop("checked",true))list_top.prop("checked",false);
					
					$(".teg_parent").detach();
					$(".filter_teg_area").append("<div class='teg_item teg_child' name='"+list_bottom.eq(index).val()+
							"'><span>"+list_bottom.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}else{
					$("div[name="+list_bottom.eq(index).val()+"]").detach();
					
				}
			});
		}
		
	//좌측 필터 성별
		
		var filter_gender = $(".filter_gender");
		var item_gender = $(".item_gender");
				
		for(var i=0; i<filter_gender.length;i++){
			gender_list_check(i);
			item_gender_click(i);
		}
		
		
		function item_gender_click(index){
			item_gender.eq(index).click(function(){
				if(filter_gender.eq(index).is(':checked')){
					filter_gender.eq(index).prop("checked", false);
					$("div[name="+filter_gender.eq(index).val()+"]").detach();
				}
				else{
					filter_gender.prop("checked",false);
					filter_gender.eq(index).prop("checked", true);
		 			$(".teg_gender").detach();
		 			$(".filter_teg_area").append("<div class='teg_item teg_gender' name='"+filter_gender.eq(index).val()+
						"'><span>"+filter_gender.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}
			});
		}
		
		
		function gender_list_check(index){
			filter_gender.eq(index).change(function(){
				if(this.checked){
					$(".teg_gender").detach();
					$("input:checkbox[class='filter_gender']").prop("checked",false);
					$(this).prop("checked",true);
					$(".filter_teg_area").append("<div class='teg_item teg_gender' name='"+filter_gender.eq(index).val()+
							"'><span>"+filter_gender.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}else{
					$("div[name="+filter_gender.eq(index).val()+"]").detach();
					
				}
			});
		}
		
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
	//좌측 필터 혜택
		var filter_benefit = $(".filter_benefit");
		var item_benefit =$(".item_benefit");

		for(var i=0; i<filter_benefit.length;i++){
			filter_benefit_check(i);
			item_benefit_click(i);
		}
		
		function item_benefit_click(index){
			item_benefit.eq(index).click(function(){
				if(filter_benefit.eq(index).is(':checked')){
					filter_benefit.eq(index).prop("checked", false);
					$("div[name="+filter_benefit.eq(index).val()+"]").detach();
				}
				else{
					filter_benefit.eq(index).prop("checked", true);
					$(".filter_teg_area").append("<div class='teg_item teg_benefit' name='"+filter_benefit.eq(index).val()+
							"'><span>"+filter_benefit.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}
			});
		}
		
		function filter_benefit_check(index){
			filter_benefit.eq(index).change(function(){
				if(this.checked){
					
					$(".filter_teg_area").append("<div class='teg_item teg_benefit' name='"+filter_benefit.eq(index).val()+
							"'><span>"+filter_benefit.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}else{
					$("div[name="+filter_benefit.eq(index).val()+"]").detach();
					
				}
			});
		}
	//좌측 필터 가격
		var filter_price = $(".filter_price");
		var item_price = $(".item_price");
		
		for(var i=0; i<filter_price.length;i++){
			item_price_click(i);
			filter_price_check(i);
		}
		
		function item_price_click(index){
			item_price.eq(index).click(function(){
				if(filter_price.eq(index).is(':checked')){
					filter_price.eq(index).prop("checked", false);
					$("div[name="+filter_price.eq(index).val()+"]").detach();
				}
				else{
					filter_price.prop("checked",false);
					filter_price.eq(index).prop("checked", true);
		 			$(".teg_price").detach();
					$(".filter_teg_area").append("<div class='teg_item teg_price' name='"+filter_price.eq(index).val()+
							"'><span>"+filter_price.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}
			});
		}
		
		function filter_price_check(index){
			filter_price.eq(index).change(function(){
				if(this.checked){
					
					$(".teg_price").detach();
					$("input:checkbox[class='filter_price']").prop("checked",false);
					$(this).prop("checked",true);

					
					$(".filter_teg_area").append("<div class='teg_item teg_price' name='"+filter_price.eq(index).val()+
							"'><span>"+filter_price.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
				}else{
					$("div[name="+filter_price.eq(index).val()+"]").detach();
					
				}
			});
		}

	//태그 div 버튼 클릭시 삭제 및 클릭 해제
		$(document).on('click','.teg_item_btn',function(){
			var name = $(this).parent('div').attr('name');
			$("input:checkbox[name='"+name+"']").prop("checked",false);
			$(this).parent('div').detach();
			$("#"+name).css('display','none');

		});
		

		
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
		
		