<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			
			.nav_list:nth-child(1) a{
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
					            	
					            	<c:choose>
					            		<c:when test="${empty blist.profileImg}">
					            				<img class="user_img" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" alt="빈 프로필 사진">
					            		</c:when>
					            		<c:otherwise>
												<img class="user_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${blist.profileImg}">
					            		</c:otherwise>
					            	</c:choose>
					            	<div class="user_id_wrap">
					            		<a class="user_id" href="#"> ${blist.memberId} </a>
						                <p class="write_date">  ${blist.writeday}  </p>
									</div>
					            </div>
					            <!-- 팔로우 버튼 -->
					            <div class="button_wrap">	
									<button class="follow-button" value="${blist.memberNo}">팔로우</button>
								</div>        
							</div>
							<!-- 컨텐츠 내용 -->
							<!-- 이미지 -->
							<div class="feedsImage">
								<div class="content_img_wrap" data-boardNo="${blist.boardNo}">
									<c:set var="exp" value= "${blist.contentsImg.substring(blist.getContentsImg().length()-3, blist.getContentsImg().length())}" />
									<c:set var="imgList" value="${fn:split(blist.contentsImg, ',')}" />
									
									<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
									<c:forEach var="img" items="${imgList}">
										<img class="content_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}">
									</c:forEach>										
									</c:if>
				    				            		
						    	</div>
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
										<img class="comment_btn" src="${pageContext.request.contextPath}/resources/image/comment.png" onclick= "comment_btn('${blist.memberId}', '${blist.contents}','${blist.boardNo}','${blist.profileImg}')">	
									</span>
									<img class="share_btn" src="${pageContext.request.contextPath}/resources/image/share.png" onclick="openPopup()">
								</span>
								<div class="social_count" > 
	  								<span class="openPopup21" onclick ="openPopup2(${blist.boardNo})">좋아요&nbsp;<strong class="likeCount">  ${blist.likeCnt}  </strong>개</span>
								</div>
							</div>
							</div>

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
						alert("다시 시도하시기 바랍니다.");	

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
					alert("3다시 시도하시기 바랍니다.");	
					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
					}	
             	});
            });
                
		
			function comment_btn(id, content, boardNo, profileImg) {
			    popup_wrap.show();
			    $(".user_id").text(id);
			    $(".content_top").text(content);
			    $(".submit_comment").val(boardNo);
 			   
			    showComment(boardNo);     

			    var memberImg = "${mv.profileImg}";
			    if(profileImg == null || profileImg == "")
			    	$(".user_profileImg").attr("src","${pageContext.request.contextPath}/resources/image/blank_profile.png");
			    else
			    	$(".user_profileImg").attr("src","${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg="+profileImg);
			    
			    if(memberImg == null || memberImg == "")
			    	$(".memberProfileImg").attr("src","${pageContext.request.contextPath}/resources/image/blank_profile.png");
			    else
			    	$(".memberProfileImg").attr("src","${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg="+memberImg);
			    	
			    showComment(boardNo);

			}
	
			function submitComment(){
				 var ccontents = $(".comment_input").val();
				 var boardNo = $(".submit_comment").val();
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/comment/comment_commentAction.do",
					dataType:"json",
					data:{"ccontents": ccontents,
							"boardNo": boardNo},
					cache:false,
					success: function(data){
						if(data.value == 1) 			/* 	if(data.value == 1) 댓글 안되서 임시  */
							showComment(boardNo);
					},
					error : function(request,status,error){
						alert("2다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
					
				});	
			}
			
			function showComment(boardNo){
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
						alert("1다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
					
				});
			}
			

 			function openPopup2(boardNo) {
	    		$.ajax({
	        		type: "GET",
	        		url: "${pageContext.request.contextPath}/style/likeMemberList.do",
	        		data: {
	            			"boardNo": boardNo
	        		},
	        		cache: false,
	        		success: function(data) {
            		console.log(data);
            		var popup = document.getElementById("popup");
	            	var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	            
	            // 팝업 창의 위치를 스크롤 위치에 따라 조정
	           	 	popup.style.top = (500 + scrollTop) + "px";
	            
	            	popup.style.display = "block";
	            	$(".popup_style_wrap").html(data);
	            
	            // 스크롤 막기
			            document.body.style.overflow = "hidden";
			        },
			        error: function(request, status, error) {
			            alert("다시 시도해주세요.");
			            console.log("code: " + request.status);
			            console.log("message: " + request.responseText);
			            console.log("error: " + error);
			        }
			    });
			}
		
			function closePopup2() {
			    var popup = document.getElementById("popup");
			    popup.style.display = "none";
			    
			    // 스크롤 허용
			    document.body.style.overflow = "auto";
			}

		</script>
	</body>
</html>

