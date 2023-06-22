<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
	<body>
	<!-- 이름 -->
		<div class="basic_wrap">
			<div class="basic_title_wrap">
				<!-- 이미지 파일 -->
					<c:set var="exp" value= "${od.productImg.substring(od.getProductImg().length()-3, od.getProductImg().length())}" />
					<c:set var="imgList" value="${fn:split(od.productImg, ',')}" />
					<c:choose>
						<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
							<c:forEach var="img" items="${imgList}">
								<img class="productImg" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
							</c:forEach>
						</c:when>
						<c:otherwise>
							<img class="productImg" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
						</c:otherwise>
					</c:choose>
				<div>
					<h3 class="basic_title">${od.goodsName}</h3>
					<h3 class="basic_title">${od.goodsEng}</h3>
				</div>
			</div>
		</div>
		
		<!-- 상품 정보 -->
		<div class="basic_wrap goods_info_wrap">
			<div class="order_info">
				<div class="order">
					<h4 class="title">주문 번호</h4>
					<div class="orderNum">${od.orderNum}</div>
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
					<h4 class="title">주문 가격</h4>
					<div>${od.totalPrice}</div>
				</div>
				<div class="order">
					<h4 class="title">주문자 전화번호</h4>
					<div>${od.memberPhone}</div>
				</div>
				<div class="order">
					<h4 class="title">배송 주소</h4>
					<div>${od.address}</div>
				</div>
			</div>
		</div>
		<!-- 환불 사유 팝업창 -->
		<div class="basic_wrap refund_info_wrap" style="display:none;">
			<div class="order">
				<h4 class="title">주문 번호</h4>
				<div class="orderNum" id="orderNum_r">${od.orderNum}</div>
			</div>
			<div class="order">
				<h4 class="title">주문 가격</h4>
				<div class="totalPrice" id="totalPrice">${od.totalPrice}</div>
			</div>
			<div class="order">
				<h4 class="title">환불 사유</h4>
				<div class="order_r">
					<div class="reason">
						<input type="radio" name="reason" value="단순변심">단순변심
					</div>
					<div class="reason">
						<input type="radio" name="reason" value="상품불량">상품불량
					</div>
					<div class="reason">
						<input type="radio" name="reason" value="배송지연">배송지연
					</div>
					<div class="reason">
						<input type="radio" name="reason" value="기타">기타
					</div>
				</div>
			</div>
		</div>
		<c:if test="${od.orderStatus eq '진행중'}">
			<div class="popup_bottom">
				<input type="button" class="basic_btn_1" value="주문취소"
					style="color:red; margin:0" onclick="cancel()">
			</div>
		</c:if>
		
			<div class="popup_bottom popup_bottom_r" style="display:none">
				<input type="button" class="basic_btn_1" value="환불 신청"
					style="color:red; margin:0" onclick="refund()">
			</div>
		<script>
			function cancel(){
				$(".goods_info_wrap").hide();
				$(".refund_info_wrap").show();
				$(".popup_bottom").hide();
				$(".popup_bottom_r").show();
			}
			
			function refund(){
				var orderNum = $("#orderNum_r").text();
				var reason = $("input[name=reason]").val();
				var checksum = $("#totalPrice").text();
				
				$.ajax({
					url: "${pageContext.request.contextPath}/order/orderCancel.do",		
					method: "POST",
					data : {"orderNum":orderNum,
							"reason":reason,
							"checksum":checksum},
					dataType: "json",
					success : function(data){
						console.log(data);
						if(data.value == 1) {
							alert("주문 취소 신청 완료되었습니다.");
							location.reload();
						}
						else alert("주문취소가 불가능합니다.");
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});	
			}
			
			/*******************************
				결제 취소(추후 관리자 페이지 코딩 후 할 것)
			********************************/
			function cancelPayments(){
				var orderNum = $("#orderNum_r").text();
				
				let data={
						impUid:orderNum,
						reason:reason,
						checksum:checksum
					};
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/Iamport/cancelIamport.do",
					data:JSON.stringify(data),
					contentType:"application/json; charset=utf-8",
					success: function(result){
					},
					error: function(result){
						alert("결제금액 환불 취소. 사유 : "+result.responseText);
					}
				});
}//cancelPayments

		</script>
	</body>
</html>