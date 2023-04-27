<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>header_style</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<style>
			#content_wrap{
				width:1903px;
				padding-top:131px; 
			}
			.tagContainer {
 				display: flex; 
 				margin: 0 auto; 
				width: 1200px;
				height: 160px;
 				justify-content: center; 
  				align-items: center; 
				border-bottom:1px solid #e4e4e4;
			}
			.tagShortCuts{
				display: flex;
				justify-content: center; 
				align-items: center;
				grid-column-gap: 24px;
			}
			.shortCutRounded{
				display: inline-flex;
		   		-webkit-box-orient: vertical;
				-webkit-box-direction: normal;
				flex-direction: column;
				grid-gap: 4px;
				gap: 4px;
			}
			.shortCutImage{
				width:66px;
				height:66px;
				border-radius: 50%;
  				overflow: hidden;
  				border: none;
			}
			.image{
				object-fit: cover;
			    width: 100%;
			    height: 100%;
			    image-rendering: auto;
			}
			.shortCutTitle{
				font-size: 12px;
				letter-spacing: -.06px;
				line-height: 14px;
				overflow: hidden;
				text-overflow: ellipsis;
				display: -webkit-box;
				-webkit-line-clamp: 2;
				-webkit-box-orient: vertical;
				word-break: break-word;
				text-align: center;		
			}
			.sortingContainer{
			    display: flex;
			    padding: 12px 16px;
				margin: 0 auto;
				width: 1200px;
				padding:10px 40px;
				height: 20px;
				justify-content: right;
				align-items: right;
			}
			.sortingContainer ul{}
			.sortingContainer li{
				float:left;
				margin:0 6px;
			}
			.socialSorting{}
			.choiceActive{}
			.choice{}
			.feedContainer{
			 	display: flex;
			    padding: 12px 16px;
				margin: 0 auto;
				width: 1200px;
				padding:0 40px;
				justify-content:left;
				align-items: center;
			}
			.feedPost{
				width:279px;
				height:458px;
				cursor:pointer;
				position:relative;
			}
			.feedPostImage{
				width:279px;
				height:376px;
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
			.imageCnt{
				position:absolute;
				top:10px;
				right:2px;
				display: block;
				padding: 3px 6px;
			    font-size: 12px;
			    font-weight: 600;
				letter-spacing: -.33px;
			    color: #000;
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
				width:279px;
				height:28px;
				padding-top:8px;   
			}
			.userName{
				width:185.203px;
				height:18px;
				padding-left: 4px;
   				padding-right: 6px;
   				white-space: nowrap;
   				font-size: 15px;
   				letter-spacing: -.15px;
   				color: rgba(34,34,34,.8);
			}
			.likeBox{
				float:right;
				width:59.797px;
				height:32px;
			}
			.likeImage{}
			.likeCount{}
			.feedPostContent{
				width:271px;
				height:40px;
				margin-top:6px;				
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