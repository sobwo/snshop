<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
	<!-- 이름 -->
		<div class="basic_wrap">
			<div class="basic_title_wrap">
				<img class="productImg" alt="상품 이미지" src="">
				<div>
					<h3 class="basic_title">${od.goodsName}</h3>
					<h3 class="basic_title">${od.goodsEng}</h3>
				</div>
			</div>
		</div>
		
		<!-- 상품 정보 -->
		<div class="basic_wrap">
			<div class="order_info">
				<div class="order">
					<h4 class="title">주문 번호</h4>
					<div>${od.orderNum}</div>
				</div>
				<div class="order">
					<h4 class="title">사이즈</h4>
					<div>${od.size}</div>
				</div>
				<div class="order">
					<h4 class="title">주문 날짜</h4>
					<div>${od.orderDays}</div>
				</div>
				<div class="order">
					<h4 class="title">주문자 전화번호</h4>
					<div>${od.memberPhone}</div>
				</div>
				<div class="order">
					<h4 class="title">배송 주소</h4>
					<div>${od.zipCode}&nbsp;&nbsp;${od.address}&nbsp;&nbsp;${od.detailAddress}</div>
				</div>
			</div>
		</div>	
		<div class="popup_bottom">
			<input type="button" class="basic_btn_1" value="주문취소"
				style="color:red">
		</div>
	</body>
</html>