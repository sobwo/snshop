<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SHOP 메인페이지</title>
		<style type="text/css">
			input[type="checkbox"]{
				width : 15px;
				height: 15px;
				margin: 3px;
				vertical-align:-2px;
			}
			.inner{
				width: 1900px;
				display: flex;
				flex-direction: column;
				flex-wrap: wrap;
				padding-top: 191px;
			}
			.main_area{
				width: 1280px;
				margin: 0 auto;
				display : flex;
				flex-direction: row;
				flex-wrap : wrap;
				justify-content: space-around;
			}
			.trend_container{
				width : 1200px;
				height : 190px;
				margin : 40px;
				display : flex;
				flex-direction : column;
				justify-content: center;
				border-bottom: 1px solid #ebebeb;
			}
			.trend_con_area{
				display : flex;
				flex-direction: row;
				
			}
			.trendContents{
				width:134px;
				height:109px;
				display : flex;
				flex-direction : column;
				justify-content: center;
			}
			.trendImg,.trendName{
				display : flex;
				justify-content: center;
			}
			
			.trend_btn_area{
				width : 1200px;
				height : 30px;
				margin-top : 16px;
				display : flex;
				justify-content:center;
				flex-direction: row;
			}
			
			.trend_btn_area>button{
				border: none;
				width : 30px;
				height : 30px;
				margin : 0 15px;
			}
			.trend_pre_btn>img{
				transform:rotate(180deg);
			}
			
			.trend_btn_area>ul{
				display : flex;
				flex-direction : row;
				margin : 0 10px;
			}
			.trend_list>button{
				color: transparent;
				width: 6px;
				height: 6px;
				background: #d3d3d3;
				font-size: 0;
				border: 6px;
				border-color : #000;
				border-radius: 6px;
				margin : 0 5px;
					
			}
			.product_container{
				display : flex;
				flex-direction: row;
				justify-content:space-between;
			}
			
			.aside_area{
				width:220px;
			}
			.filter_title{
				width:200px;
				padding : 12px 0px;
				display:flex;
				flex-direction : column;
				justify-content:space-between;
				border-bottom: 1px solid #ebebeb;
			}
			.title_first{
				flex-direction : row;
			}
			.title_area{
				display:flex;
				width:200px;
				flex-direction : row;
				justify-content:space-between;
				margin-bottom: 10px;
			}
			
			.filterName{
				font-size : 14px;
				font-weight: 600;
			
			}
			.title_area>button{
				border:none;
				background-color : white;
				width:20px;
				height:20px;
			}
			.filterName1{
				display:flex;
				flex-direction : column;
			}
			
			.filterName1 span:first-child{
				font-size:14px;
				font-weight:bold;
			}
			
			.filtername1 span:last-child{
				font-size:15px;
			}
			
			.filter_allSelect{
				font-size : 16px;
				color : rgba(34,34,34,.5);
				margin : 3px;
			}
			.filter_list_area{
				width:200px;

			}
			.filter_list{
				display: flex;
				flex-direction: column;
				padding : 3px;
			}
			.filter_list_in{
				padding-bottom: 3px;
			}
		
			.filter_child_list{
				margin-left : 22px;
				display: flex;
				flex-direction: column;
				padding : 3px;
			}
			.size_title{
				color: rgba(34,34,34,.8);
				font-size: 13px;
				font-weight: bold;
				padding: 5px;
				margin-bottom: 10px;
			}
			.sh_size_btn,.number_size{
				display: grid;
				grid-template-columns: repeat(3,1fr);
				grid-column-gap: 1px;
				column-gap: 10px;
				grid-row-gap: 1px;
				row-gap: 10px;
				padding: 10px;
				text-align: center;
			}
			.column_menu{
				height: 32px;
				border: 1px solid #d3d3d3;
				font-size: 13px;
				line-height: 30px;
			}
			.more_btn{
				font-size: 12px;
				line-height: 14px;
				color: rgba(34,34,34,.8);
				cursor: pointer;
				margin: 14px 0;
			}
			.ahpabet_size{
				display: grid;
				grid-template-columns: repeat(2,1fr);
				grid-column-gap: 1px;
				column-gap: 10px;
				grid-row-gap: 1px;
				row-gap: 10px;
				padding: 10px;
				text-align: center;
			}
			.filter_child_list>a{
				margin-bottom: 5px;
			}
			.filter_teg_area{
				display: flex;
				flex-direction: row;
				padding: 12px;
			}
			.teg_item{
				height : 20px;
				display :inline-flex;
				border:1px solid #ebebeb;
				align-items: center;
				margin: 4px 9px 0 0;
				padding: 4px 2px 6px 10px;
				background-color: #f4f4f4;
				border-radius: 6px;
			}
			.teg_item>span{
				margin-right:5px;
				font-size: 14px;
			}
			.teg_item>button{
				width : 24px;
				height : 24px;
				border:none;
				background-color: #f4f4f4;
				
			}
			
			.product_wrap{
				width : 980px;
				display: flex;
				flex-direction: column;
				
			}
			.product_top{
				display : flex;
				height : 30px;
				flex-direction : row;
				justify-content : space-between;
				padding : 12px 16px;
				
			}
			.product_count >span{
				font-size: 13px;
				color: rgba(34,34,34,.8);	
				vertical-align:middle;
				text-align:center;
			}
			
			.product_btn_area{
				width: 100px;
				position: relative;
			}
			.product_btn_area button{
				border:0;
				background:#fff;
				cursor:pointer;
				display:flex;
				align-items:center;
			}
			.product_btn_area img{
				width:15px;
				height:15px;
				margin-left:3px;
			}
			
			.product_btn_list{
				position: relative;
				width: 278px;
				right: 235px;
				padding:10px;
				border:1px solid #ebebeb;
				border-radius:5px;
				box-shadow:.5px .5px gray;
			}
			.list_sub{
				font-size: 14px ;
				font-weight: 700;
			}
			.list_con{
				padding: 8px 12px;
				font-size: 12px;
				letter-spacing: -.06px;
				color: rgba(34,34,34,.5);
			}
			.btn_list_item{
				width:100%;
				display: flex;
				padding-top:10px;
				cursor:pointer;
			}
			.btn_list_item:hover{
				background:#fafafa;
			}
			
			.list_item_info{
				width:80%;
			}
			
			.list_item_info span{
				display:block;
			}
			
			.check_img{
				width:20%;
				height:100%;
				margin-top:15px;
				text-align:center;
			}
			
			.check_img img{
				width:25px;
				height:25px;
			}
			
			.product_area{
				width:100%;
				display : grid;
				grid-template-columns: repeat(4,minmax(0,1fr));
				grid-column-gap: 20px;
				column-gap: 20px;
				grid-row-gap: 40px;
				row-gap: 30px;
				padding:0 10px;
			}
			
			.product_item{
				display : flex;
				flex-direction : column;
				cursor:pointer;
			}
			.pro_img_area{
				margin-bottom: 5px;

			
			}
			.pro_img{
				width : 230px;
				height : 230px;
			
			}
			.pro_name_area{
				padding : 6px;
				
			}
			.pro_brand{
				line-height: 16px;
				font-size: 13px;
				letter-spacing: -.07px;
				font-weight: 700;
				color: #333;
			
			}
			.pro_name1{
				margin: 4px 0;
				line-height: 16px;
				font-size: 13px;
			}
			.pro_name2{
				margin: 2px 0;
				line-height: 13px;
				margin-top: 2px;
				font-size: 11px;
				color: rgba(34,34,34,.5);
			}
			.pro_price{
				line-height: 17px;
				font-size: 14px;
				font-weight: 700;
				margin-bottom : 3px;
			}
			.pro_icon_area{
				display : flex;
				flex-direction : row;
				justify-content : flex-start;
			
			}
			.pro_icon_area>span{
				color: rgba(34,34,34,.5);
				font-size: 15px;
				margin-right: 10px;
				display:flex;
				align-items:center;
			}	
			
			.wish_img{
				width:16px;
				height:13px;
				cursor:pointer;
			}
			.review_btn img{
				width:16px;
				height:13px;
				cursor:pointer;
			}
			
		</style>
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
								<a href="#">초기화</a>
							</div><!-- filter_title -->
							
							<div class="filter_title">
								<div class="title_area">
									<div class="filterName1">
										<span>카테고리</span>
										<span class="filter_allSelect">모든 카테고리</span>
									</div><!-- filterName -->
									<button class="filter_btn" value="open">+</button>
								</div><!-- title_area -->
								
								<div class="filter_list_area" style="display:none;">
									<ul class="filter_list">
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_list_top" id="" name="" value="신발" > 신발</a>
											<ul class="filter_child_list" style="display:none;">
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="스니커즈" > 스니커즈</a>		
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="플랫" > 플랫</a>
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="로퍼" > 로퍼</a>
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="더비" > 더비</a>
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="힐" > 힐</a>
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="부츠" > 부츠</a>
												</li>							
											</ul><!-- filter_child_list -->		
										</li>
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_list_top" name="" value="아우터" > 아우터</a>
											<ul class="filter_child_list" style="display:none;">
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="자켓" > 자켓</a>		
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="코트" > 코트</a>
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="패딩" > 패딩</a>
												</li>
												<li class="filter_list_in">
													<a href="#"><input type="checkbox" class="shoes_list" name="" value="기타 아우터" > 기타 아우터</a>
												</li>
									
											</ul><!-- filter_child_list -->		
										</li>
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_list_top" name="" value="상의" > 상의</a>
										</li>
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_list_top" name="" value="하의" > 하의</a>
										</li>
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_list_top" name="" value="가방" > 가방</a>
										</li>
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_list_top" name="" value="지갑" > 지갑</a>
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
								
								<div class="filter_list_area" style="display:none;">
									<ul class="filter_list">
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_gender" name="" value="남성" > 남성</a>
										</li>
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_gender" name="" value="여성" > 여성</a>
										</li>
										<li class="filter_list_in">
											<a href="#"><input type="checkbox" class="filter_gender" name="" value="키즈" > 키즈</a>
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
								
								<div class="filter_list_area" style="display:none;">
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
								
								<div class="filter_list_area" style="display:none;">									
									<div class="filter_list">
										<span>혜택</span>
									</div>
									<div class="filter_child_list">
										<a href="#"><input type="checkbox" class="filter_asd" name="" value="무료배송" >무료배송</a>
										<a href="#"><input type="checkbox" class="filter_asd" name="" value="할인" >할인</a>
									</div><!-- filter_list -->
									<div class="filter_list">
										<span>가격</span>
									</div>
									<div class="filter_child_list">
										<a href="#"><input type="checkbox" class="filter_price" name="" value="10만원 이하" >10만원 이하</a>
										<a href="#"><input type="checkbox" class="filter_price" name="" value="10-30만원" >10-30만원</a>
										<a href="#"><input type="checkbox" class="filter_price" name="" value="30-50만원" >30-50만원</a>
										<a href="#"><input type="checkbox" class="filter_price" name="" value="50-100만원" >50-100만원</a>
										<a href="#"><input type="checkbox" class="filter_price" name="" value="100-300만원" >100-300만원</a>
										<a href="#"><input type="checkbox" class="filter_price" name="" value="300만원 이상" >300만원 이상</a>
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
								<ul class="product_btn_list" style="display:none;">
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
		<script type="text/javascript">
			$(document).ready(function(){});
			
		//좌측 필터 + - 버튼 
			var filter_btn = $(".filter_btn");
			var filter_allSelect = $(".filter_allSelect");
			var filter_list_area = $(".filter_list_area");

			for(var i=0; i<4;i++){
				btn_filter(i);
			}
			
			function btn_filter(index){
				filter_btn.eq(index).on("click",function(){
					if(filter_btn.eq(index).val()=="open"){
						filter_list_area.eq(index).show();
						filter_btn.eq(index).text("-");
						filter_btn.eq(index).attr("value","close");
						filter_allSelect.eq(index).hide();
					}
					else{
						filter_list_area.eq(index).hide();
						filter_btn.eq(index).text("+");
						filter_btn.eq(index).attr("value","open");
						filter_allSelect.eq(index).show();
					}	
				});
			}
			
		//좌측 필터(카테고리) 체크 버튼 클릭시 태그 div 생성 삭제
			
			var list_top = $(".filter_list_top");
			var filter_child_list = $(".filter_child_list");
			var shoes_list = $(".shoes_list");
			
			for(var i=0; i<shoes_list.length;i++){
				shoes_list_check(i);
			}
			for(var i=0; i<list_top.length;i++){
				list_top_check(i);
			}
			
			function list_top_check(index){
				list_top.eq(index).change(function(){
					if(this.checked){
						filter_child_list.eq(index).show();
						shoes_list.prop("checked",false);
						$(".teg_child").detach();
						$(".filter_teg_area").append("<div class='teg_item teg_parent' name='"+list_top.eq(index).val()+
								"'><span>"+list_top.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
					}else{
						$("div[name="+list_top.eq(index).val()+"]").detach();
						filter_child_list.eq(index).hide();
					}
				});
			}
			
			function shoes_list_check(index){
				shoes_list.eq(index).change(function(){
					if(this.checked){
						
						if(list_top.prop("checked",true))list_top.prop("checked",false);
						
						$(".teg_parent").detach();
						$(".filter_teg_area").append("<div class='teg_item teg_child' name='"+shoes_list.eq(index).val()+
								"'><span>"+shoes_list.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
					}else{
						$("div[name="+shoes_list.eq(index).val()+"]").detach();
						
					}
				});
			}
			
		//좌측 필터 성별
			
			var filter_gender = $(".filter_gender");
			
			for(var i=0; i<filter_gender.length;i++){
				gender_list_check(i);
			}
			
			function gender_list_check(index){
				filter_gender.eq(index).change(function(){
					if(this.checked){
						$(".teg_gender").detach();
						$("input:checkbox[class='filter_gender']").prop("checked",false);
						$(this).prop("checked",true);
						
						$(".filter_teg_area").append("<div class='teg_item teg_gender' name='"+filter_gender.eq(index).val()+
								"'><span>"+filter_gender.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
					}else{
						$("div[name="+filter_gender.eq(index).val()+"]").detach();
						
					}
				});
			}
			
		//좌측 필터 사이즈 
			
			var column_menu = $(".column_menu");
			
			for(var i=0; i<column_menu.length;i++){
				click_size(i);
			}
			
			function click_size(index){
				column_menu.eq(index).click(function(){
					
					$("div[name='teg_size']").detach();
					
					$(".filter_teg_area").append("<div class='teg_item' name='teg_size'><span>"+column_menu.eq(index).text()
							+"</span><button class='teg_item_btn'>X</button></div>");
					
				});
			}
		//좌측 필터 혜택
			var filter_asd = $(".filter_asd");

			for(var i=0; i<filter_asd.length;i++){
				filter_asd_check(i);
			}
			
			function filter_asd_check(index){
				filter_asd.eq(index).change(function(){
					if(this.checked){
						
						$(".filter_teg_area").append("<div class='teg_item teg_asd' name='"+filter_asd.eq(index).val()+
								"'><span>"+filter_asd.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
					}else{
						$("div[name="+filter_asd.eq(index).val()+"]").detach();
						
					}
				});
			}
		//좌측 필터 가격
			var filter_price = $(".filter_price");
			
			for(var i=0; i<filter_price.length;i++){
				filter_price_check(i);
			}
			
			function filter_price_check(index){
				filter_price.eq(index).change(function(){
					if(this.checked){
						
						$(".teg_price").detach();
						$("input:checkbox[class='filter_price']").prop("checked",false);
						$(this).prop("checked",true);

						
						$(".filter_teg_area").append("<div class='teg_item teg_price' name='"+filter_price.eq(index).val()+
								"'><span>"+filter_price.eq(index).val()+"</span><button class='teg_item_btn'>X</button></div>");
					}else{
						$("div[name="+filter_price.eq(index).val()+"]").detach();
						
					}
				});
			}

			//태그 div 버튼 클릭시 삭제 및 클릭 해제
			$(document).on('click','.teg_item_btn',function(){
				
				var a = $(this).parent('div').attr('name');
				$("input:checkbox[name='"+a+"']").prop("checked",false);
				$(this).parent('div').detach();
			
			});
			
			//우측 필터버튼
			var list = $(".product_btn_list");
			function btn_list(){
				if ( list.css('display') === 'none'){
					list.show();
				}else{
					list.hide();
				}
			}
			
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

			//즐겨찾기 버튼
			var wish_btn = $(".wish_btn");
			var popup_wrap = $(".shopMain_popup_wrap");
			var popup_cancel = $(".popup_cancel");
			var status_item = $(".status_item_fb");
			
			popup_wrap.css('height',window.outerHeight);
			
			wish_btn.on("click",function(){
				popup_wrap.show();
			});
			
			popup_cancel.click(function(){
				popup_wrap.hide();
			});
			
			status_item.on("click",function(){
				popup_wrap.hide();
			});
			
			//리뷰 버튼
			
			
			
		</script>
	</body>
</html>