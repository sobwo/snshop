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
				<h2><a href="${pageContext.request.contextPath}/customerCenter/customerCenterMain.do">고객 센터</a></h2>
			</div>
			<div class="snb_list">
				<ul class="customerCenter_list">
					<li><a href='${pageContext.request.contextPath}/customerCenter/customerCenterMain.do'>공지사항</a></li>
					<li><a href='${pageContext.request.contextPath}/customerCenter/customerCenterQuestion_all.do'>자주 묻는 질문</a></li>
					<li><a href='#'>검수 기준</a></li>
				</ul>
			</div>
		</div>
	</body>
</html>