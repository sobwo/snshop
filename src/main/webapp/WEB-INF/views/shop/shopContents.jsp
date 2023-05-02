<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상품 상세 페이지</title>
	<style type="text/css">
		@font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

		.notosanskr * { 
			font-family: 'Noto Sans KR', sans-serif;
		}
		
		button{
			cursor:pointer;
		}
		
		.main{
			width: 1902px;
			padding-top:94px;
		}
		.container{
			width:1200px;
			padding:0 40px 0 40px;
			margin:0 auto;
			font-family:"Noto Sans KR";
			display:flex;
			justify-content: flex-start;
			flex-wrap:wrap;
		}
		.product_area{
			display:flex; 
			width:1200px;
			margin:0 auto;
			flex-direction:row;
		    overflow: hidden;
		    padding: 30px 0 120px 0;
		    box-sizing: border-box;
		    justify-content:space-between;
		}
		.productImg_area{
			width: 560px;
			height:560px;
			padding-right:40px;
			border-right:1px solid #ebebeb;
		}
		.productImage{
			position:relative;
		}
		
		.pre_btn button, .next_btn button{
			border:0;
			font-size:40px;
			color:#ebebeb;
			background: rgba( 255, 255, 255, 0.5 );
			cursor:pointer;
		}
		.pre_btn{
			position:absolute;
			top: 45%;
			left : 1%;
		}
		.next_btn{
			position:absolute;
			top: 45%;
			right: 1%;
		}
		.productContents_area{
			clear : both;
			float : right;
			width: 560px;
			padding:0 10px;
		}
		.productContents_area>div{
			margin-top: 5%;
			margin-bottom: 5%;
		}
		.productContents{
			width:100%;
			display: flex;
			flex-direction:column;
			justify-content:flex-start;

		}		
		.brandName, .productName>p{
			text-align: left;
		}
		
		.brandName{
			width:100%;
		}
		
		.brandName>a{
			display: inline-block;
		    vertical-align: top;
		    line-height: 19px;
		    padding-top: 1px;
		    margin-bottom: 9px;
		    font-size: 20px;
		    letter-spacing: -.27px;
		    font-weight: 800;
		    border-bottom: 2px solid #222; 
		
		}
		.productName>p:first-child{
		    font-size: 18px;
		    letter-spacing: -.09px;
		    font-weight:bold;
		}
		
		.productName>p:last-child{
			font-size:14px;
		}
		.sizePick{
			display: flex; 
			flex-direction: row; 
			margin-top: 2%;
			margin-bottom:2%;
			justify-content:space-between;
		}
		
		.size_view{
			font-weight:bold;
		}
		
		.size a{
			display:flex;
			align-items:center;
			justify-content:center;
		}
		
		.sizePick_btn{
			border:1px solid #ebebeb;
			border-radius:50%;
			background:#fff;
			margin-left:5px;
		}
		
		.sizePick_btn>img{
			width:18px;
			height:18px;
			vertical-align:middle;
		}
		
		.price_area{
			display: flex; 
			flex-direction: row; 
			justify-content:space-between;
		}
		
		.price_view{
			font-size:20px;
			font-weight:bold;
		}
		
		.btn_area{
			max-width:560px; 
			max-height:132px;
			display: flex; 
			justify-content:space-between; 
			flex-wrap: wrap;
		}		
		.buyButton{
			width:48%; 
			height:60px; 
			background-color:#41b979; 	
			border:none;
			border-radius: 10px;
			font-size:18px; 
			font-weight:bold; 
			color:white;  
			line-height: 60px;
		}
		.sellButton{
			width:48%; 
			height:60px; 
			background-color:#ef6253;
			border:none;
			border-radius: 10px;
			font-size:18px;
			font-weight:bold; 
			color:white; 
			line-height: 60px;	
		}
		.wish{
			width: 100%; 
			height: 60px;
			margin-top:20px; 
			font-size:16px; 
			line-height: 60px;
			background-color:white;
			border:1px solid #ebebeb;
			border-radius:12px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		
		.wish>img{
			width:24px;
			height:21px;
			margin-right:10px;
		}
		
		.productInfo{
			width: 100%;
		}
		.product_sub{
			width:100%
			height: 50px;
			text-align: left;
			line-height: 40px;
		    font-size: 18px;
		    letter-spacing: -.15px;
		}
		.productInfo_con{
			display:flex;
			flex-direction:row;
			justify-content:space-around;
			padding:20px 0;
			border-top:1px solid #ebebeb;
			border-bottom:1px solid #ebebeb;
		}
		.productInfo_1{
			height:100%;
			display:flex;
			flex-direction:column;
			justify-content:space-around;
		}
		
		.productInfo_day{
			padding:0 60px;
			border-left:1px solid #ebebeb;
			border-right:1px solid #ebebeb;
		}
		.productInfo_1>p{
   			font-size: 13px;
   			color:rgba(34,34,34,.5);
		    margin-bottom: 5px;
		}
		.productInfo_1>span{
		    word-break: break-word;
		    font-size: 16px;
		    font-weight:bold;
		}
		
		.otherProduct_area{
			width : 1200px;
		}
		.o_contents{
			width : 1200px;
			display : flex;
			flex-direction: row;
			justify-content: space-between;
			overflow: hidden;
			flex-wrap: nowrap;
   			overflow-x: auto;
		}
		.sub_h3{
			text-align :left;
			width : 1200px;
			height: 60px;
			margin : 5px;
			padding-top:40px;
			border-top:1px solid #ebebeb;
		}
		.o_product{
			width: 244px;
			height: 310px;
			display : flex;
			flex-direction: column;
			justify-content: space-around;
		}
		.o_product_img{
			margin : 0 auto;
			width: 224px;
			height: 224px;
		}
		.o_info{
			margin : 5px auto;
			width: 224px;
			height : 40px;
			text-align: left;
		
		}
		.o_price{
			margin : 0 auto;
			width: 224px;
			height : 25px;
			text-align: left;
		
		}
		.feed_area{
			max-height : 872px;
			margin-top:100px;
			width : 1200px;
			display : flex;
			flex-wrap : wrap;
			flex-direction: row;
			justify-content: space-between;
			align-content: flex-start;
			
		}
		.feed_user{
			width:100%;
			display : flex;
			justify-content: space-between;
		}
		
		.user_info{
			width:80%;
			display:flex;
			flex-direction:row;
			align-items:center;
		}
		
		.user_info>p{
			font-size:14px;
			margin-left:10px;
			color:rgba(34,34,34,.8);
			font-weight:bold;
		}
		
		.feed_contents_area{
			height : 405px;
			width : 279px;
			margin : 5px;
			display : flex;
			flex-direction: column;
			justify-content: space-around;
			
		}
		.feed_con>p{
			text-align: left;
			font-size:14px;
		}
		.more_btn_area{
			width : 1200px;
			height : 82px;
			padding-top:50px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		.more_btn_area>button{
		    height: 42px;
			padding: 0 30px;
		    border-radius: 12px;
		    background : #fff;
		    font-size: 14px;
		    letter-spacing: -.14px;
			border: 1px solid #d3d3d3;
		}
		
	</style>
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