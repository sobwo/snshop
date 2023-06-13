<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<div class="product_count">
			<span>상품수</span>
			<span id="productNum">
				<fmt:formatNumber type="number" maxFractionDigits="3" value="${total}" />
			</span>
		</div>
		<div class="product_area">
			<c:forEach var="goodsList" items="${goodsList}" varStatus="status">
				<div class="product_item_wrap">
					<div class="product_item" onclick="location.href='${pageContext.request.contextPath}/shop/shopContents.do?goodsNo=${goodsList.goodsNo}'">
						<div class="pro_img_area">
						<c:set var="exp" value= "${goodsList.productImg.substring(goodsList.getProductImg().length()-3, goodsList.getProductImg().length())}" />
							<c:set var="imgList" value="${fn:split(goodsList.productImg, ',')}" />
							<c:choose>
								<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
									<c:forEach var="img" items="${imgList}">
										<img class="pro_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
									</c:forEach>
								</c:when>
								<c:otherwise>
									<img class="pro_img" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="pro_name_area">
							<ul>
								<li class="pro_brand" >"${goodsList.goodsBrandName}"</li>
								<li class="pro_name1" >${goodsList.goodsName}"</li>
								<li class="pro_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${goodsList.price}" />원</li>
							</ul>
						</div>
					</div><!-- product_item -->
					<div class="pro_icon_area">
						<input type="hidden" name="goodsNo" id="${goodsList.goodsNo}">
						<span class="wish_btn" onclick="interest_popup('${goodsList.goodsNo}')">
							<c:choose>
									<c:when test="${goodsList.checkM == 1 && goodsList.memberNo == sessionScope.memberNo}">
										<img class="wish_img" src="${pageContext.request.contextPath}/resources/image/favorites2_on.png">
									</c:when>
									<c:otherwise>
										<img class="wish_img" src="${pageContext.request.contextPath}/resources/image/favorites2.png">
									</c:otherwise>
								</c:choose>
						</span>
						<span class="interestNum">${goodsList.interestNum}</span>
						<span class="review_btn"><img src="${pageContext.request.contextPath}/resources/image/writing.png"></span>
						<span>123</span>
					</div>
				</div><!-- product_item_wrap -->
			</c:forEach>
		</div>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
		function interest_popup(goodsNo){
			$("input[name=goodsNo]").val(goodsNo);
			$(".shopMain_popup_wrap").show();
			$.ajax({
		        type: "GET",
		        url: "${pageContext.request.contextPath}/shop/interestShow.do",
		        data: {
					"goodsNo" : goodsNo,
		        	},
		        cache: false,
		        success: function(data) {
		        	console.log(data);
		        	$(".shopMain_popup_wrap").html(data);
		        },
		        error: function() {
		        }

			});
		}
		</script>
	</body>
</html>