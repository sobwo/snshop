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
			.top_menu_list:nth-child(1) a{
				font-weight:bold;
			}
			
			.nav_list:nth-child(2) a{
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header_style.jsp"></jsp:include>
		
		<c:choose>
		<c:when test="${empty blist}">
		<div class="f_wrap" style="width:1902px;">
			<div class="f_inner_wrap">
				<img src="${pageContext.request.contextPath}/resources/image/다운로드.png" style="width: 99.98px; height: 99.98px;">
				<p class="following_title"><strong>팔로잉</strong></p>
				<p class="following_noti">다른 사용자를 팔로우 하면 해당 사용자의 <br>게시물이 여기에 표시됩니다</p>
		
				<input type="button" value="인기글 보기" class="custom-btn" onclick="location.href='${pageContext.request.contextPath}/style/style_discover.do'"/>
					
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<div class="content_wrap">
			<div class="content_inner_wrap">
			    <div class="content_area">
			    	<c:forEach var="blist" items="${blist}">
				    	<div class="content">
					    	<!-- 상단바 -->
					        <div class="header_container">
					        	<!-- 상단 프로필 -->
					            <div class="user_profile">
					            	<!--상단 프로필 사진 -->
					            	<img class="user_img" src="" alt="">
					            	<div class="user_id_wrap">
					            		<a class="user_id" href="#"> ${blist.memberId} </a>
						                <p class="write_date">  ${blist.writeday}  </p>
									</div>
					            </div>
					            <!-- 팔로우 버튼 -->
					            <div class="button_wrap">
									<button class="follow-button" class="btn">팔로잉</button>
								</div>        
							</div>
							
							<!-- 컨텐츠 내용 -->
							<!-- 이미지 -->
							<div class="content_img_wrap" style="position:relative;">
				            <!-- 	<img class="content_img" src="#">   -->
				            		<img class="content_img" src="${pageContext.request.contextPath}/style/contentsImg=${blist.contentsImg}">
				            						    				            		
<%-- 				            	src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${bv.contentsImg}"> --%>
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
									<button type="button" class="likeImage" value="${blist.boardNo}">
										<c:choose>
											<c:when test="${blist.like_check == 0}">
												<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
											</c:when>
											
											<c:when test="${blist.like_check eq 1}">
												<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart2.png/">
											</c:when>
											<c:otherwise>
												<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
											</c:otherwise>
										</c:choose>
									</button>
									<span class="commentBox"> 
										<img class="comment_btn" src="${pageContext.request.contextPath}/resources/image/comment.png" onclick= "comment_btn('${blist.memberId}', '${blist.contents}','${blist.boardNo}')">	
									</span>
								</span>
								<div class="social_count" onclick="openPopup()">
	  								<span>좋아요&nbsp;<strong class="likeCount">  ${blist.likeCnt}   <%-- ${bv.likeCnt}  --%></strong>개</span>
								</div>
							</div>
							</div>
							
							<%-- 	위치선정중<span class="commentBox"> 
									<img class="comment_btn" src="${pageContext.request.contextPath}/resources/image/comment.png" onclick= "comment_btn('${blist.memberId}', '${blist.contents}','${blist.boardNo}')">	
								</span>  --%>
						<%-- 		<div class="social_count" onclick="openPopup()">
  									<span>좋아요&nbsp;<strong>${blist.likeCnt} ${bv.likeCnt}</strong>개</span>
								</div>
               			 		 --%>
		<%-- 		    					<!-- 5-31 like 버튼  -->	
	    						<span class="commentBox"> 
									<img class="comment_btn" src="${pageContext.request.contextPath}/resources/image/comment.png" onclick= "comment_btn('${blist.memberId}', '${blist.contents}','${blist.boardNo}')">	
								</span> 	 		    			
					    		</div>
					
								
					    		<img class="share_btn" src="${pageContext.request.contextPath}/resources/image/share.png" onclick="openPopup()">
					    		
					    	</div>
					    	
					    
					    	<!-- 좋아요 카운트 -->
					   <%--  	<div class="social_count" onclick="openPopup()">
					    		<span>좋아요&nbsp;<strong> ${blist.likeCnt} ${bv.likeCnt} </strong>개</span> 
					    		                    
               			 	</div> --%>
               			 	
               			 <%-- 6-2 12:41	<div class="social_count" onclick="openPopup()">
  								<span>좋아요&nbsp;<strong>${blist.likeCnt} ${bv.likeCnt}</strong>개</span>
							</div>
               			 	
               			 	 --%>
					    	<!-- 컨텐츠 내용 -->
					    	<div class="social_text">
					    		<span>${blist.contents}</span>
					    	</div>
					    </div>
					</c:forEach>
		    	</div>
		    	<jsp:include page="popup/comment_popup.jsp"></jsp:include>
		    		<jsp:include page="popup/likepush.jsp"></jsp:include>

		    
			</div>
		</div>
		</c:otherwise>
		</c:choose>

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

			function comment_btn(id, content, boardNo) {
			    popup_wrap.show();
			    $(".user_id").text(id);
			    $(".content_top").text(content);
			    $(".h_boardNo").val(boardNo);
			    
			    showComment();
			}
	
			function submitComment(){
				 var ccontents = $(".comment_input").val(); 
			/* 	var ccomments = $("input[name='ccomments']").val(); */
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
						alert("다시 시도하시기 바랍니다.");	
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
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
					
				});
			}
		</script>
	</body>
</html>

