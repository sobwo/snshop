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
	        <button class="follow-button" value="${get.memberNo}">팔로우 </button>             
		</div>
           
	</c:forEach>
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