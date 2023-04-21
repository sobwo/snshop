<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>header_common</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
	</head>
	<body>
		<div id="top_inner">
			<div id="top_menu">
				<ul>
					<li><a>고객센터</a></li>
					<li style='margin-left:24px'><a>관심상품</a></li>
					<li style='margin-left:24px'><a>로그인</a></li>
					<li><a>로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div id="header_main">
			<div id="main_inner">
				<div id="logo">
					<h1 style='font-size:22px;'><a>로고</a></h1>
				</div>
				<div id="nav_main">
					<ul>
						<li style='margin-right:40px;'><a>HOME</a></li>
						<li style='margin-right:40px;'><a>STYLE</a></li>
						<li style='margin-right:40px;'><a>SHOP</a></li>
						<li style='margin-right:40px;'><a>MY</a></li>
						<li><a><img src='${pageContext.request.contextPath}/resources/image/search.png' style='width:27px; height:27px;'></a></li>
					</ul>
				</div>
			</div>
		</div>		
	</body>
</html>