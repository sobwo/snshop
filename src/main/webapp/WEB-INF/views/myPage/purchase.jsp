<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>구매내역</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPagePurchase.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage_PitemCommon.css" rel="stylesheet"/>
		<style>
			.shopping_info_list li:nth-child(1) a{
				color:#222;
				font-weight:bold;
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
					<div class="content_title">
						<h3>구매 내역</h3>
					</div>
					<div class="purchase_category">
						<div class="tab_category category_first">
							<div class="tab_count count_first">0</div>
							<div class="tab_title title_first">전체</div>
						</div>
						<div class="tab_category">
							<div class="tab_count">0</div>
							<div class="tab_title">진행중</div>
						</div>
						<div class="tab_category">
							<div class="tab_count">0</div>
							<div class="tab_title">종료</div>
						</div>
					</div>
					<div class="period_search">
						<ul class="month_btn_area">
							<li><input type="button" class="month_link" value="최근 2개월"></li>
							<li><input type="button" class="month_link" value="4개월"></li>
							<li><input type="button" class="month_link" value="6개월"></li>
						</ul>
						<div class="calander_area">
							<input type="date" class="calander">
							<span>~</span>
							<input type="date" class="calander">
						</div>
						<div>
							<input type="button" class="btn_search" value="조회">
						</div>
					</div>
					<div class="search_info">
						<p>&#183;&nbsp;한 번에 조회 가능한 기간은 최대 6개월입니다.</p>
						<p>&#183;&nbsp;기간별 조회 결과는 결제일 기준으로 노출됩니다.</p>
					</div>
					<div class="search_head">
						<div class="search_filter">
							<span class="search_filter_txt">전체</span>
							<span class="downside_img"><img src="${pageContext.request.contextPath}/resources/image/downside.png"></span>
						</div>
						<div class="price_filter">
							<span class="price_txt">구매 금액&nbsp;<img class="price_btn_img" src="${pageContext.request.contextPath}/resources/image/triangle.png"></span>
						</div>
					</div>
					<div class="purchase_contents">
						<div class="purchase_detail">
							<div class="purchase_thumb">
								<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
							</div>
							<div class="purchase_info">
								<strong class="purchase_name">제품 이름</strong>
								<p class="purchase_price">결제 가격</p>
								<p class="purchase_size">250</p>
							</div>
						</div>
						<div class="delivery_info">
							<p class="delivery_status">대기중</p>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/purchase_menu.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/calander.js"></script>
		<script>
// 			var price = $(".price_txt");
// 			var btn_img = $(".price_btn_img");
			
// 			price.click(function(){
// 				btn_img.attr("src", imgurl);
// 			});
		</script>
	</body>
</html>