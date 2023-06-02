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
    <div class="like_btn">
        <div class="like">
          <!--   <button onclick="openPopup()" style="border-radius: 10px;"> </button> -->
        </div>
        <div id="popup"
            style="display: none; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 400px; height: 350px; background-color: #fff; border: 1px solid #ccc; padding: 10px;">
            <h3 style="text-align: center;">좋아요</h3>

            <div class="popup_style">

                <img src="" style="width: 25px; height: 25px; border-radius: 50%;">
                <p style="margin-left: -200px;"><b>dfsfd</b></p>
                <button class="popup_follow_btn">팔로우</button>


            </div>




            <div class="close_btn">
                <button onclick="closePopup()" style="border-radius: 10px;">확인</button>
            </div>


        </div>
    </div>
   

</body>
</html>