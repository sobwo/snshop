<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
	<head>
		<link href="${pageContext.request.contextPath}/resources/css/popup/popup.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/popup/history_popup.css" rel="stylesheet"/>
	</head>
	<body>
		<div class="popup_wrap history_wrap" style="display:none">
		<div class="popup history_popup">
			<!-- 팝업 헤드 -->
			<div class="popup_head">
				<h2 class="popup_name" style="font-size:24px;">주문 정보</h2>
				<div class="popup_cancel popup_cancel_history">X</div>
			</div>
			<form name="frm">
				<div class="popup_contents">
					
				</div>
			</form>
		</div>
	</div>
	</body>
</html>