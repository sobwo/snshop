<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>구매 동의</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<link href=" ${pageContext.request.contextPath}/resources/css/order/orderAgree.css" rel="stylesheet">
		<style>
			.nav_list:nth-child(3) a{
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="purchaseContainer">
			<div class="buyContent">
				<div class="buyBox">
					<div class="buyTitle">
						<h2>
							<span class="accentTitle">구매</span>
							하시기 전에 꼭 확인하세요.					
						</h2>
					</div>
					<div class="buyProduct">
						<c:set var="exp" value= "${gv.productImg.substring(gv.getProductImg().length()-3, gv.getProductImg().length())}" />
						<c:set var="imgList" value="${fn:split(gv.productImg, ',')}" />
						<c:choose>
							<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
								<c:forEach var="img" items="${imgList}">
									<img class="buyItem" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
								</c:forEach>
							</c:when>
							<c:otherwise>
								<img class="buyItem" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
							</c:otherwise>
						</c:choose>
						<div class="buyInfo">
							<strong class="modelNumber">${gv.goodsEng} </strong>
							<%-- <strong class="modelNumber"><fmt:formatNumber type='number' maxFractionDigits='3' value='${gv.price}'/></strong> --%>
							<p class="modelName">${gv.goodsName}</p>
							<%-- <p class="modelName">${gv.price}</p> --%>
							<p class="modelSize">${sizeName}</p>
						</div>				
					</div>
					<div class="cab">					
						<button id="checkAllBtn">모두  체크 </button>
					</div>
					<div class="buyCheckBox">
					<ul class="checkList">
						<li>
							<div class="notice">
								<p class="noticeMain">구매하려는 상품이 맞습니다.</p>
								<p class="noticeSub">상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한번 더 확인했습니다.</p>
							</div>
							<div class="checkboxWrap">
								<input type="checkbox" name="checkbox1" id="checkbox1">
							</div>
						</li>
						<li>
							<div class="notice">
								<p class="noticeMain">제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</p>
								<p class="noticeSub">박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.</p>
							</div>
							<div class="checkboxWrap">
								<input type="checkbox" name="checkbox2" id="checkbox2">
							</div>
						</li>
						<li>
							<div class="notice">
								<p class="noticeMain">최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.</p>
								<p class="noticeSub">건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 패널티, 부정거래 등의 이용정책을 확인했습니다.</p>
							</div>
							<div class="checkboxWrap">
								<input type="checkbox" name="checkbox3" id="checkbox3">
							</div>
						</li>
					</ul>
					<div class="confirmBtn">
						<input type="button" name="buyContinue" id="buyContinue" value="구매 계속" disabled="disabled" onclick="location.href='${pageContext.request.contextPath}/order/orderPage.do?goodsNo=${gv.goodsNo}&sizeName=${sizeName}'">
					</div>
				</div>
				</div>	
			</div>
		</div>	
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/order/orderAgree.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	</body>
</html>