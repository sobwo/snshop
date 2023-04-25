<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>header_style</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<style>
			.tagContainer {
				display: flex;
				margin: 0 auto;
				width: 1280px;
				height: 160px;
				justify-content: center;
				align-items: center;
				position: relative;
				z-index: 2;
				top: 130px;
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
				width: 1280px;
				height: 20px;
				justify-content: right;
				align-items: right;
				position: relative;
				z-index: 2;
				top: 130px;
			}
			.sortingContainer ul{}
			.sortingContainer li{
				float:left;
				margin:0 6px;
			}
			
			.socialSorting{}
			.choiceActive{
				
    		}
			.choice{}
			
			.feedContainer{
			 	display: flex;
			    padding: 12px 16px;
				margin: 0 auto;
				width: 1280px;
				justify-content: left;
				align-items: center;
				position: relative;
				z-index: 2;
				top: 130px;
			}
			.feeds{
				
			}
			.feedPost{
				width:279px;
				height:458px;
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
			.imageCnt{
				display: block;
				padding: 3px 6px;
			    font-size: 12px;
			    font-weight: 600;
				letter-spacing: -.33px;
			    color: #000;
			}
			.imageCount{}
		</style>
	</head>
	<body>
		<div id="header_wrap">
			<jsp:include page="../common/header_style.jsp"></jsp:include>
			<div id="header_down">
				<div id="down_inner">
					<ul>
						<li><a>팔로잉</a></li>
						<li style='margin-left:27px'><a>인기글</a></li>
					</ul>
				</div>
			</div>	
		</div>
	
		<div class="tagContainer">
			<div class="tagShortCuts">
			
				<a href="#">
					<div class="shortCutRounded">
						<img class="shortCutImage" src=""/>
						<p class="shortCutTitle">#스타일컬렉터</p>
					</div>
				</a>
				
				<a href="#">
					<div class="shortCutRounded">
						<img class="shortCutImage" src="" />
						<p class="shortCutTitle">#2</p>
					</div>
				</a>
				
			</div>
		</div>	
		
		<div class="sortingContainer">
			<ul class="socialSorting">
				<li>
					<a href="#" class="choiceActive">
					인기순
					</a>
				</li>
				
				<li>|</li>
				
				<li>
					<a href="#" class="choice">
					최신순
					</a>
				</li>
			</ul>
		</div>
		
		<div class="feedContainer">
			<div class="feeds">
			
				<a href="#">
					<div class="feedPost">
						<div class="feedPostImage">
							<img class="postImage" src="" />
						</div>
						
						<div class="feedPostUser">
							<img class="userProfileImage" src="" />
							<p class="userName">아이디</p>
							
							<span class="likeBox">
							<img class="likeImage">♡</img>
							<span class="likeCount">7</span>
							</span>
						</div>
						
						<div class="feedPostContent">
							<p>게시글 내용</p>
						</div>
					</div>
					
					<div class="imageCnt">
						<span class="imageCount">+1</span>
					</div>
				</a>
			
			</div>
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	</body>
</html>