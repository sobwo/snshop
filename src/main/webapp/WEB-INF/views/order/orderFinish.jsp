<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<link href=" ${pageContext.request.contextPath}/resources/css/order/orderFinish.css" rel="stylesheet">
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
		<div class="orderFinishContainer">
			<div class="orderFinishContent">
				<div class="orderFinishBox">
					<div class="orderFinisTitle">
						<h2>
							주문 결제가 <span class="accentTitle">완료</span> 되었습니다.				
						</h2>
					</div>
					<div class="pay">
						<div class="payText">
							<p class="payTotal">결제 금액</p>
						</div>	
						<div class="payNumber">
					
							<p class="payTotalNumber">	<fmt:formatNumber type='number' maxFractionDigits='3' value='${od.totalPrice}'/>원</p>
						</div>		
					</div>
					<div class="buyProduct">
						<c:set var="exp" value= "${od.productImg.substring(od.getProductImg().length()-3, od.getProductImg().length())}" />
						<c:set var="imgList" value="${fn:split(od.productImg, ',')}" />
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
							<strong class="modelNumber">${od.goodsEng} </strong>
							
							<p class="modelName">  	${od.goodsName}</p>
							<p class="modelSize">${od.size} </p>
						</div>			
					</div>
					<c:if test="${pmv.payMethod eq 'vbank'}">
						<div class="vBankInfo">
							<div>
								<span>입금 은행</span>
								<p class="vBankName">${pmv.bankName}</p>
							</div>
							<div>
								<span>입금 계좌번호</span><p class="vBankNum">${pmv.bankNum}</p>
							</div>
							<div> <!-- 원래 pv. -->
								<span>입금 기한</span><p class="vBankDate">${pmv.date} 까지</p>
							</div>
						</div>
					</c:if>	
					<div class="orderFinishBtn">
						<input type="button" name="orderFinish" id="orderFinish" value="확 인" onclick="location.href='${pageContext.request.contextPath}/'">			
					</div>	
				</div>
			</div>	
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>	

	</body>
</html>