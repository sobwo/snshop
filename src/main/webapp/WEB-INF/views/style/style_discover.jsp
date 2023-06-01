<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>header_style</title>
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
				<div class="tagShortCuts">
					<a href="#" id="shortCutRounded" style="display:block;">
						<img class="shortCutImage" src=""/>
						<span class="shortCutTitle">#스타일컬렉터</span>
					</a>		
				</div>
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
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			//하트 클릭 시 이미지 변경
			var imgChange = document.getElementById("likeImageChange");
			var currentImage = '${pageContext.request.contextPath}/resources/image/heart.png/';
	
			function like(){
			    if (currentImage === '${pageContext.request.contextPath}/resources/image/heart.png/') {
			        imgChange.setAttribute('src', '${pageContext.request.contextPath}/resources/image/heart2.png');
			        currentImage = '${pageContext.request.contextPath}/resources/image/heart2.png';
			    } else {
			        imgChange.setAttribute('src', '${pageContext.request.contextPath}/resources/image/heart.png/');
			        currentImage = '${pageContext.request.contextPath}/resources/image/heart.png/';
			    }
			}
		</script>
	</body>
</html>