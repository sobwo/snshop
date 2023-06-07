<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>팔로잉</title>
		<link href="${pageContext.request.contextPath}/resources/css/style/style_following.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/style/style_favorite.css" rel="stylesheet">
		<style>
			.top_menu_list:nth-child(2) a{
				font-weight:bold;
			}
						
			.nav_list:nth-child(2) a{
				font-weight:bold;
			}
			.socialSorting li:nth-child(1) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header_style.jsp"></jsp:include>
		
	
		<div class="content_wrap">
			<div class="content_inner_wrap">
			    <div class="content_area">
			    	<c:forEach var="ld" items="${llist}" varStatus="status">
				    	<div class="content">
					    	<!-- 상단바 -->
					        <div class="header_container">
					        	<!-- 상단 프로필 -->
					            <div class="user_profile">
					            	<!--상단 프로필 사진 -->
					            	<img class="user_img" src="" alt="">
					            	<div class="user_id_wrap">
					            		<a class="user_id" href="#"> ${ld.memberId} </a>
						                <p class="write_date">  ${ld.writeday}  </p>
									</div>
					            </div>
					            <!-- 팔로우 버튼 -->
					            <div class="button_wrap">	
									<button class="follow-button" value="${ld.memberNo}">팔로잉</button>
								</div>        
							</div>
							<!-- 컨텐츠 내용 -->
							<!-- 이미지 -->
							<div class="content_img_wrap" style="position:relative;">
	
				            		<img class="content_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}">
				            						    				            		
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
					    						<div class="product_name"><%-- ${gv.goodsName} --%></div>
					    						<div class="product_price"><%-- ${gv.price}  --%></div>
					    					</div>
					    				</li>
					    			</ul>
					    		</div>
					    	</div>
					    	<!-- 좋아요,댓글,공유버튼 -->
					    	<div class="social_btn">
					    		<div class="social_btn_left">
								<!-- 5-31 like 버튼  -->
								<span class="likeBox">
									<button type="button" class="likeImage" value="${ld.boardNo}">
										<c:choose>
											<c:when test="${ld.like_check == 0}">
												<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
											</c:when>
											
											<c:when test="${ld.like_check eq 1}">
												<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart2.png/">
											</c:when>
											<c:otherwise>
												<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
											</c:otherwise>
										</c:choose>
									</button>
									<span class="commentBox"> 
										<img class="comment_btn" src="${pageContext.request.contextPath}/resources/image/comment.png" onclick= "comment_btn('${ld.memberId}', '${ld.contents}','${ld.boardNo}')">	
									</span>
									<img class="share_btn" src="${pageContext.request.contextPath}/resources/image/share.png" onclick="openPopup()">
								</span>
								<div class="social_count" onclick="openPopup()">
	  								<span>좋아요&nbsp;<strong class="likeCount">  ${ld.likeCnt}  </strong>개</span>
								</div>
							</div>
							</div>

					    	<!-- 컨텐츠 내용 -->
					    	<div class="social_text">
					    		<span>${ld.contents}</span>
					    	</div>
					    </div>
					</c:forEach>
		    	</div>
		    	<jsp:include page="popup/comment_popup.jsp"></jsp:include>
		    		<jsp:include page="popup/likepush.jsp"></jsp:include>

		    
			</div>
		</div>


		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/style/style_favorite.js"></script>
		<script>
		
		$(".likeImage").click(function(){
			var boardNo = $(this).val();
			var clickImage = $(this).children("#likeImageChange");
			var likeCountChange = $(this).parent(".likeBox").siblings(".social_count").find(".likeCount");
			
			 $.ajax({
			        type: "POST",
			        url: "${pageContext.request.contextPath}/myPage/like_check.do",
			        dataType: "json",
			        data: {
						"boardNo": boardNo,
			        	},
			        cache: false,
			        success: function(data) {	
			        	
						if (data.cnt == 1) {
							clickImage.attr("src", "${pageContext.request.contextPath}/resources/image/heart2.png/");
			          
			         	}else {
			         		clickImage.attr("src", "${pageContext.request.contextPath}/resources/image/heart.png/");
			          
			         	}
						
						likeCountChange.text(data.totalCnt);
						
			        },
			        error: function() {
			        }

			      });
			     

		      });		

			$(document).ready(function(){
				showfollowing();
			});
			
			function showfollowing(){
				var follow_button = $(".follow-button"); 
				for(var i=0;i<follow_button.length;i++)
					followAjax(follow_button.eq(i));
			}
			
			function followAjax(follow_button){
				var followingMemberNo = follow_button.val();
				var followButton = follow_button;
				
				$.ajax({
	             	  type: "GET",
	             	  url: "${pageContext.request.contextPath}/style/followingshow.do",
	             	  dataType: "json",
	             	  data: {
	             	    "followingMemberNo": followingMemberNo,
	             	  },
	             	  cache: false,
	             	  success: function(data) {
	             	    if (data.nowfollowingState == 1) {
	             	      followButton.text("팔로잉");
	             	      followButton.css("background","#fff");
	             	      followButton.css("color","#000");
	             	    } else {
	             	    	followButton.text("팔로우");
	                	    followButton.css("background","#000");
	                	    followButton.css("color","#fff");
	             	    }
	             	  },
	             	  error : function(request,status,error){
						alert("다시 시도1.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
						}	
	             	});
			}
                
               
            $(".follow-button").on("click",function(){
           	 
            	var followingMemberNo = $(this).val();
	 			var followButton = $(this);

             $.ajax({
             	  type: "POST",
             	  url: "${pageContext.request.contextPath}/style/followingCheck.do",
             	  dataType: "json",
             	  data: {
             	    "followingMemberNo": followingMemberNo,
             	  },
             	  cache: false,
             	  success: function(data) {
             		  
             	  	console.log(data);
             	  	if(data.value == 1)
             	  		showfollowing();
             	  	else
             	  		alert();
             	  },
             	  error : function(request,status,error){
					alert("다시 시도2");	
					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
					}	
             	});
            });
                
		
			function comment_btn(id, content, boardNo) {
			    popup_wrap.show();
			    $(".user_id").text(id);
			    $(".content_top").text(content);
			    $(".h_boardNo").val(boardNo);
			    
			    showComment();
			}
	
			function submitComment(){
				 var ccontents = $(".comment_input").val(); 

				var boardNo = $(".h_boardNo").val();
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/comment/comment_commentAction.do",
					dataType:"json",
					data:{"ccontents": ccontents,
							"boardNo": boardNo},
					cache:false,
					success: function(data){
						if(data.value==1)
							showComment();
					},
					error : function(request,status,error){
						alert("다시 시도3");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
					
				});	
			}
			
			function showComment(){
				var boardNo = $(".h_boardNo").val();
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/comment/comment_commentShow.do",
					data:{
							"boardNo": boardNo},
					cache:false,
					success: function(data){
						$(".comment_area").html(data);
					},
					error : function(request,status,error){
						alert("다시 시도4");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
					
				});
			}
			
			
            

		</script>
	</body>
</html>

