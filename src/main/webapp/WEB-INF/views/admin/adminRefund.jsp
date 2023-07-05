<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>환불관리페이지</title>
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
				<div class="filter">
					<ul>
						<li></li>
						<li></li>
					</ul>
				</div>
				<table>
					<thead>
						<tr>
							<td>주문번호</td>
							<td>주문일</td>
							<td>구매/판매</td>
							<td>현황</td>
							<td>입금상황</td>
							<td>환불이유</td>
							<td>환불여부</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="rl" items="${rfList}">
							<tr class="orderList">
								<td class="num">${rl.orderNo}</td>
								<td>${rl.orderDays}</td>
								<td>${rl.pors}</td>
								<td>${rl.orderStatus}</td>
								<td>${rl.statusDetail}</td>
								<td>${rl.reason}</td>
								<c:set var="check" value="${rl.refundReason}" />
								<c:choose>
									<c:when test="${empty check}">
										<td>진행중</td>
									</c:when>
									<c:when test="${not empty check}">
										<td>완료</td>
									</c:when>
								</c:choose>
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
		$(document).on("click",".orderList",function(){
			var orderNo = $(this).children(".num").text();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/adminRefundPopup.do",		
				method: "POST",
				data:{"orderNo":orderNo},
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