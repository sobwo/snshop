<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
	<head>
	</head>
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
		<div class="basic_wrap">
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
					<h4 class="title">주문자 전화번호</h4>
					<div>${od.memberPhone}</div>
				</div>
				<div class="order">
					<h4 class="title">배송 주소</h4>
					<div>${od.zipCode}&nbsp;&nbsp;${od.address}&nbsp;&nbsp;${od.detailAddress}</div>
				</div>
			</div>
		</div>
		<c:if test="${od.orderStatus eq '진행중'}">
			<div class="popup_bottom">
				<input type="button" class="basic_btn_1" value="주문취소"
					style="color:red" onclick="cancel('${od.orderNum}','${od.statusDetail}')">
			</div>
		</c:if>
		<script>
// 			$(".basic_btn_1").on("click",function(){
// 				var orderNum = $(".orderNum").text();
			function cancel(orderNum,statusDetail){
				$.ajax({
					url: "${pageContext.request.contextPath}/order/orderCancel.do",		
					method: "POST",
					data : {"orderNum":orderNum},
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
		</script>
	</body>
</html>