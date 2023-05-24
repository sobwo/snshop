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
	<div id="admin_point_popup_wrap" class="popup_wrap point_popup_wrap" style="display:none">
		<div class="popup point_popup" style="height:400px">
			<!-- 포인트 헤더 -->
			<div class="popup_head">
				<h2 class="popup_name">쿠폰 등록</h2>
				<div class="popup_cancel">X</div>
			</div>
			
			<!-- 쿠폰 입력 -->
			<form name="frm_admin">
				<div class="popup_contents">
					<div class="input_box">
						<h4 class="input_box_title">쿠폰 이름</h4>
						<input type="text" class="input_item" name="couponName" placeholder="쿠폰 이름을 입력하세요.">
						<h4 class="input_box_title">쿠폰 코드</h4>
						<input type="text" class="input_item" name="couponNum" placeholder="쿠폰 코드를 입력하세요.">
						<h4 class="input_box_title">포인트</h4>
						<input type="text" class="input_item" name="point" placeholder="적용 포인트를 입력하세요.">
						<h4 class="input_box_title">유효기간</h4>
						<input type="text" class="input_item" name="usePeriod" placeholder="날짜를 입력하시오 EX)2023-05-10">
					</div>
				</div>
			</form>
			<!-- 버튼 -->
			<div class="popup_bottom">
				<input type="button" class="basic_btn_1" value="취소">
				<input type="button" class="basic_btn_2" value="저장하기" onclick="addCoupon()" style="background:#222">
			</div>
		</div>
	</div>
</body>
</html>