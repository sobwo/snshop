<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
</head>
<body>


	 <c:forEach var = "get" items="${get}">

		<div class="getCommentList">
			<img class="user_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${get.profileImg}" alt="프로필 사진">
			<div class="comment_txt_area">
				<a class="othereuser_id" href="#">${get.memberName}</a>
				<span class="comment_txt">${get.ccontents}</span>
				<div class="comment_txt_bottom">
					<span class="write_date">${get.cwriteday}</span>
					<!-- 답글쓰기 -->
					
					<button class="reply_comment_btn" onclick="populateInput('${get.memberName}')">답글쓰기 </button>
			
						
					<button class="delete_comment_btn" value="${get.commentNo}" onclick="del_comment_btn(${get.commentNo},${get.boardNo},${get.memberNo},'${get.memberName}')"
    					<c:if test="${get.memberNo eq sessionScope.memberNo}">
        					style="display: inline-block;"
    					</c:if>
    					<c:if test="${get.memberNo ne sessionScope.memberNo}">
        					style="display: none;"
    					</c:if>
					>삭제하기</button>

					<button class="correction_comment_btn" onclick="modify_comment_btn('${get.commentNo}','${get.ccontents}',${get.memberNo})"
    					<c:if test="${get.memberNo eq sessionScope.memberNo}">
        					style="display: inline-block;"
    					</c:if>
						<c:if test="${get.memberNo ne sessionScope.memberNo}">
        					style="display: none;"
    					</c:if>		
					>수정하기</button>
					
				</div>
			</div>
		</div>
			<script>				
 		function del_comment_btn(commentNo,boardNo,memberNo) {
			  var confirmation = confirm("정말로 삭제하시겠습니까?");
			  if (confirmation) {
			    $.ajax({
			      type: "POST",
			      url: "${pageContext.request.contextPath}/comment/deletecomment.do",
			      data: {
			        commentNo: commentNo,
			        memberNo:memberNo
			      },
			      cache: false,
			      success: function(data) {
			        alert("삭제 완료");
			        showComment(boardNo);	
			      },
			      error: function(request,status,error) {
			    	  
			        alert("삭제 실패");
			    	console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
			      }
			    });
			  }
			}
		

		  function populateInput(memberName) {
		    var commentInput = document.querySelector('.comment_input');
		    commentInput.value = "#" + memberName;
		  }

		  
		  
		  function modify_comment_btn(commentNo,ccontents,memberNo) {
			    $(".comment_input").val(ccontents);
			    $(".submit_comment").text("수정");
			    $(".commentNo").val(commentNo);
		  }
		  

		</script>
	</c:forEach>

</body>
</html>