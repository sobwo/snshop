<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	</head>
	<body>
		<c:forEach var="goodsList" items="${goodsList}" varStatus="status">
			<div class="product_item_wrap">
				<div class="product_item" onclick="location.href='${pageContext.request.contextPath}/shop/shopContents.do?goodsNo=${goodsList.goodsNo}'">
					<div class="pro_img_area">
					${goodsList.imgFileName}
						<img class="pro_img" src="">
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
					<span class="wish_btn"><img class="wish_img" src="${pageContext.request.contextPath}/resources/image/favorites2.png"></span>
					<span>${goodsList.interestNum}</span>
					<span class="review_btn"><img src="${pageContext.request.contextPath}/resources/image/writing.png"></span>
					<span>123</span>
				</div>
			</div><!-- product_item_wrap -->
		</c:forEach>
	</body>
</html>