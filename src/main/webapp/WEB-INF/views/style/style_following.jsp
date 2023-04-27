<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>팔로우</title>
	<style>
		.f_wrap{
			width: 1902px;
			display:flex;
			justify-content:center;
			padding-top:131px; 
		}
		
		.f_inner_wrap{
			width:350px;
			display:flex;
			flex-direction:column;
			align-items:center;
		}
		
		.custom-btn {
		    border-radius: 5px;
		    border: none;
		    padding: 10px 20px;
		    background-color: whitesmoke;
		    color: black;
		    font-size: 16px;
		    text-align: center;
		    border: 1px solid gray;
		}
		
		.custom-btn:hover {
			background-color: #f2f2f2;
			cursor: pointer;
		}
		
</style>
</head>
<body>
	<jsp:include page="../common/header_style.jsp"></jsp:include>
	<div class="f_wrap" style="width:1902px;">
		<div class="f_inner_wrap">
			<img src="${pageContext.request.contextPath}/resources/image/다운로드.png" style="width: 99.98px; height: 99.98px;">
			<p><strong>팔로잉</strong></p>
			<p>다른 사용자를 팔로우 하면 해당 사용자의 <br>게시물이 여기에 표시됩니다</p>
	
			<input type="button" value="인기글 보기" class="custom-btn" />
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>

