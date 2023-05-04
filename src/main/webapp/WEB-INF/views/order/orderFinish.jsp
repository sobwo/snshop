<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<link href=" ${pageContext.request.contextPath}/resources/css/order/orderFinish.css" rel="stylesheet">
	 
</head>
	<body>
		<div id="top_inner">
			<div id="top_menu">
				<ul>
					<li><a>고객센터</a></li>
					<li style='margin-left:24px'><a>관심상품</a></li>
					<li style='margin-left:24px'><a>로그인</a></li>
					<li><a>로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div id="header_main">
			<div id="main_inner">
				<div id="logo">
					<h1 style='font-size:22px;'><a>로고</a></h1>
				</div>
			</div>
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
							<p class="payTotalNumber">원</p>
						</div>		
					</div>
					<div class="buyProduct">
						<img class="buyItem" src=""/>
						<div class="buyInfo">
							<strong class="modelNumber">123456789</strong>
							<p class="modelName">조던 1 레트로 하이 OG 시카고</p>
							<p class="modelSize">230</p>
						</div>				
					</div>
					<div class="orderFinishBtn">
						<input type="button" name="orderFinish" id="orderFinish" value="확 인" onclick="location.href='${pageContext.request.contextPath}/'">
					</div>	
				</div>
			</div>	
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	</body>
</html>