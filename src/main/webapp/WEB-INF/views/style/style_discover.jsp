<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>header_style</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<link href=" ${pageContext.request.contextPath}/resources/css/style/style_discover.css" rel="stylesheet">

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
						<a href="#" class="choiceActive">인기순</a>
					</li>		
					<li>|</li>
					<li>
						<a href="#" class="choice">최신순</a>
					</li>
				</ul>
			</div>
		
			<div class="feedContainer">
				<div class="feeds">
					<div class="feedPost" onclick="location.href='#'">
						<div class="feedPostImage">
							<img class="postImage" src="" />
						</div>	
						<div class="imageCnt">
							<span class="imageCount">+1</span>
						</div>
						<div class="feedPostUser">
							<img class="userProfileImage" src="" />
							<p class="userName">아이디</p>
							
							<span class="likeBox">
							<img class="likeImage" src='${pageContext.request.contextPath}/resources/image/heart.png/'>
							<span class="likeCount">7</span>
							</span>
						</div>
						
						<div class="feedPostContent">
							<p>게시글 내용</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>	
	</body>
</html>