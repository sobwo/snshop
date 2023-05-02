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
						<img class="userProfileImage" id="previewImage" src="${pageContext.request.contextPath}/resources/image/photo.jpg">
						<input type="file" id= "fileatt" name="filename">
						<label for="fileatt"><img class="fileattImage" src="${pageContext.request.contextPath}/resources/image/imageAdd.png"></label>
						<textarea id="contents" placeholder="#아이템과 #스타일을 자랑해보세요."
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
							<input class="genderSelect" id="male" type="radio" value="남성">
							<label for="male">남성</label>
							<input class="genderSelect" id="female" type="radio" value="여성">
							<label for="female">여성</label>
						</div>
					</div>
					
					<div class="tagSelectBox">
						<div class="tagTitle">
							<span>스타일</span>
						</div>
						<div class="tagSelect">
							<input class="styleSelect" id="shoes" type="radio" value="신발">
							<label for="shoes">신발</label>
							<input class="styleSelect" id="outer" type="radio" value="아우터">
							<label for="outer">아우터</label>
							<input class="styleSelect" id="top" type="radio" value="상의">
							<label for="top">상의</label>
							<input class="styleSelect" id="bottoms" type="radio" value="하의">
							<label for="bottoms">하의</label>
							<input class="styleSelect" id="bag" type="radio" value="가방">
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
		<script>		
			function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			}
			 function addHashtag(hashtag) {
			      var textarea = document.getElementById("contents");
			      var currentText = textarea.value;
			      var newText = currentText + " " + hashtag;
			      textarea.value = newText;
			 }
			 function readImage(input) {
				    // 인풋 태그에 파일이 있는 경우
				    if(input.files && input.files[0]) {
				        // 이미지 파일인지 검사 (생략)
				        // FileReader 인스턴스 생성
				        const reader = new FileReader();
				        // 이미지가 로드가 된 경우
				        reader.onload = e => {
				            const previewImage = document.getElementById("previewImage");
				            previewImage.src = e.target.result;
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0]);
				    }
				}
				// input file에 change 이벤트 부여
				const inputImage = document.getElementById("fileatt");
				inputImage.addEventListener("change", e => {
				    readImage(e.target);
				})
		</script>
	</body>
</html>