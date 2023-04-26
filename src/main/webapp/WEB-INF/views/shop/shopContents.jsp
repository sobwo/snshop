<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상품 상세 페이지</title>
		<style type="text/css">
			*{margin: 0; padding: 0; text-align: center;}
			.main{
			width: 1903px;
			display:flex; 
			}
			.contanier{
	
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
				}	
			.productContents_area{
				clear : both;
				float : right;
				width: 45%;
				}
			.productContents_area>div{
				margin-top: 5%;
				margin-bottom: 5%;
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
			.price_area>div{
	
				}
			.otherProduct{}
			.feed_area{}
			
			.btn_area{
				max-width:560px; 
				max-height:132px;
				display: flex; 
				justify-content:space-between; 
				flex-wrap: wrap;}
			.btn_area>div{
				margin: 3px;
				}
			
			.buyButton{
				width:48%; 
				height:60px; 
				background-color:#ef6253; 
				border-radius: 10px;
				}
			.buyButton>span{
				font-size:18px; 
				font-weight:bold; 
				color:white;  
				line-height: 60px;
				}
			
			.sellButton{
				width:48%; 
				height:60px; 
				background-color:#41b979; 
				border-radius: 10px;
				}
			.sellButton>span{
				font-size:18px;
				font-weight:bold; 
				color:white; 
				line-height: 60px;
				}
			
			.wish{
				width: 98%; 
				height: 60px;
				}
			.wish>span{
				font-size:18px; 
				font-weight:bold; 
				line-height: 60px;
				}
			.productInfo{
				display:flex;
				justify-content:flex-start;
				flex-direction:column;
				}
			.productInfo>div{
				display: flex;
				flex-direction:row;
			}
			.productInfo_1{
				display: flex;
				flex-direction:column;
				margin: 3% 5%;
			}
			.productInfo_1>span{
				margin: 2px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/header_shop.jsp"></jsp:include>
		<main>
			<div class="container">
				<div class="product_area">
					<div class="productImg_area">
						<div class="productImage"><img src="../image/다운로드.jpg" width="560px" height="560px"></div>
						<div class="pre_btn"><button>이전</button></div>
						<div class="next_btn"><button>다음</button></div>
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
										<button>asd</button>
									</a>
								</div>
							</div>
							<div class="price_area">
								<div class="priceTitle"><span>가격</span></div>
								<div class="price"><span>123123</span></div>
							</div>
						</div>
						
						<div class="btn_area">
							<div class="buyButton" onclick="location.href='#'">
								<span>구매</span>
								<span>12312</span>				
							</div>
							<div class="sellButton" onclick="location.href='#'">
								<span>판매</span>
								<span>12312</span>				
							</div>
							<div class="wish">
								<img src="">
								<span>관심상품</span>
								<span>123</span>
							</div>
						</div>
						
						<div class="productInfo">
							<div>상품 정보</div>
							<div>
								<div class="productInfo_1">
									<span>모델번호</span>
									<span>123123</span>
								</div>
								<div class="productInfo_1">
									<span>출시일</span>
									<span>123123</span>
								</div>
								<div class="productInfo_1">
									<span>컬러</span>
									<span>123123</span>
								</div>
							</div>
						</div>
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
						</div>
					</div>
				</div>
				<div class="otherProduct">
					<h3>추천상품</h3>
					<div class="o_product">
						<div>
							<img src="">
						</div>
						<div class="o_info">
							<p>상품이름</p>
						</div>
						
						<div class="o_price">
							<p>
								<span>123123</span>
								<span>원</span>
							</p>
						</div>
					</div>
				</div>
					
				<div class="feed_area">
					<h3>리뷰(스타일)<span>123</span></h3>
					<div class="feed_contents" onclick="">
						<div class="feed_img">
							<img src="">
						</div>
						<div class="feed">
							<div class="feed_user">
								<img src="">
								<p>ID</p>
								<span><img src="">23</span>
							</div>
								<div class="feed_con">
							</div>
						</div>
						<div class="more_area">
							<button>더보기</button>
						</div>
					</div>
				</div>
			</div>
		</main>
	
	</body>
</html>