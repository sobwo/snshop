<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>home</title>
		<style>
        .content_wrap{
        	width:1902px;
        	padding-top:131px;
        }

		.content_inner_wrap{
			width:1200px;
			margin:0 auto;
			padding:0 40px;
		}
		
        .content_area{
        	width:640px;
        	margin:0 auto;
        	padding-top:50px;
        }
        
        .content{
        	width:100%;
        	padding-bottom:40px;
        }
        
        .header_container{
        	width:100%;
        	height:44px;
        	display:flex;
        	justify-content:space-between;
        }
        
        .user_profile{
        	height:100%;
        	display:flex;
        }
        
        .user_img{
        	width:44px;
        	height:44px;
        }
        
        .user_id_wrap{
        	padding-left:10px;
        }
        
        .user_id{
        	font-size:16px;
        	font-weight:bold;
        }
        
        .write_date{
        	font-size:14px;
        	color:rgba(34,34,34,.5);
        }
        
        .button_wrap{
        	height:100%;
        	display:flex;
        	justify-content:center;
        	align-items:center;
        }
        
        .follow-button{
        	width:100px;
        	height:30px;
        	background:#fff;
        	border:1px solid #ebebeb;
        	border-radius:12px;
        	cursor:pointer;
        }
        
        .content_img_wrap{
        	width:100%;
        	height:640px;
        }
        
        .content_img{
        	width:100%;
        	height:100%;
        }
        
        .social_product{
        	width:100%;
        }
        
        .product_title{
        	width:100%;
        	height:24px;
        	padding:12px 0 8px 0;
        }
        
        .product_title span{
        	font-size:15px;
        }
        
        .product_list_area{
        	width:100%;
        }
        
        .product_list{
        	width:112px;
        }
        
        .product{
        	width:112px;
        }
        
        .product_img{
        	width:112px;
        	height:112px;
        }
        
        .product_name{
        	width:100%;
        	height:32px;
        	padding-top:6px;
        	font-size:15px;
        	overflow:hidden;
        }
        
        .product_price{
        	width:100%;
        	height:22px;
        	padding-top:6px;
        	font-size:13px;
        }
        
        .social_btn{
        	display:flex;
        	justify-content:space-between;
        }
        
        .social_btn img{
        	cursor:pointer;
        }
        
        .like_btn{
        	width:30px;
        	height:30px;
        }
        
        .comment_btn{
        	width:28px;
        	height:28px;
        	margin-left:20px;
        }
        
        .share_btn{
        	width:35px;
        	height:35px;
        }
        
        .social_count{
        	width:100%;
        	height:21px;
        	padding-top:12px;
        	font-size:14px;
        }
        
        .social_text{
        	width:100%;
        	height:25px;
        	padding-top:16px;
        }
		</style>
	</head>
	<body>
		<jsp:include page="../common/header_style.jsp"></jsp:include>
		<div class="content_wrap">
			<div class="content_inner_wrap">
			    <div class="content_area">
			    	<div class="content">
				    	<!-- 상단바 -->
				        <div class="header_container">
				        	<!-- 상단 프로필 -->
				            <div class="user_profile">
				            	<!--상단 프로필 사진 -->
				            	<img class="user_img" src="" alt="">
				            	<div class="user_id_wrap">
				            		<a class="user_id" href="#">ID</a>
					                <p class="write_date">2일전</p>
								</div>
				            </div>
				            <!-- 팔로우 버튼 -->
				            <div class="button_wrap">
								<button class="follow-button" class="btn">팔로우</button>
							</div>        
						</div>
						
						<!-- 컨텐츠 내용 -->
						<!-- 이미지 -->
						<div class="content_img_wrap" style="position:relative;">
			            	<img class="content_img" src="#">  
				    	</div>
				    	<!-- 상품태그 -->
				    	<div class="social_product">
				    		<div class="product_title">
				    			<span class="title_txt">상품 태그</span>
				    			<span class="cnt_txt"><strong>3</strong>개</span>
				    		</div>
				    		<div class="product_list_area">
				    			<ul>
				    				<li class="product_list">
				    					<div class="product">
				    						<img class="product_img" src="#">
				    						<div class="product_name">상품 이름</div>
				    						<div class="product_price">상품 가격</div>
				    					</div>
				    				</li>
				    			</ul>
				    		</div>
				    	</div>
				    	<!-- 좋아요,댓글,공유버튼 -->
				    	<div class="social_btn">
				    		<div class="social_btn_left">
				    			<img class="like_btn" src="${pageContext.request.contextPath}/resources/image/heart3.png">
				    			<img class="comment_btn" src="${pageContext.request.contextPath}/resources/image/comment.png">
				    		</div>
				    		<img class="share_btn" src="${pageContext.request.contextPath}/resources/image/share.png">
				    	</div>
				    	
				    	<!-- 좋아요 카운트 -->
				    	<div class="social_count">
				    		<span>좋아요<strong>48</strong>개</span>
				    	</div>
				    	
				    	<!-- 컨텐츠 내용 -->
				    	<div class="social_text">
				    		<span>컨텐츠 내용</span>
				    	</div>
				    </div>
		    	</div>
		    	<jsp:include page="popup/comment_popup.jsp"></jsp:include>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
		
			//팔로우버튼
			var follow_button = $("#follow-button");
			
			follow_button.on("click",function(){
				//팔로우버튼 클릭시 db에서 그 해당사람이 팔로우인지 확인 후 색 변경
			});
			
			//팝업버튼
			var comment_btn = $(".comment_btn");
			var popup_wrap = $(".popup_wrap");
			var cancel_popup = $(".cancel_popup");
			
			popup_wrap.css('height',window.outerHeight);
			
			comment_btn.on("click",function(){
				popup_wrap.show();
			});
			
			cancel_popup.click(function(){
				popup_wrap.hide();
			});
			
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
		</script>
	</body>
</html>