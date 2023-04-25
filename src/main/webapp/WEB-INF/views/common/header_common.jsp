<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<li><a href='#'>고객센터</a></li>
					<li style='margin-left:24px'><a href='#'>관심상품</a></li>
					<li style='margin-left:24px'><a href='${pageContext.request.contextPath}/member/memberLogin.do'>로그인</a></li>
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
						<li style='margin-right:40px;'><a href='/'>HOME</a></li>
						<li style='margin-right:40px;'><a href='#'>STYLE</a></li>
						<li style='margin-right:40px;'><a href='#'>SHOP</a></li>
						<li style='margin-right:40px;'><a href='#'>MY</a></li>
						<li><a href='#'><img src='${pageContext.request.contextPath}/resources/image/search.png' style='width:27px; height:27px;'></a></li>
					</ul>
				</div>
			</div>
		</div>		
	</body>
</html>