<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage_PitemCommon.css" rel="stylesheet"/>
		<style>
			#user_memberShip{
				width:975px;
				height:100px;
				padding:23px 0 23px 23px;
				border:1px solid #ebebeb;
				border-radius:10px;
				background:#fff;
				display:flex;
				justify-content: space-between;
			}
			
			#user_detail{
				height:100px;
				display:flex;
			}
			
			#user_thumb{
				width:100px;
				height:100px;
				margin-right:12px;
			}
			
			#user_thumb img{
				width:100%;
				height:100%;
			}
			
			#user_info{
				height:100px;
				width:220px;
			}
			
			#user_name{
				font-size:18px;
				color:#000;
			}
			
			#user_id{
				font-size:14px;
				color:rgba(34,34,34,.5);
			}
			
			.myPageBtn{
				display:inline-block;
				height:36px;
				background:#fff;
				border:1px solid #d3d3d3;
				border-radius:10px;
				padding:0 14px;
				margin-top:12px;
			}
			
			#memberShip_detail{
				width:318px;
				height:100px;
				display:flex;
			}
			
			.memberShip_item{
				width:159px;
				height:100px;
				display:flex;
				justify-content:center;
				flex-direction:column;
				align-items:center;
			}
				
			.info, .title{
				display:block;
				width:159px;
				text-align:center;
			}
			
			.title{
				font-size:13px;
				color:rgba(34,34,34,.5);
			}
			
			.myHome_title_wrap{
				width:1000px;
				height:26px;
				padding-bottom:16px;
				margin-top:80px;
				display:flex;
				justify-content:space-between;
			}
			
			.myHome_title_wrap > a > span{
				font-size:15px;
				color:rgba(34,34,34,.5);
			}
			
			.myHomeTitle{
				font-size:18px;
			}
			
			.purchase_list_wrap{
				background:#fafafa;
				border-radius:12px;
				height:96px;
				display:flex;
				justify-content:space-around;
			}
			
			.purchase_item{
				width:33%;
				height:100%;
				display:flex;
				flex-direction:column;
				justify-content:center;
				align-items:center;
			}
			
			.purchase_item a{
				display:flex;
				flex-direction:column;
				justify-content:center;
				align-items:center;
			}
			
			.purchase_cnt_1, .purchase_title, .purchase_cnt{
				font-size:15px;
				text-align:center;
			}
			
			.purchase_cnt_1{
				color:#f15746;
			}
			
			.purchase_cnt, .purchase_cnt_1{
				margin-top:2px;
				font-size:18px;
				font-weight:bold;
			} 
			
			.purchase_contents_wrap{
				padding:20px 0;
				border-bottom:2px solid #e4e4e4;
			}
			
			.product_item{
				width:231px;
				padding:20px 12px;
				cursor:pointer;
			}
			
			.item_thumb{
				width:231px;
				height:256px;
				position:relative;
			}
			
			.item_thumb img{
				width:100%;
				height:100%;
			}
			
			.favorite_thumb{
				width:25px;
				height:20px;
				position:absolute;
				right:10px;
				bottom:10px;
			}
			
			.favorite_thumb img{
				width:100%;
				height:100%;
			}
			
			.item_info{
				width:231px;
				padding-top:10px;
			}
			
			.item_name, .item_contents{
				font-size:13px;
				padding-bottom:5px;
			}
			
			.item_name{
				font-weight:bold;
				
			}
			
			.item_price{
				font-size:14px;
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
					<div id="user_memberShip">
						<div id="user_detail">
							<div id="user_thumb">
								<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
							</div>
							<div id="user_info">
								<strong id="user_name">이름</strong>
								<p id="user_id">ID</p>
								<input type="button" class="myPageBtn" value="프로필 수정">
								<input type="button" class="myPageBtn" value="내 스타일">
							</div>
						</div>
						<div id="memberShip_detail">
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
						<a href='#'><span>더보기 &rarr;</span></a>
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