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
				<h2><a href="${pageContext.request.contextPath}/myPage/myPageMain.do">마이 페이지</a></h2>
			</div>
			<div class="snb_list">
				<strong class="snb_title">쇼핑 정보</strong>
				<ul class="shopping_info_list">
					<li><a href='${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying'>구매 내역</a></li>
					<li><a href='${pageContext.request.contextPath}/myPage/orderHistory.do?index=selling'>판매 내역</a></li>
					<li><a href='${pageContext.request.contextPath}/myPage/interest.do'>관심 상품</a></li>
				</ul>
			</div>
			<div class="snb_list" style="margin-top:40px;">
				<strong class="snb_title">내 정보</strong>
				<ul class="memberInfo_list">
					<li><a href='${pageContext.request.contextPath}/myPage/profileInfo.do'>프로필 정보</a></li>
					<li><a href='${pageContext.request.contextPath}/myPage/address.do'>주소록</a></li>
<%-- 					<li><a href='${pageContext.request.contextPath}/myPage/payAccount.do'>결제 정보</a></li> --%>
					<li><a href='${pageContext.request.contextPath}/myPage/incomeAccount.do'>판매 정산 계좌</a></li>
					 <li><a href='${pageContext.request.contextPath}/myPage/point.do'>포인트</a></li>  
				
					
					
				</ul>
			</div>
		</div>
	</body>
</html>