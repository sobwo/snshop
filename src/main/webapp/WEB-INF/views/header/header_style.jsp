<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>header_style</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
	</head>
	<body>
		<div id="header_wrap">
			<jsp:include page="header_common.jsp"></jsp:include>
			<div id="header_down">
				<div id="down_inner">
					<ul>
						<li><a>팔로잉</a></li>
						<li style='margin-left:27px'><a>인기글</a></li>
					</ul>
				</div>
			</div>	
		</div>
	</body>
</html>