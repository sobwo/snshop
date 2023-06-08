<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<c:forEach var = "get" items="${get}">
		<div class="popup_style">
		    <img src="" style="width: 25px; height: 25px; border-radius: 50%;">
			<p style="margin-left: -200px;"><b>${get.memberName} </b></p>
	        <button class="popup_follow_btn">팔로우</button>             
		</div>
           
	</c:forEach>
</body>
</html> 