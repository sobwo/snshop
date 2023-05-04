<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관심 상품</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_purchase.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_PitemCommon.css" rel="stylesheet"/>
		<style>
			.shopping_info_list li:nth-child(3) a{
				color:#222;
				font-weight:bold;
			}
			.content_title_on{
				margin-bottom:20px;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<!-- 관심상품 헤더 -->
					<div class="content_title content_title_on">
						<h3>관심 상품</h3>
					</div>
					
					<!-- 관심상품 컨텐츠 -->
					<div class="purchase_contents_wrap">
						<div class="purchase_contents purchase_contents_interest">
							<div class="purchase_detail">
								<div class="purchase_thumb">
									<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
								</div>
								<div class="purchase_info">
									<strong class="purchase_name">제품 이름</strong>
									<p class="purchase_price purchase_price_interest">제품 내용</p>
									<p class="purchase_size purchase_size_interest">250</p>
								</div>
							</div>
							<div class="interest_btn_wrap">
								<div class="interest_btn">
									<div class="btn_left">구매</div>
									<div class="btn_right">가격</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/purchase_menu.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/calander.js"></script>
		<script>
		</script>
	</body>
</html>