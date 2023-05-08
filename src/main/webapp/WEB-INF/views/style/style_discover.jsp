<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
					<div class="feedPost">
						<div class="feedPostImage" onclick="location.href='#'">
							<img class="postImage" src="" />
						</div>	
						<div class="imageCnt" onclick="location.href='#'">
							<span class="imageCount">+1</span>
						</div>
						<div class="feedPostUser">
							<img class="userProfileImage" src="" />
							<p class="userName">아이디</p>
							
							<span class="likeBox" onclick="like();">
							<img class="likeImage" id="likeImageChange" src='${pageContext.request.contextPath}/resources/image/heart.png/'>
							<span class="likeCount">7</span>
							</span>
						</div>
						
						<div class="feedPostContent" onclick="location.href='#'">
							<p>게시글 내용</p>
						</div>
					</div>
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