<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상품 상세 페이지</title>
	<link href=" ${pageContext.request.contextPath}/resources/css/shop/shopContents.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="popup/shopContent_popup.jsp"></jsp:include>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<main class="main">
			<div class="container">
				<div class="product_area">
					<div class="productImg_area">
						<div class="productImage">
							<img src="../" width="560px" height="560px">
							<div class="pre_btn">
								<button name="pre_btn">&#60;</button>
							</div>
							<div class="next_btn">
								<button name="next_btn">&#62;</button>
							</div>
						</div>
						<ul>
							<li><img src=""></li>
							<li><img src=""></li>
							<li><img src=""></li>
							<li><img src=""></li>
						</ul>
					</div>
					<div class="productContents_area">
						<div class="productContents">
							<div class="brandName"><a href="#">jordan</a></div>
							<div class="productName">
								<p>Jordan 1 Retro High OG Chicago</p> 
								<p>2022조던 1 레트로 하이 OG 시카고 2022</p>
							</div>
							<div class="sizePick">
								<div class="sizeTitle"><span>사이즈</span></div>
								<div class="size">
									<a>
										<span class="size_view">사이즈 표시</span>
										<button class="sizePick_btn" name="sizePick"><img src="${pageContext.request.contextPath}/resources/image/downside.png"></button>
									</a>
								</div>
							</div>
							<div class="price_area">
								<div class="priceTitle"><span>가격</span></div>
								<div class="price"><span class="price_view">123123</span></div>
							</div>
						</div>
						
						<div class="btn_area">
							<button class="sellButton" name="buy_btn" type="button">구매</button>
							<button class="buyButton" name="sell_btn">판매</button>
							<button class="wish"><img src="${pageContext.request.contextPath}/resources/image/favorites2.png">관심상품 123</button>
						</div>
						
						<div class="productInfo">
							<h3 class="product_sub">상품 정보</h3>
							<div class="productInfo_con">
								<div class="productInfo_1">
									<p>모델 번호</p>
									<span>123123</span>
								</div>
								<div class="productInfo_1 productInfo_day">
									<p>출시일</p>
									<span>123123</span>
								</div>
								<div class="productInfo_1">
									<p>컬러</p>
									<span>123123</span>
								</div>
							</div>
						</div><!--productInfo-->
						<div class="confirm">
							<h3>구매 전 꼭 확인해주세요!</h3>
							<div>	
								<ul>
									<li>
										<div class="dropDownHead">
											<p>배송 기간 안내</p>
											<img>
										</div>
										<div class="dropDownContents">
											<ul>
												<li></li>
											</ul>
										</div>	
									</li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</div><!--confirm-->
					</div><!--productContents_area-->
				</div><!--product_area-->
				
				<div class="otherProduct_area">
					<div class="o_sub">
						<h3 class="sub_h3">추천상품</h3>
					</div>
					<div class="o_contents">
						<div class="o_product">
							<div class="o_product_img">
								<img src="" width="224px" height="224px">
							</div>
							<div class="o_info">
								<span>Jordan 1 Retro High OG Chicago 2022</span>
							</div>
							<div class="o_price">
								<span>420,000원</span>
							</div>
						</div>
					</div>
				</div>
					
				<div class="feed_area">
					<h3 class="sub_h3">리뷰(스타일)<span>123</span></h3>
					
					<div class="feed_contents_area" onclick="">
						
						<div class="feed_img">
							<img src=""  width="279px" height="279px">
						</div>
						<div class="feed">
							<div class="feed_user">
								<div class="user_info">
									<img src=""  width="26px" height="26px">
									<p>ID</p>
								</div>
								<span><img src="">23</span>
							</div>
							<div class="feed_con">
								<p>#KREAM챌린지 #스타일챌린지 #하트챌린지 #빈티지 #시카고2022</p>
							</div>
						</div>
						
					</div>
				</div>
				<div class="more_btn_area">
					<button>더보기</button>
				</div>
			</div>
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){});
			
			var sizePick_btn = $(".sizePick_btn");
			var popup_cancel = $(".popup_cancel");
			var popup_wrap = $(".shopContent_popup_wrap");
			var status_item = $(".status_item");
			var size_view = $(".size_view");
			var price_view = $(".price_view");
			
			popup_wrap.css('height',window.outerHeight);
			
			sizePick_btn.click(function(){
				popup_wrap.show();
			});
			
			popup_cancel.click(function(){
				popup_wrap.hide();
			});
			
			status_item.on("click",function(){
				size_view.text($(this).find('span.item_size').text());
				price_view.text($(this).find('span.item_price').text());
				popup_wrap.hide();
			});
				
		</script>
	</body>
</html>