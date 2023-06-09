<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
	</head>
	<body>
		<div id="top_inner">
			<div id="top_menu">
				<ul>
					<li><a href='${pageContext.request.contextPath}/customerCenter/customerCenterMain.do'>고객센터</a></li>
					<li style='margin-left:24px'><a href='${pageContext.request.contextPath}/myPage/interest.do'>관심상품</a></li>
					<c:choose>
						<c:when test="${sessionScope.memberNo == null}">
							<li style='margin-left:24px'><a href='${pageContext.request.contextPath}/member/memberLogin.do'>로그인</a></li>
						</c:when>
						<c:otherwise>
							<li style='margin-left:24px'><a href='${pageContext.request.contextPath}/member/memberLogOut.do'>로그아웃</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<div id="header_main">
			<div id="main_inner">
				<div id="logo">
					<h1 style='font-size:22px;'><a href="${pageContext.request.contextPath}/style/style_discover.do">TLING</a></h1>
				</div>
				<div id="nav_main">
					<ul>
						<li class="nav_list" style='margin-right:40px;'><a href='${pageContext.request.contextPath}/'>HOME</a></li>
						<li class="nav_list" style='margin-right:40px;'><a href='${pageContext.request.contextPath}/style/style_discover.do'>STYLE</a></li>
						<li class="nav_list" style='margin-right:40px;'><a href='${pageContext.request.contextPath}/shop/shopMain.do'>SHOP</a></li>
						<li class="nav_list" style='margin-right:40px;'><a href='${pageContext.request.contextPath}/myPage/myPageMain.do'>MY</a></li>
						<c:set var = "role" value ="${sessionScope.role}" />
						<c:if test = "${role eq 'admin'}" >
							<li class="nav_list" style='margin-right:40px;'><a href='${pageContext.request.contextPath}/admin/adminMain.do'>관리자 페이지</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>		
	</body>
</html>