<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
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
							<span class="socialMenuCnt">0</span>
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
				</ul>
			</div>
			<c:choose>
				<c:when test="${not empty blist}">
					<div class="feedContainer">
						<c:forEach var="bv" items="${blist}" varStatus="status">
						<c:if test="${status.count % 4 == 1}">
			                <div class="feedRow">
			            </c:if>
							<div class="feeds" >
								<div class="feedPost">
									<div class="feedPostImage" onclick="location.href='#'">
										<c:choose>
											<c:when test ="${bv.contentsImg==null}">
											</c:when><c:otherwise>
											
											<c:set var="exp" value= "${bv.contentsImg.substring(bv.getContentsImg().length()-3, bv.getContentsImg().length())}" />
											
											<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
												<img class="postImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${bv.contentsImg}">
											</c:if>
											</c:otherwise>
										</c:choose>	
									</div>	
									<div class="imageCnt" onclick="location.href='#'">
										<span class="imageCount">+${bv.viewCnt}</span>
									</div>
									<div class="feedPostUser">
										<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" />
										<p class="userName">${mv.memberId}</p>
										
										<span class="likeBox" onclick="like();">
										<img class="likeImage" id="likeImageChange" src='${pageContext.request.contextPath}/resources/image/heart.png/'>
										<span class="likeCount">${bv.likeCnt}</span>
										</span>
									</div>
									
									<div class="feedPostContent" onclick="location.href='#'">
										<p>${bv.contents}</p>
									</div>
								</div>
							</div>
						<c:if test="${status.count % 4 == 0}">
		              		</div>
		           		</c:if>	
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