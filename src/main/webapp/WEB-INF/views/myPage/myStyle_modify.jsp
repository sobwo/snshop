<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myStyle_upload.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
	</head>
	<body>
	<form name="frm" id="frm" enctype="multipart/form-data">

<input type="hidden" name="boardNo" value="${bv.boardNo}" >

	
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myStyleContainer">
			<div class="myStyleContainer_inner">
				<div class="uploadContainer">
					<div class="uploadBox">
						<div id="previewImages">

							<c:set var="exp" value= "${bv.contentsImg.substring(bv.getContentsImg().length()-3, bv.getContentsImg().length())}" />
							<c:set var="imgList" value="${fn:split(bv.contentsImg, ',')}" />
							
							<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
							<c:forEach var="img" items="${imgList}">
								<img class="fileattImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}">
							</c:forEach>										
							</c:if>
						</div>
					
						<textarea id="contents" name="contents" placeholder="#아이템과 #스타일을 자랑해보세요."
								onkeydown="resize(this)" onkeyup="resize(this)">${bv.contents}</textarea>
					</div>
					
					<div id="hashtagContainer">
						<c:forEach var="hv" items="${hlist}">
							<c:if test="${hv.boardNo == bv.boardNo}">
							<c:set var="tagNames" value="${tagNames}${hv.hashTagName}," />
								<span id="hashTagNames" class="tag-item">#${hv.hashTagName}</span>
								<input type="button" class="remove-button" value="x">
							</c:if>
						</c:forEach>
					</div>
					
					<div class="tagContainer">
						<div>
							<input type="text" id="hashtags" class="form-control" placeholder="  해시태그를 추가해보세요.">
							<input type="hidden" id="hashtags-hidden" name="hashTagName" value="${fn:substring(tagNames, 0, fn:length(tagNames) - 1)}">
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
				<input type="button" id="uploadBtn" name="uploadBtn" value="수정" onclick="mCheck()">
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/myStyle_upload.js"></script>
		<script>
		function resize(obj) {
			  obj.style.height = "1px";
			  obj.style.height = (12+obj.scrollHeight)+"px";
			}

		
		$(document).ready(function() {
		    $('.remove-button').click(function() {
		        var index = $('.remove-button').index(this);

		        // 해당 span 요소와 값을 동시에 제거합니다.
		        $('.tag-item').eq(index).remove();

		        // 해당 버튼 자체를 제거합니다.
		        $(this).remove();

		        // 숨겨진 입력 필드의 값을 가져옵니다.
		        var tagNames = $('#hashtags-hidden').val().split(',');

		        // 해당 값 제거
		        tagNames.splice(index, 1);

		        // 숨겨진 입력 필드의 값을 업데이트합니다.
		        $('#hashtags-hidden').val(tagNames.join(','));

		        // value 값을 제거합니다.
		        var value = $(this).val();
		        var hiddenValue = $('#hashtags-hidden').val();
		        hiddenValue = hiddenValue.replace(value + ',', '');
		        $('#hashtags-hidden').val(hiddenValue);

		        // 변경된 값을 hashtags 배열에 업데이트합니다.
		        hashtags = tagNames.filter((tag) => tag.trim() !== "");
		    });
		});
		
	    const hashtagsInput = document.getElementById("hashtags");
	    const hashtagsContainer = document.getElementById("hashtagContainer");
	    const hiddenHashtagsInput = document.getElementById("hashtags-hidden");
	    
	    let hashtags = hiddenHashtagsInput.value.split(",").filter((tag) => tag.trim() !== "");
	    
	    function updateHiddenInput() {
	        hiddenHashtagsInput.value = hashtags.join(",");
	    }
	    
	    function addHashtag(tag) {
	        tag = tag.replace(/[\[\]]/g, '').trim();
	        if (tag && !hashtags.includes(tag)) {
	            const span = document.createElement("span");
	            span.innerText = "#" + tag + " ";
	            span.id = "hashTagNames";
	            
	            const removeButton = document.createElement("button");
	            removeButton.innerText = "x";
	            removeButton.classList.add("remove-button");
	            
	            removeButton.style.backgroundColor = "white";
	            removeButton.style.border = "none";
	            removeButton.style.cursor = "pointer";
	            
	            removeButton.addEventListener("click", () => {
	                hashtagsContainer.removeChild(span);
	                hashtags = hashtags.filter((hashtag) => hashtag !== tag);
	                updateHiddenInput();
	            });
	            
	            span.appendChild(removeButton);
	            hashtagsContainer.appendChild(span);
	            hashtags.push(tag);
	            updateHiddenInput();
	        }
	    }
	    
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

	    hashtags.forEach((tag) => {
	        addHashtag(tag);
	    });
        

		function mCheck(){
			
			var fm = document.frm;
			fm.action ="${pageContext.request.contextPath}/myPage/myStyle_modifyAction.do";
			fm.method="post";
			fm.enctype ="multipart/form-data";
			fm.submit();
			return;
		}
		</script>
	</form>
	</body>
</html>