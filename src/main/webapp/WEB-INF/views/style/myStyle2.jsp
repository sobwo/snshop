<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_PitemCommon.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_main.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/style/myStyle2.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		
			<div class="userProfileTop">
				<div>
					<img class="userProfileImageTop" src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
					<span class="userNameTop">${mv.memberName}</span>
					<span class="userIdTop">${mv.memberId}</span>
				</div>
			</div>
			<div class="socialTab">
				<ul class="socialList">
					<li class="socialItem">
						<a class="menuLink" href="#">
							<span class="socialMenu">게시물</span>
							<span class="socialMenuCnt">${mv.boardCnt}</span>
						</a>
					</li>
					<li class="socialItem">
						<a class="menuLink" href="#">
							<span class="socialMenu">팔로워</span>
							<span class="socialMenuCnt">0</span>
						</a>
					</li>
					<li class="socialItem">
						<a class="menuLink" href="#">
							<span class="socialMenu">팔로잉</span>
							<span class="socialMenuCnt">0</span>
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/myPage/myStyle_upload.do">+</a>
					</li>
				</ul>
			</div>
			
			<div class="feedContainer">
				
			<div class="content_wrap">
			<div class="content_inner_wrap">
			    <div class="content_area">
			    	<c:forEach var="ld" items="${llist}" varStatus="status">
				    	<div class="content" id="post_${ld.boardNo}">
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
									<button class="follow-button" value="${ld.memberNo}">팔로우</button>
									<button class="modify-button" value="${ld.memberNo}" onclick="deleteOption('${ld.boardNo}')">..</button>
								</div>        
							</div>
							<!-- 컨텐츠 내용 -->
							<!-- 이미지 -->
							<div class="feedsImage">
							<div class="content_img_wrap" data-boardNo="${ld.boardNo}">
								<c:set var="exp" value= "${ld.contentsImg.substring(ld.getContentsImg().length()-3, ld.getContentsImg().length())}" />
								<c:set var="imgList" value="${fn:split(ld.contentsImg, ',')}" />
								
								<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
								<c:forEach var="img" items="${imgList}">
									<img class="content_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}">
								</c:forEach>										
								</c:if>
			    				            		
					    	</div>
					    	
				    		<c:choose>
								<c:when test="${ld.viewCnt == 1}">
									<div class="imageCnt" style="display:none"></div>
								</c:when>
								<c:otherwise>
									<div class="imageCnt" onclick="location.href='#'">
										<span class="imageCount">+${ld.viewCnt-1}</span>
									</div>
									
									<div class="imageBtn">
										<button type="button" class="prev" value="${ld.boardNo}">&#10094;</button>
										<button type="button" class="next" value="${ld.boardNo}">&#10095;</button>
									</div>
								</c:otherwise>
							</c:choose>
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
		 
			var imagesMap = {}; 
			
			$(".prev").click(function() {
				var boardNo = $(this).val();
				var currentImageIndex = imagesMap[boardNo] || 0;
				var images = $(".content_img_wrap[data-boardNo='" + boardNo + "']").find(".content_img");
				
				currentImageIndex--;
				if (currentImageIndex < 0) {
				  currentImageIndex = images.length - 1;
				}
				
				imagesMap[boardNo] = currentImageIndex;
				updateDisplayedImage(boardNo, currentImageIndex,images);
			});
			
			$(".next").click(function() {
				var boardNo = $(this).val();
				var currentImageIndex = imagesMap[boardNo] || 0;
				var images = $(".content_img_wrap[data-boardNo='" + boardNo + "']").find(".content_img");
				
				
				currentImageIndex++;
				if (currentImageIndex >= images.length) {
				  currentImageIndex = 0;
				}
				
				imagesMap[boardNo] = currentImageIndex;
				updateDisplayedImage(boardNo, currentImageIndex, images);
			});
			
			function updateDisplayedImage(boardNo, currentImageIndex,images) {
				
				for (var i = 0; i < images.length; i++) {
				  images[i].style.display = "none";
				}
				images[currentImageIndex].style.display = "block";
			}

		 window.addEventListener('DOMContentLoaded', function() {
			    var postId = getParameterByName('boardNo');
			    if (postId) {
			      scrollToPost(postId);
			    }
			  });

			  function scrollToPost(postId) {
			    var postElement = document.getElementById('post_' + postId);
			    if (postElement) {
			      postElement.scrollIntoView({
			        behavior: 'smooth'
			      });
			    }
			  }
			  
		  function deleteOption(boardNo) {
			  var jspFilePath = "popup/myStyle2_popup.do"; // 다른 JSP 파일의 상대 경로

			  var popupStyle = "width=300,height=200";
			  window.open(jspFilePath, "Popup", popupStyle);
			}
	
		</script>
	</body>
</html>

