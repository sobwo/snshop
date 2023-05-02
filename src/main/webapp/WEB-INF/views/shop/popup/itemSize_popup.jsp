<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<li class="status_item_s">
						<span class="item_size_s" style="font-size:14px">모든사이즈</span>
						<span class="item_price_s" style="color:#f00;font-size:12px">가격</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>