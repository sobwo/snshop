<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SHOP 메인페이지</title>
		
		<style>
			.nav_list:nth-child(2) a{
				font-weight:bold;
			}
		</style>
		<link href="${pageContext.request.contextPath}/resources/css/shop/shopMain.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
		
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
						<c:forEach var="tl" items="${trandList}">
							<div class="trendContents">
								<div class="trendImg">
									<img src="${tl.imgFileName}" width="90px" height="90px">
								</div><!-- trendImg -->
								<div class="trendName">
									<span>${tl.categoryName}</span>
								</div><!-- trendName -->
							</div>
						</c:forEach>
					</div><!-- trend_con_area -->
				</section><!-- trend_container -->
	<!-- 좌측 필터  -->
				<section class="product_container">
					<aside class="aside_area">
						<div class="filter_area">
							<div class="filter_title title_first">
								<div class="filterName">
									<span>필터</span>
									<span id="total_cnt">0</span>
								</div><!-- filterName -->
								<button class="reset">초기화</button>
							</div><!-- filter_title -->
							
							<div class="filter_title">
								<div class="title_area">
									<div class="filterName1">
										<span>카테고리</span>
										<span class="filter_allSelect">모든 카테고리</span>
									</div><!-- filterName -->
									<button class="filter_btn">+</button>
								</div><!-- title_area -->
								<div class="filter_list_area">
									<ul class="filter_list">
										<li class="filter_list_in">
											<div class ="item_top">
												<input type="checkbox" class="filter_list_top f_div" id="shoese" name="신발" value="신발" >
												<span class="item">신발</span>
											</div>
											<ul class="filter_child_list">
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="스니커즈" >
													<div class="item">스니커즈</div>   
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="플랫" >
													<div class="item">플랫</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="로퍼" >
													<div class="item">로퍼</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="샌들" >
													<div class="item">샌들</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="더비" >
													<div class="item">더비</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="힐" >
													<div class="item">힐</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="부츠" >
													<div class="item">부츠</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div shoese" name="shoese" value="기타" >
													<div class="item">기타</div>
												</li>                    
											</ul><!-- filter_child_list -->      
										</li><!-- filter_list_in --> 
										<li class="filter_list_in">
											<div class ="item_top">
												<input type="checkbox" class="filter_list_top f_div" id="outer" name="아우터" value="아우터" >
												<span class="item">아우터</span>
											</div>
											<ul class="filter_child_list">
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div outer" name="outer" value="자켓" >
													<div class="item">자켓</div>	
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div outer" name="outer" value="코트" >
													<div class="item">코트</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div outer" name="outer" value="아노락" >
													<div class="item">아노락</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div outer" name="outer" value="패딩" >
													<div class="item">패딩</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div outer" name="outer" value="기타" >
													<div class="item">기타</div>
												</li>		
											</ul><!-- filter_child_list -->
										</li>
										<li class="filter_list_in">
											<div class ="item_top">
												<input type="checkbox" class="filter_list_top f_div" id="top" name="상의" value="상의" >
												<span class="item">상의</span>
											</div>
											<ul class="filter_child_list">
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="가디건" >
													<div class="item">가디건</div>	
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="긴팔" >
													<div class="item">긴팔</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="반팔" >
													<div class="item">반팔</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="셔츠" >
													<div class="item">셔츠</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="후드" >
													<div class="item">후드</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="후드집업" >
													<div class="item">후드집업</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="후드집업" >
													<div class="item">스웨트셔츠</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="슬리브리스" >
													<div class="item">슬리브리스</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="원피스" >
													<div class="item">원피스</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="니트" >
													<div class="item">니트</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div top" name="top" value="기타" >
													<div class="item">기타</div>
												</li>		
											</ul><!-- filter_child_list -->
										</li>
										<li class="filter_list_in">
											<div class ="item_top">
												<input type="checkbox" class="filter_list_top f_div" id="bottoms" name="하의" value="하의" >
												<span class="item">하의</span>
											</div>
											<ul class="filter_child_list">
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bottoms" name="bottoms" value="바지" >
													<div class="item">바지</div>	
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bottoms" name="bottoms" value="반바지" >
													<div class="item">반바지</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bottoms" name="bottoms" value="스커트" >
													<div class="item">스커트</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bottoms" name="bottoms" value="레깅스" >
													<div class="item">레깅스</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bottoms" name="bottoms" value="기타" >
													<div class="item">기타</div>
												</li>		
											</ul><!-- filter_child_list -->
										</li>
										<li class="filter_list_in">
											<div class ="item_top">
												<input type="checkbox" class="filter_list_top f_div" id="bag" name="가방" value="가방" >
												<span class="item">가방</span>
											</div>
											<ul class="filter_child_list">
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="프리미엄가방" >
													<div class="item">프리미엄가방</div>	
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="미니백" >
													<div class="item">미니백</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="백팩" >
													<div class="item">백팩</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="숄더백" >
													<div class="item">숄더백</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="토트백" >
													<div class="item">토트백</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="크로스백" >
													<div class="item">크로스백</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="클러치" >
													<div class="item">클러치</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="더플백" >
													<div class="item">더플백</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="에코백" >
													<div class="item">에코백</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="캐리어" >
													<div class="item">캐리어</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div bag" name="bag" value="기타" >
													<div class="item">기타</div>
												</li>		
											</ul><!-- filter_child_list -->
										</li>
										<li class="filter_list_in">
											<div class ="item_top">
												<input type="checkbox" class="filter_list_top f_div" id="wallet" name="지갑" value="지갑" >
												<span class="item">지갑</span>
											</div>
											<ul class="filter_child_list">
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div wallet" name="wallet" value="반지갑" >
													<div class="item">반지갑</div>	
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div wallet" name="wallet" value="장지갑" >
													<div class="item">장지갑</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div wallet" name="wallet" value="카드지갑" >
													<div class="item">카드지갑</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div wallet" name="wallet" value="체인지갑" >
													<div class="item">체인지갑</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div wallet" name="wallet" value="기타" >
													<div class="item">기타</div>
												</li>		
											</ul><!-- filter_child_list -->
										</li>
										<li class="filter_list_in">
											<div class ="item_top">
												<input type="checkbox" class="filter_list_top f_div" id="watch" name="시계" value="시계" >
												<span class="item">시계</span>
											</div>
											<ul class="filter_child_list">
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div watch" name="watch" value="프리미엄시계" >
													<div class="item">프리미엄시계</div>	
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div watch" name="watch" value="전자시계" >
													<div class="item">전자시계</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div watch" name="watch" value="가죽시계" >
													<div class="item">가죽시계</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div watch" name="watch" value="메탈시계" >
													<div class="item">메탈시계</div>
												</li>
												<li class="filter_child_list_in">
													<input type="checkbox" class="filter_list_bottom f_div watch" name="watch" value="기타" >
													<div class="item">기타</div>
												</li>		
											</ul><!-- filter_child_list -->
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
									<button class="filter_btn">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area">
									<ul class="filter_list">
										<li class="filter_child_list_in">
											<input type="checkbox" class="filter_gender f_div" name="남성" value="남성" >
											<div class="item">남성</div>
										</li>
										<li class="filter_child_list_in">
											<input type="checkbox" class="filter_gender f_div" name="여성" value="여성" >
											<div class="item"> 여성</div>
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
									<button class="filter_btn">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area">
									<div class="filter_list">
										<div class="size_title">신발</div>
										<div class="sh_size_btn">
											<button class="column_menu">215</button>
											<button class="column_menu">220</button>
											<button class="column_menu">225</button>
											<button class="column_menu">230</button>
											<button class="column_menu">235</button>
											<button class="column_menu">240</button>
											<button class="column_menu">245</button>
											<button class="column_menu">250</button>
											<button class="column_menu">255</button>
											<button class="column_menu">260</button>
											<button class="column_menu">265</button>
											<button class="column_menu">270</button>
											<button class="column_menu">275</button>
											<button class="column_menu">280</button>
											<button class="column_menu">285</button>
											<button class="column_menu">290</button>
											<button class="column_menu">295</button>
											<button class="column_menu">300</button>
											<button class="column_menu">305</button>
											<button class="column_menu">310</button>
											<button class="column_menu">315</button>
											<button class="column_menu">320</button>
											<button class="column_menu">325</button>
											<button class="column_menu">330</button>
										</div><!-- size_btn -->			
										<div class="size_title">의류</div>
										
										<div class="clo_size_btn_wrap">
											<div class="ahpabet_size">
												<button class="column_menu">XXS</button>
												<button class="column_menu">XS</button>
												<button class="column_menu">S</button>
												<button class="column_menu">M</button>
												<button class="column_menu">L</button>
												<button class="column_menu">XL</button>
												<button class="column_menu">XXL</button>
												<button class="column_menu">XXXL</button>
											</div><!-- ahpabet_size -->
											<div class="number_size">
												<button class="column_menu">28</button>
												<button class="column_menu">29</button>
												<button class="column_menu">30</button>
												<button class="column_menu">31</button>
												<button class="column_menu">32</button>
												<button class="column_menu">33</button>
												<button class="column_menu">34</button>
												<button class="column_menu">35</button>
												<button class="column_menu">36</button>
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
									<button class="filter_btn">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area">									
									<div class="filter_list">
										<span>혜택</span>
									</div>
									<div class="filter_list">
										<div class="filter_child_list_in">
											<input type="checkbox" class="filter_benefit f_div" name="무료배송" value="무료배송" >
											<div class="item">무료배송</div>
										</div>
										<div class="filter_child_list_in">
											<input type="checkbox" class="filter_benefit f_div" name="할인" value="할인" >
											<div class="item">할인</div>
										</div>
									</div><!-- filter_list -->
									<div class="filter_list">
										<span>가격</span>
									</div>
									<div class="filter_list">
										<div class="priceArea">
											<input type="text" class="filter_price">
											<button class="shearchPrice">검색</button>
										</div>
									</div><!-- filter_list -->
								</div><!-- filter_list_area -->
							</div><!-- filter_title -->
						</div><!-- filter_area -->
					</aside>
					
					<div class="product_wrap">
						<div class="product_top">
							<div class="filter_teg_area">
						
							</div><!-- filter_teg_area -->
									<!-- 상품 정렬 버튼  -->
							<div class="product_btn_area">
								<button onclick="btn_list();">
									<span class="btn_title">인기순</span>
									<img src="${pageContext.request.contextPath}/resources/image/updownfilter.png">
								</button>
								<ul class="product_btn_list">
									<li>
										<div class="btn_list_item" >
											<div class="list_item_info">
												<span class="list_sub">판매순</span>
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
					<!-- 상품 게시 공간 -->			
						<div class="goods_wrap">

						</div><!-- product_wrap -->
					</div><!-- product_wrap -->
				</section><!-- product_area -->	
				
				
			</main>	
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div><!-- inner -->
		<div class="popup_wrap shopMain_popup_wrap" style="display:none">
			
		</div>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/shop/shopMain.js"></script>
		<script>
		$(document).ready(function(){
			filter.push("1");
			value =0;
			page = 1;
			filter_ajax(filter,value,page);
			filter.pop();
			
			$('.trend_con_area').slick({
				slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, 	//무한 반복 옵션	 
				slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 4,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : false, 		// 옆으로 이동하는 화살표 표시 여부
				dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true,			// 자동 스크롤 사용 여부
				autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false,		// 세로 방향 슬라이드 옵션
				draggable : true, 	//드래그 가능 여부 
			});
		
		$(window).scroll(function(){
			var scrollTop = $(this).scrollTop();
			var innerHeight = $(this).innerHeight();
			var scrollHeight = $("body").prop('scrollHeight');
			if(scrollTop + innerHeight >= scrollHeight) {
				page++;
				filter_ajax(filter,value,page);
			}
		});
		
		});
		
		var filter = [];
		var value=0;
		var page = 1;
		var price = $(".filter_price");

	//상단 네비
		$(".topNav").on("click",function(){
			var value = 1;
			var page = 1;
			var cate = $(this).text();
			var tegArea = $(".filter_teg_area");
			tegArea.empty();
			$(".filter_list_in").hide();			
			$(".f_div").prop("checked", false);
			filter =[];
			filter.push(cate);
			filter_ajax(filter,value,page);
			filter_cnt();
			
		});
		
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

		function filter_ajax(filter,value,page){
			
			page = page * 8;
			
			$.ajax({
				url: "${pageContext.request.contextPath}/shop/categoryFilter.do",		
				method: "POST",
				data:{
				    filter: filter,
				    "value": value,
				    "page": page
				  },
				cache : false,
				success : function(data){
					$(".goods_wrap").html(data);
					
				},
				error : function(request,status,error){
					alert("다시 시도하시기 바랍니다.");	
					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
				}	
			});
		}
		

	//정렬 ajax
		
		$('.btn_list_item').on('click',function(){
			var index = parseInt($('.btn_list_item').index(this));
			if(filter.length > 0){
				value = 1;
				align_ajax(filter,value,index,page);
			}else{
				filter.push("1");
				value =0;
				align_ajax(filter,value,index,page);
				filter.pop();
			}
		});
	
		function align_ajax(filter,value,index,page){
			
			page = page * 8;
			
			$.ajax({
				url: "${pageContext.request.contextPath}/shop/itemAlign.do",		
				method: "POST",
				data: {filter:filter,
					   "value":value,
					   "index":index,
					   "page":page},
				cache : false,
				success : function(data){
					$(".goods_wrap").html(data);
				},
				error : function(request,status,error){
					alert("다시 시도하시기 바랍니다.");	
					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
				}	
			});	
		}
		
		
	//가격 필터 ajax
		$(".shearchPrice").on("click",function(){
			
			var priceInput = $(".filter_price");
			var price = priceInput.val();
			
			var regExp = /^[0-9]*$/;
			  
			if(priceInput.val()==""){
				alert("가격을 입력해 주세요");
				priceInput.focus();
				return false;
			}else if(!regExp.test(priceInput.val())){
				alert("숫자만 입력 가능합니다. 다시 입력해주세요.");
				priceInput.val("");
				return false;
			}else{
				
				if(filter.length > 0){
					value = 1;
					price_ajax(filter,value,page,price);
				}else{
					filter.push("1");
					value =0;
					price_ajax(filter,value,page,price);
					filter.pop();
				}
			};

		});
		
		function price_ajax(filter,value,page,price){
			
			page = page * 8;
			
			$.ajax({
				url: "${pageContext.request.contextPath}/shop/priceFilter.do",		
				method: "POST",
				data: {filter:filter,
					   "value":value,
					   "page":page,
					   "price":price},
				cache : false,
				success : function(data){
					$(".goods_wrap").html(data);
				},
				error : function(request,status,error){
					alert("다시 시도하시기 바랍니다.");	
					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
				}	
			});	
		}
		</script>
	</body>
</html>