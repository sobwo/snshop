<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%-- 	<link href="${pageContext.request.contextPath}/resources/css/popup/comment_popup.css" rel="stylesheet"> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <button onclick="openPopup()">좋아요</button>

    <div id="popup">
        <h2>좋아요</h2>
        <div id="contentWrapper">
            <p id="idText">아이디</p>
            <div id="followButton" onclick="toggleFollow()">팔로우</div>
        </div>
        <button onclick="closePopup()">닫기</button>
    </div>



   

</body>
</html>