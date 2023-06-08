<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
	</head>
	<body>
		<div id="header_wrap">
			<jsp:include page="header_common.jsp"></jsp:include>
			<div id="header_down">
				<div id="down_inner">
					<ul>
						<li class="top_menu_list"><a href='${pageContext.request.contextPath}/style/style_following.do'>팔로잉</a></li>
						<li class="top_menu_list" style='margin-left:27px'><a href='${pageContext.request.contextPath}/style/style_discover.do'>인기글</a></li>
					</ul>
				</div>
			</div>	
		</div>
	</body>
</html>