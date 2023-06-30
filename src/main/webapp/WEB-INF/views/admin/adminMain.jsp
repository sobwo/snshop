<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자메인페이지</title>
		<style>
			*{
		 	   font-family: 'Noto Sans KR';
			}
			.mainWrap{
				width : 1900px;
				padding-top: 191px;
				display : flex;
				flex-direction : row;
				justify-content : center;
			}
			.mainInner{
				width:1200px;
				display : flex;
				flex-direction : row;
				padding: 20px;
			}
			.InfoArea{
				display:flex;
				flex-direction : row;
				justify-content : center;
				width : 1000px;
				padding-top : 50px;
			}
			.infoTitle{
				margin-bottom : 5px;
			}
			.memberInfo, .goodsInfo{
				width : 200px;
				border: 1px solid #ebebeb;
				border-radius: 10px;
				background: #fff;
				padding: 20px;
			}
			.memberInfo{
				margin-right : 50px;
			}
			.goodsInfo{
				
			}
			.goodsCnt{
				margin-bottom : 10px;
			}
		</style> 
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<main class = "mainWrap">
			<div class="mainInner">
				<div class="menu">
					<jsp:include page="../common/adminMenu.jsp"></jsp:include>
				</div>
				<div class="InfoArea">
					<div class="memberInfo">
						<h3 class="infoTitle">회원 현황</h3>
						<div>
							<span>회원수</span>
							<span>${memberNum}</span>
								
						</div>
					</div>
					<div class="goodsInfo">
						<h3 class="infoTitle">상품 현황</h3>
						<div>
							<div class="goodsCnt">
								<span>등록 상품수</span>
								<span>${goodsNum}</span>
							</div>
							<div class="refundCnt">
								<span>환불요청수</span>
								<span>${refundNum}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>