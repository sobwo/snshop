<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/popup/likepush.css" rel="stylesheet">
  <style>
 	 .popup_content {
            max-height: 400px;
            overflow-y: auto;
            padding-right: 15px;
        }   
        .p-like{
         	text-align: center;
		 	padding: 10px;
        }
</style > 
</head>
<body>
 <div class="popup_content"> 
		<c:forEach var="get" items="${get}">
			<div class="popup_style">
		  	<c:choose>
           		<c:when test="${empty get.profileImg}">
           				<img class="user_img" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" alt="빈 프로필 사진">
           		</c:when>
           		<c:otherwise>
						<img class="user_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${get.profileImg}&index=style">
           		</c:otherwise>
           	</c:choose>
				<p style="margin-left: -210px;"><b>${get.memberName}</b></p>
				<button class="follow-button" value="${get.memberNo}">팔로우</button>
			</div>
		</c:forEach>
		<c:if test="${empty get}">
			<p class="p-like">좋아요를 눌러보세요!</p>
		</c:if>
 </div>  
	<script>
	$(document).ready(function(){
		showfollowing();
	});
	
	function showfollowing(){
		var follow_button = $(".follow-button"); 
		for(var i=0;i<follow_button.length;i++)
			followAjax(follow_button.eq(i));
	}
	
	function followAjax(follow_button){
		var followingMemberNo = follow_button.val();
		var followButton = follow_button;
		
		$.ajax({
         	  type: "GET",
         	  url: "${pageContext.request.contextPath}/style/followingshow.do",
         	  dataType: "json",
         	  data: {
         	    "followingMemberNo": followingMemberNo
         	  },
         	  cache: false,
         	  success: function(data) {
         		  console.log(data);
         	    if (data.nowfollowingState == 1) {
         	      followButton.text("팔로잉");
         	      followButton.css("background","#fff");
         	      followButton.css("color","#000");
         	    } else {
         	    	followButton.text("팔로우");
            	    followButton.css("background","#000");
            	    followButton.css("color","#fff");
         	    }
         	  },
         	  error : function(request,status,error){
  					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
				}	
         	});
	}
        
	  $(".follow-button").on("click",function(){
        	 
      	var followingMemberNo = $(this).val();
			var followButton = $(this);

       $.ajax({
       	  type: "POST",
       	  url: "${pageContext.request.contextPath}/style/followingCheck.do",
       	  dataType: "json",
       	  data: {
       	    "followingMemberNo": followingMemberNo,
       	  },
       	  cache: false,
       	  success: function(data) {
       		  
       	  	console.log(data);
       	  	if(data.value == 1)
       	  		showfollowing();
       	  	else
       	  		alert();
       	  },
       	  error : function(request,status,error){
       		 alert("로그인이 필요합니다");
				console.log("code: " + request.status);
		        console.log("message: " + request.responseText);
		        console.log("error: " + error);
				}	
       	});
      });
          
     
	</script>
</body>
</html> 