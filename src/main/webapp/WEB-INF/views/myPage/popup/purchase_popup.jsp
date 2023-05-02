<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/popup/popup.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/popup/purchase_popup.css" rel="stylesheet"/>
</head>
<body>
	<!-- 팝업창 -->
	<div class="popup_wrap search_filter_popup_wrap ing_popup" style="display:none">
		<div class="popup search_filter_popup">
			<div class="popup_head">
				<h2 class="popup_name">선택한 상태 보기</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<ul class="status_item_list">
					<li class="status_item"><span style="font-weight:bold">전체</span></li>
					<li class="status_item"><span>입금대기</span></li>
					<li class="status_item"><span>입금완료</span></li>
					<li class="status_item"><span>상품준비중</span></li>
					<li class="status_item"><span>발송완료</span></li>
					<li class="status_item"><span>배송중</span></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="popup_wrap search_filter_popup_wrap end_popup" style="display:none">
		<div class="popup search_filter_popup">
			<div class="popup_head">
				<h2 class="popup_name">선택한 상태 보기</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<ul class="status_item_list">
					<li class="status_item"><span style="font-weight:bold">전체</span></li>
					<li class="status_item"><span>대기중</span></li>
					<li class="status_item"><span>배송완료</span></li>
					<li class="status_item"><span style="color:#f00">취소완료</span></li>
					<li class="status_item"><span>반품준비중</span></li>
					<li class="status_item"><span>교환완료</span></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="popup_wrap search_filter_popup_wrap sale_end_popup" style="display:none">
		<div class="popup search_filter_popup">
			<div class="popup_head">
				<h2 class="popup_name">선택한 상태 보기</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<ul class="status_item_list">
					<li class="status_item"><span style="font-weight:bold">전체</span></li>
					<li class="status_item"><span>정산 완료</span></li>
					<li class="status_item"><span style="color:#f00">취소완료</span></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>