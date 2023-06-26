<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>주문관리페이지</title>
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
						<td>주문번호</td>
						<td>주문일</td>
						<td>주문금액</td>
						<td>주문상품</td>
						<td>사이즈</td>
						<td>구매/판매</td>
						<td>현황</td>
						<td>입금상황</td>
						<td>회원아이디</td>
						<td>전화번호</td>
						<td>주소</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ol" items="${odList}">
						<tr>
							<td>${ol.orderNum}</td>
							<td>${ol.orderDays}</td>
							<td>${ol.totalPrice}</td>
							<td>${ol.goodsName}</td>
							<td>${ol.size}</td>
							<td>${ol.pors}</td>
							<td>${ol.orderStatus}</td>
							<td>${ol.statusDetail}</td>
							<td>${ol.memberId}</td>
							<td>${ol.memberPhone}</td>
							<td>${ol.address}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</main>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>

		</script>
	</body>
</html>