<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/popup/popup.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/popup/favorite_popup.css" rel="stylesheet"/>
</head>
<body>
	<!-- 팝업창 -->
	<div class="popup_wrap shopMain_popup_wrap" style="display:none">
		<div class="popup shopMain_popup">
			<div class="popup_head">
				<h2 class="popup_name">관심 상품 추가</h2>
				<div class="popup_cancel" id="cancel">X</div>
			</div>
			<div class="popup_contents">
				<div class="suggest_wrap">
					<div class="suggest_thumb_area">
						<img class="suggest_thumb" src="#">
					</div>
					<div class="suggest_info">
						<span class="model_title">${gv.goodsName}</span>
						<span class="model_info">${gv.goodsEng}</span>
					</div>
				</div>
				<ul class="status_item_list">
					<c:forEach var="sizeList" items="${sizeList}">
						<li class="status_item_fb">
							<input type="hidden" name="sizeNo" value="${sizeList.sizeNo}"/>
							<span class="item_size_fb" style="font-size:14px">${sizeList.sizeName}</span>
							<span class="item_price_fb">
								<c:choose>
									<c:when test="${sizeList.interestCheck == 1 && sizeList.memberNo == sessionScope.memberNo}">
										<img class="interestImg" src="${pageContext.request.contextPath}/resources/image/favorites2_on.png">
									</c:when>
									<c:otherwise>
										<img class="interestImg" src="${pageContext.request.contextPath}/resources/image/favorites2.png">
									</c:otherwise>
								</c:choose>
							</span>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>