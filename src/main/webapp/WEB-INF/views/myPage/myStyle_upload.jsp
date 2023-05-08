<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myStyle_upload.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myStyleContainer">
			<div class="myStyleContainer_inner">
				<div class="uploadContainer">
					<div class="uploadBox">
						<div id="previewImages"></div>
						<input type="file" multiple="multiple" id="fileatt" name="contentsImg" onchange="readImage(event)">
	
						<label for="fileatt" id="fileLabel"><img class="fileattImage" src="${pageContext.request.contextPath}/resources/image/imageAdd.png"></label>
						<textarea id="contents" name="contents" placeholder="#아이템과 #스타일을 자랑해보세요."
								onkeydown="resize(this)" onkeyup="resize(this)"
						></textarea>
					</div>
					<div class="hashtagContainer">
						<button onclick="addHashtag('#하이라이트챌린지')">#하이라이트챌린지</button>
						<button onclick="addHashtag('#스타일컬렉터')">#스타일컬렉터</button>
					</div>   
					
				</div>
				<div class="tagSelectContainer">
					<div class="tagSelectBox">
						<div class="tagTitle">
							<span>유형</span>
						</div>
						<div class="tagSelect">
							<input class="genderSelect" id="male" type="checkbox" value="남성">
							<label for="male">남성</label>
							<input class="genderSelect" id="female" type="checkbox" value="여성">
							<label for="female">여성</label>
						</div>
					</div>
					
					<div class="tagSelectBox">
						<div class="tagTitle">
							<span>스타일</span>
						</div>
						<div class="tagSelect">
							<input class="styleSelect" id="shoes" type="checkbox" value="신발">
							<label for="shoes">신발</label>
							<input class="styleSelect" id="outer" type="checkbox" value="아우터">
							<label for="outer">아우터</label>
							<input class="styleSelect" id="top" type="checkbox" value="상의">
							<label for="top">상의</label>
							<input class="styleSelect" id="bottoms" type="checkbox" value="하의">
							<label for="bottoms">하의</label>
							<input class="styleSelect" id="bag" type="checkbox" value="가방">
							<label for="bag">가방</label>
						</div>
					</div>
				</div>
			</div>
			<div class="uploadBtn_area">
				<input type="button" id="uploadBtn" name="uploadBtn" value="등록" disabled="disabled" onclick="">
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/myStyle_upload.js"></script>
	</body>
</html>