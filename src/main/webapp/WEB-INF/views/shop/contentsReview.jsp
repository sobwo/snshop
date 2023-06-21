<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<c:forEach var = "rl" items="${rl}">
			<div class="feed_contents_area" onclick="">
				<input type = "hidden" value="${rl.boardNo}" />
				<div class="feed_img">
					<img src=""  width="279px" height="279px">
				</div>
				<div class="feed">
					<div class="feed_user">
						<div class="user_info">
							<img src=""  width="26px" height="26px">
							<p>${rl.memberId}</p>
						</div>
						<span><img src="">23</span>
					</div>
					<div class="feed_con">
						<p>${rl.contents}</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</body>
</html>