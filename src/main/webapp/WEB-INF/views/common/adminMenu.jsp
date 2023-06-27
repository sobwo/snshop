<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<style>
			.menu_wrap{
				width:180px;
			}
			
			.menu_wrap h2{
				width:180px;
				height:29px;
				padding-bottom:30px;
			}
			.menu_wrap a{
				font-size:24px;
			}
			
			.snb_list{
				width:180px;
			}
			
			.snb_title{
				display:block;
				font-size:20px;
			}
			
			.snb_list li{
				font-size:17px;
				letter-spacing: .15px;
				margin-top:12px;
			}
			
			.snb_list a{
				color:rgba(34,34,34,.5);
			}
		</style>
	</head>
	<body>
		<div class="menu_area">
			<div class="menu_wrap">
				<h2><a href="${pageContext.request.contextPath}/admin/adminMain.do">관리자페이지</a></h2>
			</div>
			<div class="snb_list">
				<ul class="shopping_info_list">
					<li><a href="${pageContext.request.contextPath}/admin/adminMember.do">회원정보관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/adminGoods.do">상품관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/adminOrder.do">주문내역관리</a></li>
					<li><a href="${pageContext.request.contextPath}/admin/adminRefund.do">환불요청관리</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>