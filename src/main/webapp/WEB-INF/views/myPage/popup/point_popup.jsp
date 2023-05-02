<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/popup/popup.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/popup/point_popup.css" rel="stylesheet"/>
</head>
<body>
	<!-- 팝업창 -->
	<div class="popup_wrap point_popup_wrap" style="display:none">
		<div class="popup point_popup">
			<div class="popup_head">
				<h2 class="popup_name">포인트 적립</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<div class="input_box">
					<h4 class="input_box_title">포인트 코드</h4>
					<input type="text" class="input_item" id="coupon" name="coupon" placeholder="쿠폰 코드를 입력하세요.">
					<div class="description">
						<span> • 유효기간이 지난 쿠폰 코드는 등록이 불가합니다.</span>
						<span> • 쿠폰에 따라 발급 수량 및 계정당 사용 횟수가 제한될 수 있습니다. </span>
					</div>
				</div>
			</div>
			<div class="popup_bottom">
				<input type="button" class="basic_btn_1" value="취소">
				<input type="button" class="basic_btn_2" disabled="disabled" value="저장하기">
			</div>
		</div>
	</div>
</body>
</html>