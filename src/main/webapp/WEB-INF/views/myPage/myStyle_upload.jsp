<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myStyle_upload.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
	</head>
	<body>
	<form name="frm" id="frm" enctype="multipart/form-data">
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myStyleContainer">
			<div class="myStyleContainer_inner">
				<div class="uploadContainer">
					<div class="uploadBox">
						<div id="fileBox">
						<div id="previewImages"></div>
						<input type="button" id="fileDelete"onclick="deletePreview()" value="X" style="display: none;">
						</div>
						<input type="file" multiple="multiple" id="fileatt" name="contentsImg" onchange="readImage(event)">
						<input type="hidden" name="viewCnt" id="viewCntInput" value="">
						<label for="fileatt" id="fileLabel"><img class="fileattImage" src="${pageContext.request.contextPath}/resources/image/imageAdd.png"></label>
						<textarea id="contents" name="contents" placeholder="#아이템과 #스타일을 자랑해보세요."
								onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
						<div id="tagContainer"></div>
					</div>
					
					<div id="hashtagContainer"></div>
					
					<div class="tagContainer">
					     <div>
					         <input type="text" id="hashtags" class="form-control" placeholder="  해시태그를 추가해보세요.">
					         <input type="hidden" id="hashtags-hidden" name="hashTagName">
					     </div>
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
				<input type="button" id="uploadBtn" name="uploadBtn" value="등록" onclick="check();">
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/myStyle_upload.js"></script>
		<script>
// textarea
		function resize(obj) {
		  obj.style.height = "1px";
		  obj.style.height = (12+obj.scrollHeight)+"px";
		}
// hashtag
		const hashtagsInput = document.getElementById("hashtags");
		const hashtagsContainer = document.getElementById("hashtagContainer");
		const hiddenHashtagsInput = document.getElementById("hashtags-hidden");

		var hashtags = [];

		
		
		function addHashtag(tag) {
			tag = tag.replace(/[\[\]]/g, '').trim();
			if(tag && !hashtags.includes(tag)) {
				const span = document.createElement("span");
				span.innerText = "#" + tag + " ";
				span.id = "hashTagNames";  

// hashtag X button
			const removeButton = document.createElement("button");
			removeButton.innerText = "x";
			removeButton.classList.add("remove-button");
			
			removeButton.style.backgroundColor = "white";
			removeButton.style.border = "none";
			removeButton.style.cursor = "pointer";
			
			removeButton.addEventListener("click", () => {
				hashtagsContainer.removeChild(span);
				hashtags = hashtags.filter((hashtag) => hashtag !== tag);
				hiddenHashtagsInput.value = hashtags.join(",");
			});

			span.appendChild(removeButton);
			hashtagsContainer.appendChild(span);
			hashtags.push(tag);
			hiddenHashtagsInput.value = hashtags.join(",");
			}
		}

// hashtag enter
		hashtagsInput.addEventListener("keydown", (event) => {
			if (event.key === 'Enter' || event.key === ' ' || event.key === ',') {
				event.preventDefault();
				const tag = hashtagsInput.value.trim();
				if (tag) {
					addHashtag(tag);
					hashtagsInput.value = "";
				}
			}
		});
		
// 첨부파일 미리보기
		function readImage(event) {
			var previewImages = document.querySelector("div#previewImages");
			var fileLabel = document.querySelector("label#fileLabel");
		
			// 파일 개수가 5개를 초과하는 경우 업로드를 막음
			if (event.target.files.length > 5) {
			alert("사진은 5개까지만 첨부 가능합니다.");
			event.target.value = "";
			}
		
			for (var image of event.target.files) {
			var reader = new FileReader();
		
			reader.onload = function (event) {
				if (isFileAttached(event.target.result, event.target.fileName)) {
				var img = document.createElement("img");
				img.setAttribute("id", "previewImg");
				img.setAttribute("src", event.target.result);
				previewImages.appendChild(img);
				if (previewImages.childElementCount >= 5) {
					fileLabel.style.display = "none";
				}
				
				// 파일 첨부가 있을 때만 버튼을 표시
				if (previewImages.childElementCount > 0) {
					document.querySelector("input[type='button']").style.display = "inline-block";
				}
				
				}
			};
		
			reader.fileName = image.name; // 파일 이름을 FileReader 객체에 저장
			reader.readAsDataURL(image);
			}
		}
// 첨부된 파일만 미리보기	
		function isFileAttached(fileData, fileName) {
			var previewImages = document.querySelectorAll("img#previewImg");
			for (var image of previewImages) {
			if (image.getAttribute("src") === fileData) {
				return false;
				}
			}
			return true;
		}
// 파일 리스트에 중복된 파일 X
		function isDuplicateFile(file, fileList) {
				for (var i = 0; i < fileList.length; i++) {
				if (file.name === fileList[i].name && file.size === fileList[i].size) {
					return true;
					}
				}
				return false;
			}
// file List		
		const dataTransfer = new DataTransfer();
		
		$("#fileatt").change(function () {
			var fileArr = document.getElementById("fileatt").files;
		
			if (fileArr != null && fileArr.length > 0) {
			for (var i = 0; i < fileArr.length; i++) {
				if (isDuplicateFile(fileArr[i], dataTransfer.files)) {
				alert("이미 첨부된 파일입니다: " + fileArr[i].name);
				continue; // 중복된 파일은 건너뜀
				}
				dataTransfer.items.add(fileArr[i]);
			}
			document.getElementById("fileatt").files = dataTransfer.files;
			console.log("dataTransfer =>", dataTransfer.files);
			console.log("input FIles =>", document.getElementById("fileatt").files);
			}
		});   
// file List Delete 
		function resetFileList() {
				dataTransfer.items.clear();
				
				console.log("dataTransfer 삭제 =>", dataTransfer.files);
				console.log("input FIles 삭제 =>", document.getElementById("fileatt").files);    
		}
		
		function resetPreviewImages() {
			var previewImages = document.getElementById("previewImages");
			while (previewImages.firstChild) {
			previewImages.removeChild(previewImages.firstChild);
			}
		}
		
		function deletePreview() {
			resetFileList();
			resetPreviewImages();
			document.querySelector("input[type='button']").style.display = "none";
		}
// 업로드
		function check(){
			if($("#fileatt").val()==="") {     
			      alert("사진을 등록해주세요.");	      
			      return;
			}
			var fm = document.frm;
			fm.action ="${pageContext.request.contextPath}/myPage/myStyle_uploadeAction.do";
			fm.method="post";
			fm.enctype ="multipart/form-data";
			fm.submit();
			return;
		}
		</script>
	</form>
	</body>
</html>