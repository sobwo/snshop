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
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		
		<div class="myStyleContainer">
			<div class="userProfile">
				<div>
					<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
					<span class="userName">이름</span>
					<span class="userId">아이디</span>
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
			<div class="feedEmpty">
				<div>
					<img class="feedEmptyImage" src="${pageContext.request.contextPath}/resources/image/camera.png">
					<strong class="EmptyTxt">게시물 없음</strong>
					<p class="EmptySubTxt">사진을 공유하면 내 프로필에 표시됩니다.</p>
				</div>
			</div>
			
			
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>