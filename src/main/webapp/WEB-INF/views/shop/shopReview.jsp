<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body{
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		.inner{
			width : 1200px;
			padding-top: 55px;
		}
		.goodsArea{
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		.goodsArea div{
			margin-bottom : 5px;
		}
		.goodsImg img{
			width : 120px;
			height : 120px;
		}
		.feedContainer{
		 	display: flex;
		 	flex-wrap: wrap;
		    padding: 12px 16px;
			margin: 0 auto;
			width: 1200px;
			padding:40px 40px 0 40px;;
			justify-content:space-between;
			align-items: center;
		}
		
		.feed_wrap{
			display: grid;
		    grid-template-columns: repeat(4,minmax(0,1fr));
		    column-gap: 30px;
			grid-row-gap: 1px;
			row-gap: 10px;
		}
		
		.feeds{
			width:250px;
			display:inline-block;
			margin:10px 10px 20px 10px; 
		}
		
		.feedPost{
			width:279px;
			height:458px;
			cursor:pointer;
			position:relative;
			float:left;
		}
		.feedPostImage{
			width:279px;
			height:376px;
			display: flex;
		}
		.postImage{
			object-fit: cover;
		    width: 100%;
		    height: 100%;
		    image-rendering: auto;
		    display: flex;
			border: none;
			border-radius: 5%;
		}	
		.postImage {
			position: absolute;
			object-fit: cover;
			width: 100%;
			height: 376px;
			image-rendering: auto;
			display: flex;
			border: none;
			border-radius: 5%;
			-webkit-transition: opacity 1s ease-in-out;
			-moz-transition: opacity 1s ease-in-out;
			-o-transition: opacity 1s ease-in-out;
			transition: opacity 1s ease-in-out;
			opacity: 1;
			-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
			filter: alpha(opacity=0);
		}
		.imageCnt{
			display: flex;
			justify-content: center;
			align-items: center;
			width:23px;
			height:18px;
			position:absolute;
			top:10px;
			right:10px;
			padding: 3px 6px;
			letter-spacing: -.33px;
			background-color:rgba(34,34,34,.5);
		    border-radius: 15px;
		}
		.imageCount{
			font-size: 13px;
		    font-weight: 600;
			color: #fff;
		}
		.imageBtn{	
			display: flex;
			align-items: center;
			width:279px;
			height:18px;
			position:absolute;
			top:188px;
		    justify-content:space-between;
		    font-size:20px;
		    color:rgba(34,34,34,.5);
		}
		.imageBtn button{
			all: unset;
		}
		.userProfileImage{
			object-fit: cover;
		    width:26px;
			height:26px;
			image-rendering: auto;
			border-radius: 50%;
		}
		.feedPostUser{
			display: flex;
			align-items: center;
			width:279px;
			height:28px;
			padding-top:8px;   
		}
		.userName{
			width:170px;
			height:18px;
			padding-left: 4px;
			padding-right: 6px;
			white-space: nowrap;
			font-size: 15px;
			letter-spacing: -.15px;
			color: rgba(34,34,34,.8);
		}
		.likeBox{
			width:59.797px;
			height:32px;
			display: flex;
			justify-content:right;
			align-items: center;
		}
		.likeImage{
			border:0;
			outline:0;
			width:18px;
			height:18px;
			cursor: pointer;
		}
		.likeCount{
			padding-left: 5px;
			height: 20px;
			text-align: center;
			color:rgba(34,34,34,.5);
		}
		.feedPostContent{
			width:271px;
			height:40px;
			margin-top:6px;				
		}
	</style>
	</head>
	<body>
		<jsp:include page="../common/header_common.jsp"></jsp:include>
		<div class="inner">
		<!-- 상품 정보 표시 -->
			<div class="goodsArea">
				<div class="goodsImg">
				<c:set var="exp" value= "${pd.productImg.substring(pd.getProductImg().length()-3, pd.getProductImg().length())}" />
				<c:set var="imgList" value="${fn:split(pd.productImg, ',')}" />
				<c:choose>
					<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
					<c:forEach var="img" items="${imgList}">
						<img class="pro_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
					</c:forEach>
					</c:when>
					<c:otherwise>
						<img class="pro_img" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
					</c:otherwise>
				</c:choose>
				</div>
				<div class="goodsName">${pd.goodsName}</div>
				<div class="goodsEnglishName">${pd.goodsEng}</div>
				<div class="goodsPrice">${pd.price}</div>
			</div><!-- goodsArea -->
		<!-- 상품 리뷰 리스트 -->
			<div class="feedContainer">
				<div class="feed_wrap">
					<c:forEach var="ld" items="${llist}" varStatus="status">
						<div class="feeds" >
							<div class="feedPost" id="feedPost${ld.boardNo}">
								<div class="feedPostImage" onclick="location.href='${pageContext.request.contextPath}/style/style_discover_newest2.do?boardNo=${ld.boardNo}#post_${ld.boardNo}'" data-boardNo="${ld.boardNo}">
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
											
								<div class="feedPostUser" >
									<c:choose>
					            		<c:when test="${empty ld.profileImg}">
					            				<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" alt="빈 프로필 사진">
					            		</c:when>
					            		<c:otherwise>
												<img class="userProfileImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${ld.profileImg}&index=style">
					            		</c:otherwise>
					            	</c:choose>
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
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div><!-- reviewArea -->
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