<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>팔로우</title>
		<link href="${pageContext.request.contextPath}/resources/css/style/style_following.css" rel="stylesheet">
		<style>
			.top_menu_list:nth-child(1) a{
				font-weight:bold;
			}
			
			.nav_list:nth-child(2) a{
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header_style.jsp"></jsp:include>
		<div class="f_wrap" style="width:1902px;">
			<div class="f_inner_wrap">
				<img src="${pageContext.request.contextPath}/resources/image/다운로드.png" style="width: 99.98px; height: 99.98px;">
				<p class="following_title"><strong>팔로잉</strong></p>
				<p class="following_noti">다른 사용자를 팔로우 하면 해당 사용자의 <br>게시물이 여기에 표시됩니다</p>
		
				<input type="button" value="인기글 보기" class="custom-btn" onclick="location.href='${pageContext.request.contextPath}/style/style_discover.do'"/>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>

