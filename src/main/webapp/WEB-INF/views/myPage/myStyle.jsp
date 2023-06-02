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
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myStyle.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		
		<div class="myStyleContainer">
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
				<c:choose>
					<c:when test="${not empty blist}">
						<div class="feed_wrap">
						<c:forEach var="bv" items="${blist}" varStatus="status">
						
							<div class="feeds" >
								<div class="feedPost" id="feedPost${bv.boardNo}">
									<div class="feedPostImage" onclick="location.href='#'" data-boardNo="${bv.boardNo}">
										<c:set var="exp" value= "${bv.contentsImg.substring(bv.getContentsImg().length()-3, bv.getContentsImg().length())}" />
										<c:set var="imgList" value="${fn:split(bv.contentsImg, ',')}" />
										
										<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
										<c:forEach var="img" items="${imgList}">
											<img class="postImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}">
										</c:forEach>										
										</c:if>
									</div>	
									<c:choose>
										<c:when test="${bv.viewCnt == 1}">
											<div class="imageCnt" style="display:none"></div>
										</c:when>
										<c:otherwise>
											<div class="imageCnt" onclick="location.href='#'">
												<span class="imageCount">+${bv.viewCnt-1}</span>
											</div>
											
											<div class="imageBtn">
												<button type="button" class="prev" value="${bv.boardNo}">&#10094;</button>
												<button type="button" class="next" value="${bv.boardNo}">&#10095;</button>
											</div>
										</c:otherwise>
									</c:choose>
												
									<div class="feedPostUser">
										<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" />
										<p class="userName">${mv.memberId}</p>
										<span class="likeBox">
											<button type="button" class="likeImage" value="${bv.boardNo}">
												<c:choose>
													<c:when test="${bv.like_check == 0}">
														<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
													</c:when>
													<c:when test="${bv.like_check eq 1}">
														<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart2.png/">
													</c:when>
													<c:otherwise>
														<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
													</c:otherwise>
												</c:choose>
											</button>
											<span class="likeCount">${bv.likeCnt}</span>
										</span>					
									</div>
									<div class="feedPostContent" onclick="location.href='#'">
										<p>${bv.contents}</p>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</c:when>
				
				<c:otherwise>
					<div class="feedEmpty">
						<div>
							<img class="feedEmptyImage" src="${pageContext.request.contextPath}/resources/image/camera.png">
							<strong class="EmptyTxt">게시물 없음</strong>
							<p class="EmptySubTxt">사진을 공유하면 내 프로필에 표시됩니다.</p>
						</div>
						<input type="button" class="feedFirstShare" value="첫 사진 공유" onclick="location.href='${pageContext.request.contextPath}/myPage/myStyle_upload.do'">
					</div>
				</c:otherwise>
				</c:choose>		
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
		        }

		      });

		     

		 
		 
		

		 $(".prev").on("click", function (e) {
		      e.preventDefault();

		 
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