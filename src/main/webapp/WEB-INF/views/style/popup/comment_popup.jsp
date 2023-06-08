<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/popup/comment_popup.css" rel="stylesheet">
	</head>
	<body>

		<div class="popup_wrap">
			<!-- 상단바 -->
			<input type="hidden" class="h_boardNo">
			<div class="popup_title_wrap">
				<button class="cancel_popup">X</button>
				<h3 class="popup_title">댓글</h3>
			</div>
			
			<!-- 본문내용 -->
			<div class="comment_top">
				<img class="user_img user_profileImg" src="" alt="">
	           	<div class="user_id_wrap">
	           		<a class="user_id" href="#"> 아이디</a>
	               	<span class="content_top"> </span>
	               	<div class="tag_wrap">
	               		<a class="tag" href="#">태그</a>
	               	</div> 
				</div>
			</div>    
			
			<!-- 댓글 입력창 -->
		
 				<div class="social_comment_input">
				<form name = "crm">
		 		<img class="user_img memberProfileImg" src="" alt="프로필 사진">
					<input type="text" class="comment_input" name="ccontents" placeholder="댓글을 남기세요.">
					<button type="button" class="submit_comment" onclick="submitComment()">등록</button>
					
			
				</form>
			</div>
			<!-- 댓글내용창 -->
			<div class="comment_area">
				
			</div>
			  
		</div>
	</body>
</html>