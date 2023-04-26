<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage.css" rel="stylesheet"/>
		<style>
			#user_memberShip{
				width:975px;
				height:100px;
				padding:23px 0 23px 23px;
				border:1px solid #ebebeb;
				border-radius:10px;
				background:#fff;
				display:flex;
				justify-content: space-between;
			}
			
			#user_detail{
				width:293px;
				height:100px;
				display:flex;
			}
			
			#user_thumb{
				width:100px;
				height:100px;
				margin-right:12px;
			}
			
			#user_info{
				height:100px;
			}
			
			#user_name{
				font-size:18px;
				color:#000;
			}
			
			#user_id{
				font-size:14px;
				color:rgba(34,34,34,.5);
			}
			
			.myPageBtn{
				display:inline-block;
				height:36px;
				background:#fff;
				border:1px solid #d3d3d3;
				border-radius:10px;
				padding:0 14px;
				margin-top:12px;
			}
			
			#memberShip_detail{
				width:318px;
				height:100px;
				display:flex;
			}
			
			.memberShip_item{
				width:159px;
				height:100px;
				display:flex;
				justify-content:center;
				flex-direction:column;
				align-items:center;
			}
				
			.info, .title{
				display:block;
				width:159px;
				text-align:center;
			}
			
			.title{
				font-size:13px;
				color:rgba(34,34,34,.5);
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div id="user_memberShip">
						<div id="user_detail">
							<div id="user_thumb"><img src="${pageContext.request.contextPath}/resources/image/blank_profile.png"></div>
							<div id="user_info">
								<strong id="user_name">이름</strong>
								<p id="user_id">ID</p>
								<input type="button" class="myPageBtn" value="프로필 수정">
								<input type="button" class="myPageBtn" value="내 스타일">
							</div>
						</div>
						<div id="memberShip_detail">
							<div class="memberShip_item" style="border-right:1px solid #ebebeb">
								<strong class="info">일반 회원</strong>
								<p class="title">회원 등급</p>
							</div>
							<div class="memberShip_item">
								<strong class="info">0P</strong>
								<p class="title">포인트</p>
							</div>
						</div>
					</div>
					<div class="myHome_title">
						<h3 class="title">구매 내역</h3>
						<a>더보기&rarr;</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>