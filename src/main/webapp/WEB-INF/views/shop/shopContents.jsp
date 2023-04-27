<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상품 상세 페이지</title>
		<style type="text/css">
			*{margin: 0; padding: 0; text-align: center;}
			.main{
			width: 1903px;
			}
			.container{
				width:1200px;
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
			    padding: 30px 40px 120px 40px;
			    box-sizing: border-box;
			    justify-content:space-between;
			}
			.productImg_area{
				float: left;
				width: 50%;
				position:relative;
				}
			.productImage{
				position:absolute;
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
				width: 45%;
			}
			.productContents_area>div{
				margin-top: 3%;
				margin-bottom: 3%;
			}
			.productContents{
				display: flex;
				flex-direction:column;
				justify-content:flex-start;
			}		
			.brandName, .productName>p{
				text-align: left;
				margin: 1%;
			}
			.brandName>a{
				display: inline-block;
			    vertical-align: top;
			    line-height: 19px;
			    padding-top: 1px;
			    margin-bottom: 9px;
			    font-size: 18px;
			    letter-spacing: -.27px;
			    font-weight: 800;
			    border-bottom: 2px solid #222; 
			
			}
			.productName>p:first-child{
			    font-size: 18px;
			    letter-spacing: -.09px;
			    font-weight: 400; 
			}
			.sizePick{
				display: flex; 
				flex-direction: row; 
				margin-top: 2%;
				margin-bottom:2%;
				justify-content:space-between;
			}
			.price_area{
				display: flex; 
				flex-direction: row; 
				justify-content:space-between;
			}
			.btn_area{
				max-width:560px; 
				max-height:132px;
				display: flex; 
				justify-content:space-around; 
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
				width: 98%; 
				height: 60px;
				margin-top:10px; 
				font-size:18px; 
				font-weight:bold; 
				line-height: 60px;
				background-color:white;
				}
			.productInfo{
				width: 504px;
				height: 160px;
				}
			.product_sub{
				width:504px;
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
			}
			.productInfo_1{
				display:flex;
				flex-direction:column;
				justify-content:space-around;
			}
			.productInfo_1>p{
    			font-size: 15px;
			    margin-bottom: 5px;
			}
			.productInfo_1>span{
			    word-break: break-word;
			    font-size: 18px;
			    font-weight: 600;
			}
			.otherProduct_area{
				width : 1200px;
			}
			.o_contents{
				width : 1200px;
				margin: 0 -10px;
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
				width : 1200px;
				display : flex;
				flex-wrap : wrap;
				flex-direction: row;
				justify-content: space-between;
				align-content: flex-start;
				
			}
			.feed_user{
				display : flex;
				flex-direction: row;
				justify-content: space-between;
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
			}
			.more_btn_area{
				width : 1200px;
				height : 82px;
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
		<jsp:include page="../common/header_shop.jsp"></jsp:include>
		<main>
			<div class="container">
				<div class="product_area">
					<div class="productImg_area">
						<div class="productImage">
							<img src="../" width="560px" height="560px">
						</div>
						<div class="pre_btn">
							<button name="pre_btn">이전</button>
						</div>
						<div class="next_btn">
							<button name="next_btn">다음</button>
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
										<span>사이즈 표시</span>
										<button name="sizePick">asd</button>
									</a>
								</div>
							</div>
							<div class="price_area">
								<div class="priceTitle"><span>가격</span></div>
								<div class="price"><span>123123</span></div>
							</div>
						</div>
						
						<div class="btn_area">
							<button class="sellButton" name="buy_btn" type="button">구매</button>
							<button class="buyButton" name="sell_btn">판매</button>
							<button class="wish"><img src="">관심상품 123</button>
						</div>
						
						<div class="productInfo">
							<h3 class="product_sub">상품 정보</h3>
							<div class="productInfo_con">
								<div class="productInfo_1">
									<p>모델 번호</p>
									<span>123123</span>
								</div>
								<div class="productInfo_1">
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
								<img src=""  width="26px" height="26px">
								<p>ID</p>
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
		
			function (){
				
				
			}
		</script>
	</body>
</html>