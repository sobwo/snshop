<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>구매 동의</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<style>    
			#main_inner{
				display:flex;
				width:100%;
				height:24px;
				padding:20px 40px;
				justify-content:space-between;
				align-items: center;
				flex-direction: row;
			}
			#logo{
				width:120px;
				height:22px;
			}
			#purchase{
				text-align: center;
				flex: 1;
			}
			.purchaseContainer{
				width:1902px;
				height:881px;
				background-color: #fafafa;
			}
			.buyContent{
				width:700px;
				height:701px;
				margin: 0 auto;
			    padding: 20px 40px 160px;
			    max-width: 780px;
			}
			.buyBox{
				width:700px;
				height:601px;
				background-color: #fff;
			}
			.buyTitle{
				display: flex;
			    -webkit-box-align: center;
			    align-items: center;
			    line-height: 38px;
			    padding: 32px 32px 40px;
			    font-size: 25px;
			    letter-spacing: -.48px;
			    font-weight: 700;
			}
			.accentTitle{
				color: #f15746;
			}
			.buyProduct{
				display: flex;
				align-items: center;
				width: 636px;
				height: 80px;
				padding: 0 32px 18px;
			}
			.buyItem{
				width: 80px;
				height: 80px;
				object-fit: cover;
			    image-rendering: auto;
			}
			.buyInfo{
				width: 540px;
				height: 80px;
				padding-left: 16px;
				text-align: left;
			}
			.modelNumber{}
			.modelName{}
			.modelSize{}
			.buyCheckBox{
				width:700px;
				height:493px;
			}
			.checkList{
				margin: 0 32px 8px;
				padding: 0;
				border-top: 2px solid #222;
			}
			.checkList li{
				padding: 19px 0 20px;
				border-top: 1px solid #ebebeb;
				display: flex;
				align-items: center;
			}
			.notice{
				width: 404.719px;
				height:38px;
				margin-right: 20px;
			}
			.noticeMain{
				width:410px;
				height:18px;
			    line-height: 18px;
			    font-size: 15px;
			    letter-spacing: -.01px;
			}
			.noticeSub{
			    margin-top: 4px;
			    line-height: 16px;
			    font-size: 13px;
			    letter-spacing: -.07px;
			    letter-spacing: -.05px;
			    color: rgba(34,34,34,.5);
			}
			.checkboxWrap{
				margin-left: auto;
			}
			#checkbox{
				width:24px;
				height:24px;
			}
			.confirmBtn{
				width:636px;
				height:52px;
				padding:32px 32px;
			}
			#buyContinue{
				width:636px;
				height:52px;
				background-color: #ebebeb;
				color: #fff;
			    vertical-align: middle;
			    text-align: center;
			    font-weight: 700;
			    font-size:20px;
			    border-radius: 8px;
			    border:none;
			}
			
		</style>
	</head>
	<body>
		<div id="top_inner">
			<div id="top_menu">
				<ul>
					<li><a>고객센터</a></li>
					<li style='margin-left:24px'><a>관심상품</a></li>
					<li style='margin-left:24px'><a>로그인</a></li>
					<li><a>로그아웃</a></li>
				</ul>
			</div>
		</div>
		<div id="header_main">
			<div id="main_inner">
				<div id="logo">
					<h1 style='font-size:22px;'><a>로고</a></h1>
				</div>
				<div id="purchase">
					<h1 style='font-size:22px;'>구매동의</h1>
				</div>
			</div>
		</div>
		<div class="purchaseContainer">
			<div class="buyContent">
				<div class="buyBox">
					<div class="buyTitle">
						<h2>
							<span class="accentTitle">구매</span>
							하시기 전에 꼭 확인하세요.					
						</h2>
					</div>
					<div class="buyProduct">
						<img class="buyItem" src=""/>
						<div class="buyInfo">
							<strong class="modelNumber">123456789</strong>
							<p class="modelName">조던 1 레트로 하이 OG 시카고</p>
							<p class="modelSize">230</p>
						</div>				
					</div>
					<div class="buyCheckBox">
					<ul class="checkList">
						<li>
							<div class="notice">
								<p class="noticeMain">구매하려는 상품이 맞습니다.</p>
								<p class="noticeSub">상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한번 더 확인했습니다.</p>
							</div>
							<div class="checkboxWrap">
								<input type="checkbox" name="checkbox" id="checkbox">
							</div>
						</li>
						<li>
							<div class="notice">
								<p class="noticeMain">제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</p>
								<p class="noticeSub">박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.</p>
							</div>
							<div class="checkboxWrap">
								<input type="checkbox" name="checkbox" id="checkbox">
							</div>
						</li>
						<li>
							<div class="notice">
								<p class="noticeMain">최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.</p>
								<p class="noticeSub">건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 패널티, 부정거래 등의 이용정책을 확인했습니다.</p>
							</div>
							<div class="checkboxWrap">
								<input type="checkbox" name="checkbox" id="checkbox">
							</div>
						</li>
					</ul>
					<div class="confirmBtn">
						<input type="button" name="buyContinue" id="buyContinue" value="구매 계속" onclick="">
						<label for="buyContinue"></label>
					</div>
				</div>
				</div>	
			</div>
		</div>	
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	</body>
</html>