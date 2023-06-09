<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고객센터</title>
		<link href="${pageContext.request.contextPath}/resources/css/customerCenter/customerCenter.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/customerCenter/adminWrite.css" rel="stylesheet"/>
		
		
		<style>
			.titleSorting{}
			
			.titleContainer{
				width:1000px;
				height:20px;
				padding:17px 0 19px 0;
				border-bottom: 1px solid #ebebeb;
			}
			.titleBox{
				height:20px;
				margin-right:10px;
			}
			.title{
				width:1000px;
				height:20px;
			}
			
			.customerCenter_list li:nth-child(1) a{
				color:#222;
				font-weight:bold;
			}
			.writeButton{
			    width: 13%;
			    height: 60px;
			    background-color:white;
			    border: none;
			    border-radius: 10px;
			    font-size: 18px;
			    font-weight: bold;
			    color: black;
			    line-height: 60px;
			   	cursor: pointer;
				margin-left:870px;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="customerCenter_wrap">
			<div class="customerCenter_inner_wrap">
				<jsp:include page="../common/customerCenter_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div class="content_title">
						<h3 class="content_title_txt">공지 사항</h3>
					</div>
					<ul class="titleSorting">
						<li>
						<c:forEach var="AWlist" items="${AWlist}">
							<div class="titleContainer">
								<div class="titleBox">
									<a href="${pageContext.request.contextPath}/AdminWrite/AdminDetail.do?AWboardNo=${AWlist.AWboardNo}"><b>[${AWlist.categorytitle}]</b> ${AWlist.AWtitle}</a>
								</div>
							</div>	
						</c:forEach>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>