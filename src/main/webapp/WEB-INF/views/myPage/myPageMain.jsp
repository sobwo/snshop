<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_PitemCommon.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_main.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div class="user_memberShip">
						<div class="user_detail">
							<div class="user_thumb">
								<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
							</div>
							<div class="user_info">
								<strong class="user_name">이름</strong>
								<p class="user_id">ID</p>
								<input type="button" class="myPageBtn" value="프로필 수정">
								<input type="button" class="myPageBtn" value="내 스타일">
							</div>
						</div>
						<div class="memberShip_detail">
							<div class="memberShip_item" style="border-right:1px solid #ebebeb">
								<strong class="info">일반 회원</strong>
								<p class="title">회원 등급</p>
							</div>
							<div class="memberShip_item">
								<a>
									<strong class="info">0P</strong>
									<span class="title">포인트</span>
								</a>
							</div>
						</div>
					</div>
					<div class="myHome_title_wrap">
						<h3 class="myHomeTitle">구매 내역</h3>
						<a href='${pageContext.request.contextPath}/myPage/purchase.do'><span>더보기 &rarr;</span></a>
					</div>
					<div class="recent_purchase">
						<div class="purchase_list_wrap">
							<div class="purchase_item">
								<a>
									<span class="purchase_title">전체</span>
									<span class="purchase_cnt_1">0</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">진행중</span>
									<span class="purchase_cnt">0</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">종료</span>
									<span class="purchase_cnt">0</span>
								</a>
							</div>
						</div>
						<div class="purchase_contents_wrap">
							<div class="purchase_contents">
								<div class="purchase_detail">
									<div class="purchase_thumb">
										<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
									</div>
									<div class="purchase_info">
										<strong class="purchase_name">제품 이름</strong>
										<p class="purchase_size">250</p>
									</div>
								</div>
								<div class="delivery_info">
									<p class="delivery_status">대기중</p>
								</div>
							</div>
						</div>
					</div>
					<div class="myHome_title_wrap">
						<h3 class="myHomeTitle">판매 내역</h3>
						<a href='${pageContext.request.contextPath}/myPage/sale.do'><span>더보기 &rarr;</span></a>
					</div>
					<div class="recent_purchase">
						<div class="purchase_list_wrap">
							<div class="purchase_item">
								<a>
									<span class="purchase_title">전체</span>
									<span class="purchase_cnt_1">0</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">진행중</span>
									<span class="purchase_cnt">0</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">종료</span>
									<span class="purchase_cnt">0</span>
								</a>
							</div>
						</div>
						<div class="purchase_contents_wrap">
							<div class="purchase_contents">
								<div class="purchase_detail">
									<div class="purchase_thumb">
										<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
									</div>
									<div class="purchase_info">
										<strong class="purchase_name">제품 이름</strong>
										<p class="purchase_size">250</p>
									</div>
								</div>
								<div class="delivery_info">
									<p class="delivery_status">대기중</p>
								</div>
							</div>
						</div>
					</div>
					<div class="myHome_title_wrap">
						<h3 class="myHomeTitle">관심 상품</h3>
						<a href='${pageContext.request.contextPath}/myPage/interest.do'><span>더보기 &rarr;</span></a>
					</div>
					<div class="recent_purchase" style="display:flex; justify-content:space-between">
						<div class="product_item" onclick="location.href='/shop/shopMain.do'">
							<div class="item_thumb">
								<img src="#" alt="상품이미지" />
								<div class="favorite_thumb">
									<img src="${pageContext.request.contextPath}/resources/image/favorites2.png" alt="즐겨찾기 버튼" />
								</div>
							</div>
							<div class="item_info">
								<div class="item_name">상품 이름</div>
								<div class="item_contents">상품 설명</div>
								<div class="item_price">가격</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>