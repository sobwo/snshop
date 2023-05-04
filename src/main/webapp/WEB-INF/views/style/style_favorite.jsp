<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>팔로잉 글</title>
		<link href="${pageContext.request.contextPath}/resources/css/style/style_favorite.css" rel="stylesheet">
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
		<script src="${pageContext.request.contextPath}/resources/js/style/style_favorite.js"></script>
	</body>
</html>