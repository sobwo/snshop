<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>상품관리페이지</title>
		<style type="text/css">
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
			width:1400px;
			display : flex;
			flex-direction : row;
			padding: 20px;
			position:absolute;
		}
		table {
			width: 100%;
			border: 1px solid #ebebeb;
			border-radius: 10px;
			background: #fff;
			border-collapse: collapse;
			text-align: center;
		}
		th, td {
			border: 1px solid #ebebeb;
			padding: 5px;
		}
		.popup_wrap{
			position : relative;
			top: 50px;
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
				<table>
					<thead>
						<tr>
							<td>상품번호</td>
							<td>상품이름</td>
							<td>상품브랜드이름</td>
							<td>가격</td>
							<td>모델넘버</td>
							<td>카테고리</td>
							<td>등록일</td>
							<td>등록자</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="gv" items="${gvList}">
							<tr class="goods">
								<td class="num">${gv.goodsNo}</td>
								<td>${gv.goodsName}</td>
								<td>${gv.goodsBrandName}</td>
								<td>${gv.price}</td>
								<td>${gv.modelNum}</td>
								<td>${gv.category} / ${gv.categoryName}</td>
								<td>${fn:substring(gv.releaseDate,0,10)}</td>
								<td>${gv.memberId}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="popup_wrap" style="display:none">
		
			</div>
		</main>
		
		
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).on("click",".goods",function(){
				var goodsNo = $(this).children(".num").text();
				
				$.ajax({
					url: "${pageContext.request.contextPath}/admin/adminSizeList.do",		
					method: "POST",
					data:{"goodsNo":goodsNo},
					cache : false,
					success : function(data){
						$(".popup_wrap").html(data);
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});
				
				$(".popup_wrap").show();
			});
			
			$(document).on("click",".close",function(){
				$(".popup_wrap").hide();
			});
		</script>
	</body>
</html>