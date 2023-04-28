<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SHOP 메인페이지</title>
		<style type="text/css">
			main{
				width: 1280px;
				margin : 0 auto;
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
			
			.product_container{
				display : flex;
				flex-direction: row;
				justify-content:space-between;
			}
			
			aside{
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
				font-size : 16px;

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
			input[type="checkbox"]{
				width : 15px;
				height: 15px;
				margin: 3px;
				vertical-align:-2px;
			}
			.filter_child_list{
				margin-left : 22px;
				display: flex;
				flex-direction: column;
				padding : 3px;
			}
			.product_area{
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
			.product_count{
				font-size: 13px;
				color: rgba(34,34,34,.8);	
			}
			.product_btn_area{
				width: 70px;
				position: relative;
			}
			.product_btn_list{
				position: relative;
				width: 278px;
				right: 235px;
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
				display: flex;
				flex-direction: column;
			}
			
		</style>
	</head>
	<body>
		<jsp:include page="../common/header_shop.jsp"></jsp:include>
		<main>
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
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
					<button class="trend_next_btn"><img src="${pageContext.request.contextPath}/resources/image/화살표.png" width="30px" height="30px"></button>
				</div><!-- trend_btn_area -->
			</section><!-- trend_container -->
			
			<section class="product_container">
				<aside>
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
								<button>+</button>
							</div><!-- title_area -->
							
							<div class="filter_list_area">
								<ul class="filter_list">
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 신발</a>
										<ul class="filter_child_list">
											<li class="filter_list_in">
												<a href="#"><input type="checkbox" name="" value="" > </a>		
											</li>
											<li class="filter_list_in">
												<a href="#"><input type="checkbox" name="" value="" > </a>
											</li>							
										</ul><!-- filter_child_list -->		
									</li>
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 아우터</a>
									</li>
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 상의</a>
									</li>
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 하의</a>
									</li>
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 가방</a>
									</li>
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 지갑</a>
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
								<button>+</button>
							</div><!-- title_area -->
							
							<div class="filter_list_area">
								<ul class="filter_list">
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 남성</a>
									</li>
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 여성</a>
									</li>
									<li class="filter_list_in">
										<a href="#"><input type="checkbox" name="" value="" > 키즈</a>
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
								<button>+</button>
							</div><!-- title_area -->
							
							<div class="filter_list_area">
								<ul class="filter_list">
								</ul><!-- filter_list -->
							</div><!-- filter_list_area -->
						</div><!-- filter_title -->
						
						<div class="filter_title">
							<div class="title_area">
								<div class="filterName1">
									<span>혜택/가격</span>
									<span class="filter_allSelect">모든 혜택/가격</span>
								</div><!-- filterName -->
								<button>+</button>
							</div><!-- title_area -->
							
							<div class="filter_list_area">
								<ul class="filter_list">
								</ul><!-- filter_list -->
							</div><!-- filter_list_area -->
						</div><!-- filter_title -->
					</div><!-- filter_area -->
				</aside>
				
				<div class="product_area">
					<div class="product_top">
						<div class="product_count">
							<span>상품수  12312</span>
						</div><!-- product_count -->
						
						<div class="product_btn_area">
							<button>인기순</button>
							<ul class="product_btn_list">
								<li>
									<a class="btn_list_item">
										<span class="list_sub">인기순</span>
										<span class="list_con">많이 판매된 순서대로 정렬합니다.</span>
									</a>
								</li>
								<li>
									<a class="btn_list_item">
										<span class="list_sub">높은 가격순</span>
										<span class="list_con">가격이 높은 순서대로 정렬합니다.</span>
									</a>
								</li>
								<li>
									<a class="btn_list_item">
										<span class="list_sub">낮은 가격순</span>
										<span class="list_con">가격이 낮은 순서대로 정렬합니다.</span>
									</a>
								</li>
								<li>
									<a class="btn_list_item">
										<span class="list_sub">관심 많은 순</span>
										<span class="list_con">관심 상품에 많이 추가된 순서대로 정렬합니다.</span>
									</a>
								</li>
								<li>
									<a class="btn_list_item">
										<span class="list_sub">리뷰순</span>
										<span class="list_con">리뷰가 많이 등록된 순서대로 정렬합니다.</span>
									</a>
								</li>
							</ul><!-- product_btn_list -->
						</div><!-- product_btn_area -->
					</div><!-- product_top -->
					
					<div class="filter_teg_area">
						<div class="teg_item">
						
						</div>
					</div><!-- filter_teg_area -->
	
					<div>
						<div>
							<a href="${pageContext.request.contextPath}/shop/shopContents.do">
								<div>
									<img src="">
								</div>
								<div>
									<ul>
										<li>상품명</li>
										<li>상품상세명</li>
										<li>상품가격</li>
									</ul>
								</div>
							</a>
							<div>
								<span>즐겨찾기수</span>
								<span>리뷰수</span>
							</div>
						</div>
					</div>
				</div>
			</section><!-- product_area -->	
		</main>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
		</script>
	</body>
</html>