
			
			//팝업버튼
			/*var comment_btn = $(".comment_btn");*/
			var popup_wrap = $(".popup_wrap");
			var cancel_popup = $(".cancel_popup");
			
			popup_wrap.css('height',window.outerHeight);
			
			cancel_popup.click(function(){
				popup_wrap.hide();
			});
			
			
			
			//답글쓰기
			reply_comment_btn = $(".reply_comment_btn");
			reply_comment_btn.on("click",function(){
			comment.val("#"+$(this).parent('div').siblings('a').text());
			});
			
			
			
			function togglePopup() {
				var popup = document.getElementById("popup");
				if (popup.style.display === "block") {
					popup.style.display = "none";
				} else {
					popup.style.display = "block";
				}
			}
