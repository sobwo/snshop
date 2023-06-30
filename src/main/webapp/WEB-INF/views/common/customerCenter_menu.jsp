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
					<c:set var="role" value = "${sessionScope.role}" />
						<c:if test="${role eq 'admin'}">
						<%-- <li><a href='${pageContext.request.contextPath}/AdminWrite/AdminWrite.do'>공지사항 글쓰기</a></li> --%>
						<li><a href="#" onclick="showConfirmation()">공지사항 글쓰기</a></li>
				  	</c:if>
				</ul>
			</div>
		</div>
		<script>
			function showConfirmation() {
			  if (confirm("공지 사항을 작성하시겠습니까?")) {
			    var url = "${pageContext.request.contextPath}/AdminWrite/AdminWrite.do";
			    window.location.href = url;
			  }
			}
		</script>
	</body>
</html>