<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>스타일</title>
		<link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<link href=" ${pageContext.request.contextPath}/resources/css/style/style_discover.css" rel="stylesheet">
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
		<div id="content_wrap">
			<div class="tagContainer">
				<c:forEach var="hv" items="${hlist}" varStatus="status">
				<div class="tagShortCuts">
					<a href="${pageContext.request.contextPath}/style/style_hashTag.do?hashTagNo=${hv.hashTagNo}" id="shortCutRounded" style="display:block;">
						<img class="shortCutImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${hv.contentsImg}&index=style"/>
						<span class="shortCutTitle">#${hv.hashTagName}</span>
					</a>		
				</div>
				</c:forEach>
			</div>	
			<div class="sortingContainer">
				<ul class="socialSorting">
					<li>
						<a href="${pageContext.request.contextPath}/style/style_discover.do" class="choiceActive">인기순</a>
					</li>		
					<li>|</li>
					<li>
						<a href="${pageContext.request.contextPath}/style/style_discover_newest.do" class="choice">최신순</a>
					</li>
				</ul>
			</div>
		
			<div class="feedContainer">
				<div class="feed_wrap">
					<c:forEach var="ld" items="${llist}" varStatus="status">
						<div class="feeds" >
							<div class="feedPost" id="feedPost${ld.boardNo}">
								<div class="feedPostImage" onclick="location.href='${pageContext.request.contextPath}/style/style_discover2.do?boardNo=${ld.boardNo}#post_${ld.boardNo}'" data-boardNo="${ld.boardNo}">
									<c:set var="exp" value= "${ld.contentsImg.substring(ld.getContentsImg().length()-3, ld.getContentsImg().length())}" />
									<c:set var="imgList" value="${fn:split(ld.contentsImg, ',')}" />
									
									<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
									<c:forEach var="img" items="${imgList}">
										<img class="postImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=style">
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
											
<<<<<<< HEAD
								<div class="feedPostUser" >
    									<c:choose>
						            		<c:when test="${empty ld.profileImg}">
					            				<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" alt="빈 프로필 사진">
						            		</c:when>
						            		<c:otherwise>
												<img class="userProfileImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${ld.profileImg}&index=style">
						            		</c:otherwise>
					            		</c:choose>	     		
			<%-- 					<c:choose>
									<c:when test="${not empty ld.profileImg}">
										<img class="userProfileImage" src="${pageContext.request.contextPath}/image/profileImgShow.do?profileImg=${ld.profileImg}$index=style">	
									</c:when>
									<c:otherwise>
										<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
									</c:otherwise>
								</c:choose>
						 --%>
<%-- 									<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" /> --%>
=======
								<div class="feedPostUser">
									<c:choose>
										<c:when test="${not empty ld.profileImg}">
											<img class="userProfileImage" src="${pageContext.request.contextPath}/image/profileImgShow.do?profileImg=${ld.profileImg}" data-boardNo="${ld.boardNo}">	
										</c:when>
										<c:otherwise>
											<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
										</c:otherwise>
									</c:choose>
>>>>>>> branch 'main' of https://github.com/sobwo/snshop.git
									<p class="userName">${ld.memberId}</p>
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
										<span class="likeCount">${ld.likeCnt}</span>
									</span>					
								</div>
								<div class="feedPostContent" onclick="location.href='#'">
									<p>${ld.contents}</p>
									
									<p class="hashTag">
										<c:forEach var="hv" items="${hhlist}">
											<c:if test="${hv.boardNo == ld.boardNo}">
												<span id="board${hv.boardNo}">#${hv.hashTagName}</span>
											</c:if>
										</c:forEach>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(".likeImage").click(function() {
				var boardNo = $(this).val();
				var clickImage = $(this).children("#likeImageChange");
				var likeCountChange = $(this).siblings(".likeCount");
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
			        	alert("로그인이 필요합니다");
			        }
	
			      });
		      });		    
	
		 
			var imagesMap = {}; 
			
			$(".prev").click(function() {
				var boardNo = $(this).val();
				var currentImageIndex = imagesMap[boardNo] || 0;
				var images = $(".feedPostImage[data-boardNo='" + boardNo + "']").find(".postImage");
				
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
				var images = $(".feedPostImage[data-boardNo='" + boardNo + "']").find(".postImage");
				
				
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
			

		</script>
	</body>
</html>