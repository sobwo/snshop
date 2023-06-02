<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<c:forEach var = "get" items="${get}">
		<div class="getCommentList">
			<img class="user_img" src="" alt="">
			<div class="comment_txt_area">
				<a class="othereuser_id" href="#">ID</a>
				<span class="comment_txt">${get.ccontents}</span>
				<div class="comment_txt_bottom">
					<span class="write_date">${get.cwriteday}</span>
					<!-- 답글쓰기 -->
					<button class="reply_comment_btn">답글쓰기</button>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>