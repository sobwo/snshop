<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.questionContainer{
			width:1000px;
			height:153px;
			margin:20px 0 20px 0;
		}
		.questionTable{
			width:100%;
			height:100%;
			border-collapse: collapse;
		}
		.questionTable td{
			width: 33.3333333333%;
			border:1px solid #ebebeb;
			margin: 0 auto;
			overflow: hidden;
			font-size:20px;
			text-align:center;
		}
		
		.questionTable td a{	
			color: #22222280;
		}
	</style>

</head>
<body>
	<div class="questionContainer">
		<table class="questionTable">
			<tr>
				<td><a href="${pageContext.request.contextPath}/customerCenter/customerCenterQuestion_all.do">전체</a></td>
				<td><a href="${pageContext.request.contextPath}/customerCenter/customerCenterQuestion_use.do">이용정책</a></td>
				<td><a href="${pageContext.request.contextPath}/customerCenter/customerCenterQuestion_common.do">공통</a></td>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/customerCenter/customerCenterQuestion_buy.do">구매</a></td>
				<td><a href="${pageContext.request.contextPath}/customerCenter/customerCenterQuestion_sale.do">판매</a></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>