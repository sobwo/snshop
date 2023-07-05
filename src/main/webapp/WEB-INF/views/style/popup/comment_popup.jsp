<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/popup/comment_popup.css" rel="stylesheet">
	<style>
	     .popup_content22 { 
            max-height: 900px;
            overflow-y: auto;
            padding-right: 15px;
        }
	
	</style>
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
           	<c:choose>
        		<c:when test="${empty mv.profileImg}">
       				<img class="user_img" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" alt="빈 프로필 사진">
        		</c:when>
        		<c:otherwise>
				<img class="user_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${mv.profileImg}&index=style">
        		</c:otherwise>
       		</c:choose>
	           	<div class="user_id_wrap">
	           		<a class="user_id" href="#"> 아이디</a>
	               	<span class="content_top"> </span>
	               	<div class="tag_wrap">               	 
	              <a class="tag" href="#" id="dynamicTag">태그</a> 

	               	</div>    
	         
	               	 	
				</div>
			</div>  
		

			<!-- 댓글 입력창 -->
		
			<div class="social_comment_input">
				<form name = "crm">
	              	<c:choose>
		        		<c:when test="${empty mv.profileImg}">
		       				<img class="user_img" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" alt="빈 프로필 사진">
		        		</c:when>
		        		<c:otherwise>
		        		
						<img class="user_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${mv.profileImg}&index=style">
		        		</c:otherwise>
		       		</c:choose>

						<input type="text" class="comment_input" name="ccontents" placeholder="댓글을 남기세요.">
					<button type="button" class="submit_comment" onclick="submitComment()">등록</button>
					<input type="hidden" class="commentNo">
			
				</form>
			</div>
			<!-- 댓글내용창 -->
			 <div class="popup_content22"> <!-- 스크롤 -->
			<div class="comment_area">
				
			</div>
		</div>
		</div>
		<script>
	      


		</script>
	</body>
</html>