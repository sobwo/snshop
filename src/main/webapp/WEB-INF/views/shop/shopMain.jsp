<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SHOP 메인페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/shop/shopMain.css" rel="stylesheet"/>
	</head>
	<body>
		<jsp:include page="popup/favorite_popup.jsp"></jsp:include>
		<div id="header_wrap" style='height:191px;border:0'>
			<jsp:include page="../common/header_shop.jsp"></jsp:include>
		</div>
		<div class="inner">
			<main class="main_area">
			
	<!-- 상단 트랜드 상품 리스트 -->
				<section class="trend_container">
					<div class="trend_con_area">
						<div class="trendContents">
							<div class="trendImg">
								<img src="" width="90px" height="90px">
							</div><!-- trendImg -->
							<div class="trendName">
								<span>반팔</span>
							</div><!-- trendName -->
						</div>
										
					</div><!-- trend_con_area -->
					
					<div class="trend_btn_area">
						<button class="trend_pre_btn"><img src="${pageContext.request.contextPath}/resources/image/화살표.png" width="30px" height="30px"></button>
						<ul class="trend_btn_ul">
							<li class="trend_list"><button>0</button></li>
							<li class="trend_list"><button>1</button></li>
							<li class="trend_list"><button>2</button></li>
						</ul>
						<button class="trend_next_btn"><img src="${pageContext.request.contextPath}/resources/image/화살표.png" width="30px" height="30px"></button>
					</div><!-- trend_btn_area -->
				</section><!-- trend_container -->
	<!-- 좌측 필터  -->
				<section class="product_container">
					<aside class="aside_area">
						<div class="filter_area">
							<div class="filter_title title_first">
								<div class="filterName">
									<span>필터</span>
									<span>1</span>
								</div><!-- filterName -->
								<a href="#" class="reset">초기화</a>
							</div><!-- filter_title -->
							
							<div class="filter_title">
								<div class="title_area">
									<div class="filterName1">
										<span>카테고리</span>
										<span class="filter_allSelect">모든 카테고리</span>
									</div><!-- filterName -->
									<button class="filter_btn" value="open">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area">
									<ul class="filter_list">
										<li class="filter_list_in">
											<input type="checkbox" class="filter_list_top" id="" name="신발" value="신발" >
											<div class="item">신발</div>
											<ul class="filter_child_list" id="신발">
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="스니커즈" value="스니커즈" >
													<div class="item_child">스니커즈</div>	
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="플랫" value="플랫" >
													<div class="item_child">플랫</div>
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="로퍼" value="로퍼" >
													<div class="item_child">로퍼</div>
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="더비" value="더비" >
													<div class="item_child">더비</div>
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="힐" value="힐" >
													<div class="item_child">힐</div>
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="부츠" value="부츠" >
													<div class="item_child">부츠</div>
												</li>							
											</ul><!-- filter_child_list -->		
										</li>
										<li class="filter_list_in">
											<input type="checkbox" class="filter_list_top" name="아우터" value="아우터" >
											<div class="item"> 아우터</div>
											<ul class="filter_child_list" id="아우터">
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="자켓" value="자켓" >
													<div class="item_child">자켓</div>	
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="코트" value="코트" >
													<div class="item_child">코트</div>
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="패딩" value="패딩" >
													<div class="item_child">패딩</div>
												</li>
												<li class="filter_list_in">
													<input type="checkbox" class="filter_list_bottom" name="기타 아우터" value="기타 아우터" >
													<div class="item_child">기타 아우터</div>
												</li>		
											</ul><!-- filter_child_list -->
										</li>
										<li class="filter_list_in">
											<input type="checkbox" class="filter_list_top" name="상의" value="상의" >
											<div class="item">상의</div>
										</li>
										<li class="filter_list_in">
											<input type="checkbox" class="filter_list_top" name="하의" value="하의" >
											<div class="item"> 하의</div>
										</li>
										<li class="filter_list_in">
											<input type="checkbox" class="filter_list_top" name="가방" value="가방" >
											<div class="item"> 가방</div>
										</li>
										<li class="filter_list_in">
											<input type="checkbox" class="filter_list_top" name="지갑" value="지갑" >
											<div class="item"> 지갑</div>
										</li>								
									</ul><!-- filter_list -->
								</div><!-- filter_list_area -->
							</div><!-- filter_title -->
							
							<div class="filter_title">
								<div class="title_area">
									<div class="filterName1">
										<span>성별</span>
										<span class="filter_allSelect">모든 성별</span>
									</div><!-- filterName -->
									<button class="filter_btn" value="open">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area">
									<ul class="filter_list">
										<li class="filter_list_in">
											<input type="checkbox" class="filter_gender" name="남성" value="남성" >
											<div class="item_gender">남성</div>
										</li>
										<li class="filter_list_in">
											<input type="checkbox" class="filter_gender" name="여성" value="여성" >
											<div class="item_gender"> 여성</div>
										</li>
										<li class="filter_list_in">
											<input type="checkbox" class="filter_gender" name="키즈" value="키즈" >
											<div class="item_gender"> 키즈</div>
										</li>
									</ul><!-- filter_list -->
								</div><!-- filter_list_area -->
							</div><!-- filter_title -->
							
							<div class="filter_title">
								<div class="title_area">
									<div class="filterName1">
										<span>사이즈</span>
										<span class="filter_allSelect">모든 사이즈</span>
									</div><!-- filterName -->
									<button class="filter_btn" value="open">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area">
									<div class="filter_list">
										<div class="size_title">신발</div>
										<div class="sh_size_btn">
											<a href="#" class="column_menu">215</a>
											<a href="#" class="column_menu">220</a>
											<a href="#" class="column_menu">225</a>
											<a href="#" class="column_menu">230</a>
											<a href="#" class="column_menu">235</a>
											<a href="#" class="column_menu">240</a>
											<a href="#" class="column_menu">245</a>
											<a href="#" class="column_menu">250</a>
											<a href="#" class="column_menu">255</a>
											<a href="#" class="column_menu">260</a>
											<a href="#" class="column_menu">265</a>
											<a href="#" class="column_menu">270</a>
											<a href="#" class="column_menu">275</a>
											<a href="#" class="column_menu">280</a>
											<a href="#" class="column_menu">285</a>
											<a href="#" class="column_menu">290</a>
											<a href="#" class="column_menu">295</a>
											<a href="#" class="column_menu">300</a>
											<a href="#" class="column_menu">305</a>
											<a href="#" class="column_menu">310</a>
											<a href="#" class="column_menu">315</a>
											<a href="#" class="column_menu">320</a>
											<a href="#" class="column_menu">325</a>
											<a href="#" class="column_menu">330</a>
										</div><!-- size_btn -->
										
										<div class="more_btn"><a>+ 더보기</a></div>
										
										<div class="size_title">의류</div>
										
										<div class="clo_size_btn_wrap">
											<div class="ahpabet_size">
												<a href="#" class="column_menu">XXS</a>
												<a href="#" class="column_menu">XS</a>
												<a href="#" class="column_menu">S</a>
												<a href="#" class="column_menu">M</a>
												<a href="#" class="column_menu">L</a>
												<a href="#" class="column_menu">XL</a>
												<a href="#" class="column_menu">XXL</a>
												<a href="#" class="column_menu">XXXL</a>
											</div><!-- ahpabet_size -->
											<div class="number_size">
												<a href="#" class="column_menu">28</a>
												<a href="#" class="column_menu">29</a>
												<a href="#" class="column_menu">30</a>
												<a href="#" class="column_menu">31</a>
												<a href="#" class="column_menu">32</a>
												<a href="#" class="column_menu">33</a>
												<a href="#" class="column_menu">34</a>
												<a href="#" class="column_menu">35</a>
												<a href="#" class="column_menu">36</a>
											</div><!-- number_size -->										
										</div><!-- clo_size_btn_wrap -->
									</div><!-- filter_list -->
								</div><!-- filter_list_area -->
							</div><!-- filter_title -->
							
							<div class="filter_title">
								<div class="title_area">
									<div class="filterName1">
										<span>혜택/가격</span>
										<span class="filter_allSelect">모든 혜택/가격</span>
									</div><!-- filterName -->
									<button class="filter_btn" value="open">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area">									
									<div class="filter_list">
										<span>혜택</span>
									</div>
									<div class="filter_list">
										<div class="filter_list_in">
											<input type="checkbox" class="filter_benefit" name="" value="무료배송" >
											<div class="item_benefit">무료배송</div>
										</div>
										<div class="filter_list_in">
											<input type="checkbox" class="filter_benefit" name="" value="할인" >
											<div class="item_benefit">할인</div>
										</div>
									</div><!-- filter_list -->
									<div class="filter_list">
										<span>가격</span>
									</div>
									<div class="filter_list">
										<div class="filter_list_in">
											<input type="checkbox" class="filter_price" name="" value="10만원 이하" >
											<div class="item_price">10만원 이하</div>
										</div>
										<div class="filter_list_in">
											<input type="checkbox" class="filter_price" name="" value="10-30만원" >
											<div class="item_price">10-30만원</div>
										</div>
										<div class="filter_list_in">
											<input type="checkbox" class="filter_price" name="" value="30-50만원" >
											<div class="item_price">30-50만원</div>
										</div>
										<div class="filter_list_in">
											<input type="checkbox" class="filter_price" name="" value="50-100만원" >
											<div class="item_price">50-100만원</div>
										</div>
										<div class="filter_list_in">
											<input type="checkbox" class="filter_price" name="" value="100-300만원" >
											<div class="item_price">100-300만원</div>
										</div>
										<div class="filter_list_in">
											<input type="checkbox" class="filter_price" name="" value="300만원 이상" >
											<div class="item_price">300만원 이상</div>
										</div>
									</div><!-- filter_list -->
								</div><!-- filter_list_area -->
							</div><!-- filter_title -->
						</div><!-- filter_area -->
					</aside>
					
					<div class="product_wrap">
						<div class="product_top">
						
			<!-- 상품 개수 -->
							<div class="product_count">
								<span>상품수  12312</span>
							</div><!-- product_count -->
			<!-- 상품 정렬 버튼  -->
							<div class="product_btn_area">
								<button onclick="btn_list();">
									<span class="btn_title">인기순</span>
									<img src="${pageContext.request.contextPath}/resources/image/updownfilter.png">
								</button>
								<ul class="product_btn_list">
									<li>
										<div class="btn_list_item">
											<div class="list_item_info">
												<span class="list_sub">인기순</span>
												<span class="list_con">많이 판매된 순서대로 정렬합니다.</span>
											</div>
											<div class="check_img">
												<img class="check" src="${pageContext.request.contextPath}/resources/image/check.png">
											</div>
										</div>
									</li>
									<li>
										<div class="btn_list_item">
											<div class="list_item_info">
												<span class="list_sub">높은 가격순</span>
												<span class="list_con">가격이 높은 순서대로 정렬합니다.</span>
											</div>
											<div class="check_img">
											</div>
										</div>
									</li>
									<li>
										<div class="btn_list_item">
											<div class="list_item_info">
												<span class="list_sub">낮은 가격순</span>
												<span class="list_con">가격이 낮은 순서대로 정렬합니다.</span>
											</div>
											<div class="check_img">
											</div>
										</div>
									</li>
									<li>
										<div class="btn_list_item">
											<div class="list_item_info">
												<span class="list_sub">관심 많은 순</span>
												<span class="list_con">관심 상품에 많이 추가된 순서대로 정렬합니다.</span>
											</div>
											<div class="check_img">
											</div>
										</div>
									</li>
									<li>
										<div class="btn_list_item">
											<div class="list_item_info">
												<span class="list_sub">리뷰순</span>
												<span class="list_con">리뷰가 많이 등록된 순서대로 정렬합니다.</span>
											</div>
											<div class="check_img">
											</div>
										</div>
									</li>
								</ul><!-- product_btn_list -->
							</div><!-- product_btn_area -->
						</div><!-- product_top -->
						
						<div class="filter_teg_area">
						</div><!-- filter_teg_area -->
		<!-- 상품 게시 공간 -->			
						<div class="product_area">
							<div class="product_item_wrap">
								<div class="product_item" onclick="location.href='${pageContext.request.contextPath}/shop/shopContents.do'">
									<div class="pro_img_area">
										<img class="pro_img" src="">
									</div>
									<div class="pro_name_area">
										<ul>
											<li class="pro_brand">apple</li>
											<li class="pro_name1" >Apple iPad Air 5th Gen Wifi 64GB Space Gray (Korean Ver.)</li>
											<li class="pro_name2" >애플 아이패드 에어 5세대 와이파이 64기가 스페이스 그레이 (국내 정식 발매 제품)</li>
											<li class="pro_price">825,000원</li>
										</ul>
									</div>
								</div><!-- product_item -->
								<div class="pro_icon_area">
									<span class="wish_btn"><img class="wish_img" src="${pageContext.request.contextPath}/resources/image/favorites2.png"></span>
									<span>123</span>
									<span class="review_btn"><img src="${pageContext.request.contextPath}/resources/image/writing.png"></span>
									<span>123</span>
								</div>
							</div><!-- product_item_wrap -->				
						</div><!-- product_area -->
					</div><!-- product_wrap -->
				</section><!-- product_area -->	
				
				
			</main>	
			<jsp:include page="../common/footer.jsp"></jsp:include>
			
		</div><!-- inner -->
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/shop/shopMain.js"></script>
		<script>
		//우측 필터버튼 클릭시
			var btn_list_item = $(".btn_list_item");
			btn_list_item.on("click",function(){
				$(".btn_title").text($(this).find('span.list_sub').text());
				for(var i=0;i<5;i++){
					$(".check_img").html("");
				}
				$(this).find('div.check_img').html("<img src='${pageContext.request.contextPath}/resources/image/check.png'>");
				list.hide();
			});
		</script>
	</body>
</html>