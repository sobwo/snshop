
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

			<div class="popup_title_wrap">
				<button class="cancel_popup">X</button>
				<h3 class="popup_title">댓글</h3>
			</div>
			
			<!-- 본문내용 -->
			<div class="comment_top">
				<img class="user_img" src="" alt="">
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
				<img class="user_img" src="" alt="">
				<input type="text" class="comment_input" name="ccomments" placeholder="댓글을 남기세요.">
				<button class="submit_comment" >등록</button>
			</div>
			
			<!-- 댓글내용창 -->
			<div class="comment_area">
				<img class="user_img" src="" alt="">
				<div class="comment_txt_area">
					<a class="othereuser_id" href="#">ID</a>
					<span class="comment_txt">댓글 내용</span>
					<div class="comment_txt_bottom">
						<span class="write_date">5일전</span>
						<!-- 답글쓰기 -->
						<button class="reply_comment_btn">답글쓰기</button>
					</div>
				
				</div>
			</div>
			  
		</div>
		<script>
/* 	function submit_comment(){
			var info = document.info;
			info.method = "POST";
			info.action = "${pageContext.request.contextPath}/style/style_comment.do";
			info.submit();
		} */
		
<!-- 
<script>
		$(document).ready(function() {
		  $('.submit_comment').click(function() {
		    var comment = $('.comment_input').val(); // 댓글 입력값 가져오기

		    $.ajax({
		      url: "${pageContext.request.contextPath}/style/style_comment.do", // 요청을 보낼 경로
		      method: 'POST', // HTTP 요청 메서드 (POST 또는 GET)
		      data: { ccomments: comment }, // 전송할 데이터
		      success: function(response) {
		        // 요청이 성공적으로 처리된 후 실행할 동작
		        console.log('댓글 등록 성공');
		        // 추가적인 동작이 필요한 경우 여기에 작성
		      },
		      error: function(xhr, status, error) {
		        // 요청 처리 중 에러가 발생한 경우 실행할 동작
		        console.error('댓글 등록 실패:', error);
		        // 에러 처리에 대한 추가적인 동작이 필요한 경우 여기에 작성
		      }
		    });
		  });
		}); -->
	
/* $(document).ready(function(){
	$('.submit_comment').click(function(){
		var comment = $('.comment_input').val();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/style/style_comment.do",
			method:'POST', 
		})
		
	})
	
})
		 */
		
	</script>
	</body>
</html>