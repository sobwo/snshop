<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/popup/popup.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/popup/shopMain_popup.css" rel="stylesheet"/>
</head>
<body>
	<!-- 팝업창 -->
	<div class="popup_wrap shopMain_popup_wrap" style="display:none">
		<div class="popup shopMain_popup">
			<div class="popup_head">
				<h2 class="popup_name">관심 상품 추가</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<div class="suggest_wrap">
					<div class="suggest_thumb_area">
						<img class="suggest_thumb" src="#">
					</div>
					<div class="suggest_info">
						<span class="model_title">이름</span>
						<span class="model_info">상세설명</span>
					</div>
				</div>
				<ul class="status_item_list">
					<li class="status_item">
						<span class="item_size" style="font-size:14px">사이즈</span>
						<span class="item_price"><img src="${pageContext.request.contextPath}/resources/image/favorites2.png"></span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>