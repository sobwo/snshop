<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상품 상세 페이지</title>
	<link href=" ${pageContext.request.contextPath}/resources/css/shop/shopContents.css" rel="stylesheet">
	<style>	
		.nav_list:nth-child(3) a{
			font-weight:bold;
		}
	</style>
	</head>
	<body>
		<jsp:include page="popup/itemSize_popup.jsp"></jsp:include>
		<jsp:include page="popup/favorite_popup.jsp"></jsp:include>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<main class="main">
			<div class="container">
				<form class="product_area" name="frm">
				<!-- 상품 이미지 표시 -->
					<input type="hidden" name="goodsNo" value="${gv.goodsNo}">

					<input type="hidden" name="sizeName" class="sizeName" value="">

					<!-- <input type="hidden" name="size" value="" -->

					<div class="productImg_area">
						<div class="productImage">
							<img src="../" width="560px" height="560px">
							<div class="pre_btn">
								<button type="button" name="pre_btn">&#60;</button>
							</div>
							<div class="next_btn">
								<button type="button" name="next_btn">&#62;</button>
							</div>
						</div>
						<ul>
							<c:forEach var="pivList" items="${pivList}">
								<li><img src="">${pivList.imgFileName}</li>
							</c:forEach>
						</ul>
					</div>	
			<!-- 상품 가격 표시 -->
					<div class="productContents_area">
						<div class="productContents">
							<div class="brandName"><a href="#">${gv.goodsBrandName}</a></div>
							<div class="productName">
								<p>${gv.goodsName}</p>

								<p>${gv.goodsEng}</p>


							</div>
							<div class="sizePick">
								<div class="sizeTitle"><span>사이즈</span></div>
								<div class="size">

									<span class="size_view">사이즈 표시</span>
									<button type="button" class="sizePick_btn" name="sizePick">

									<span class="size_view">사이즈 표시
									 
									</span>
									<button class="sizePick_btn" name="sizePick">

										<img src="${pageContext.request.contextPath}/resources/image/downside.png">
									</button>
								</div>
							</div>
							<div class="price_area">
								<div class="priceTitle">
									<span>가격</span>
								</div>
								<div class="price">
									<span class="price_view"><fmt:formatNumber type='number' maxFractionDigits='3' value='${gv.price}' /></span>
								</div>
							</div>
						</div><!-- productContents -->
						<div class="btn_area">
							<button type="button" class="buyButton" name="buy_btn" onclick="buyButton();">구매</button>
							<button type="button" class="sellButton" name="sell_btn">판매</button>
							<button type="button" class="wish"><img class="wish_img" src="${pageContext.request.contextPath}/resources/image/favorites2.png"/>관심상품 <fmt:formatNumber type="number" maxFractionDigits="3" value="${gv.interestNum}" /></button>
						</div><!-- btn_area -->
						
						<div class="productInfo">
							<h3 class="product_sub">상품 정보</h3>
							<div class="productInfo_con">
								<div class="productInfo_1">
									<p>모델 번호</p>
									<span>${gv.modelNum}</span>
								</div>
								<div class="productInfo_1 productInfo_day">
									<p>출시일</p>
									<span>${gv.releaseDate}</span>
								</div>
								<div class="productInfo_1">
									<p>컬러</p>
									<span>${gv.color}</span>
								</div>
							</div>
						</div><!--productInfo-->
				<!-- 상품 구매시 주의사항 -->
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
				</form><!--product_area-->
			<!-- 추천상품 표시 -->
			
				<div class="otherProduct_area">
					<div class="o_sub">
						<h3 class="sub_h3">추천상품</h3>
					</div>
					<div class="o_contents">
						<c:forEach var ="reList" items="${recommentList}">
							<div class="o_product">
								<div class="o_product_img">
									<img src="${reList.imgFileName}" width="224px" height="224px">
								</div>
								<div class="o_info">
									<span>${reList.goodsName}</span>
								</div>
								<div class="o_price">
									<span>${reList.price} 원</span>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				
			<!-- 상품 리뷰(후기) -->
			
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
		<script src="${pageContext.request.contextPath}/resources/js/shop/shopContents.js"></script>
		<script type="text/javascript">
		
		function buyButton(){	

			var fm = document.frm;	
			
			fm.action = "${pageContext.request.contextPath}/order/orderAgree.do";
			fm.enctype ="multipart/form-data";
			fm.method= "get";
			fm.submit();
			return;
		};
		
	//즐겨찾기 버튼
		var wish = $(".wish");
		var popup_wrap_2 = $(".shopMain_popup_wrap");
		var status_item_fb = $(".status_item_fb");
		var size_view_fb = $(".size_view_fb");
		var price_view_fb = $(".price_view_fb");
		
		wish.click(function(){
			popup_wrap_2.show();
		});
		
		status_item_fb.on("click",function(){
			popup_wrap_2.hide();
			$(".wish_img").attr("src","${pageContext.request.contextPath}/resources/image/favorites2_on.png");
		});
		
		</script>
	</body>
</html>