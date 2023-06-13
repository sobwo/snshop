<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<%-- 	<link href="${pageContext.request.contextPath}/resources/css/shopSell.css" rel="stylesheet"> --%>
	<style>
		.layout{
			width : 1900px;
			display : flex;
			flex-direction : column;
			justify-content: flex-start;
			align-items: center;
		}
		.inner{
			width : 40%;
			padding-top : 190px;
			display: flex;
			flex-direction : column;
		}
		.goodsContaner{
			display: flex;
			justify-content: center;
			border-bottom: 1px solid #ebebeb;
			width : 100%;
		}
		.goodsArea{
			display : flex;
			flex-direction : row;
			padding: 10px;
		}
		.goodsImg{
			width: 120px;
			height: 120px;
			margin-right : 20px;
		}
		.goodsImg img{
			object-fit : fill;
		}
		.goodsImfo{
			display: flex;
			flex-direction: column;
			justify-content: center;
			padding: 5px;
		}
		.goodsName{
			margin : 5px 0 ;
		}
		
		.sizeArea{
			display: grid;
			grid-template-columns: repeat(3,1fr);
			grid-auto-rows: minmax(30px, auto);
			grid-column-gap: 1px;
			column-gap: 10px;
			grid-row-gap: 1px;
			row-gap: 10px;
			padding: 25px;
			text-align: center;
		}
		.alpaSizeArea{
			display: grid;
			grid-template-columns: repeat(2,1fr);
			grid-auto-rows: minmax(30px, auto);
			grid-column-gap: 1px;
			column-gap: 10px;
			grid-row-gap: 1px;
			row-gap: 15px;
			padding: 25px;
			text-align: center;
		}
		.sizeBtn{
			border: 1px solid #ebebeb;
			background-color: white;
			border-radius : 5px;
			font-size: 13px;
		}
		.sizeOne{
			margin : auto;
		}
		.sizeOneBtn{
			width: 230px;
			height: 30px;
		}
		.submitBtnAera{
			margin: auto;
			padding: 30px;
		}
		.submit{
			background-color:#41b979;
			border:none;
			border-radius: 10px;
			font-size:18px;
			font-weight:bold;
			display: flex;
			flex-direction: column;
			width: 230px;
			height: 60px;
			justify-content: center;
			align-items: center;
		}

		
	</style>
	
	</head>
	<body>
		<div class="layout">
			<div id="header_wrap" style='height:94px;border:0'>
				<jsp:include page="../common/header_common.jsp"></jsp:include>
			</div>
			<div class="inner">
				<div class="goodsContaner">
					<div class="goodsArea">
						<div class="goodsImg">
							<img alt="" src="${pd.imgFileName}" />
						</div>
						<div class="goodsImfo">
							<div class="modelNum">${pd.modelNum}</div>
							<div class="goodsName">${pd.goodsName}</div>
							<div class="goodsEnglishName">${pd.goodsEng}</div>
						</div>
					</div>
				</div><!-- goodsContaner -->
				<c:choose>
					<c:when test="${value==0}">
						<div class="sizeArea">
							<c:forEach begin="200" end="330" step="5" var="i">
								<button class="sizeBtn" value="${i}">${i}</button>
							</c:forEach>
						</div><!--sizeArea-->
					</c:when>
					
					<c:when test="${value==1}">
						<c:set var="alpabetSize" value='XXS, XS, S, M, L, XL, XXL, XXXL' />
						<div class="alpaSizeArea">
							<c:forEach items="${alpabetSize}" var="j">
								<button class="sizeBtn" value="${j}">${j}</button>
							</c:forEach>
						</div>
						<div class="sizeArea">
							<c:forEach begin="28" end="36" step="1" var="k">
								<button class="sizeBtn" value="${k}">${k}</button>
							</c:forEach>
						</div><!--sizeArea-->
					</c:when>
					
					<c:when test="${value==2}">
						<div class="sizeOne">
							<button class="sizeBtn sizeOneBtn" value="0">단일사이즈입니다</button>
						</div>
					</c:when>
				
				</c:choose>
				
				<div class="submitBtnAera" style="display:none;">
					<button class="submit">
						<span>${pd.price}</span>
						<span>판매하기</span>
					</button>
				</div>
				
			</div><!-- inner -->
			<jsp:include page="../common/footer.jsp"></jsp:include>
		 </div><!-- layout -->
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).on("click",".sizeBtn",function(){
				$(".sizeBtn").css({
					border: "1px solid #ebebeb",
					"border-radius" : "5px",
					"font-size": "13px",
					"font-weight" : "Normal"
				});
				
				$(this).css({
					border : "1px solid black",
					"font-size" :"16px",
					"font-weight" : "bold"
				});
				$(".submitBtnAera").show();
				
			});
			
			$(docunemt).on("click",".submit",function(){
				
				
				
			});
		</script>
	</body>
</html>