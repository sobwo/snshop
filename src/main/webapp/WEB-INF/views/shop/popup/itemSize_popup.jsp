<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/popup/popup.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/popup/itemSize_popup.css" rel="stylesheet"/>
</head>
<body>
	<!-- 팝업창 -->
	<div class="popup_wrap shopContent_popup_wrap" style="display:none">
		<div class="popup shopContent_popup">
			<div class="popup_head">
				<h2 class="popup_name">사이즈</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<ul class="status_item_list">
					<c:forEach var="sizeList" items="${sizeList}">
						<li class="status_item_s">
							<span class="item_size_s" style="font-size:14px">${sizeList.sizeName}</span>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>