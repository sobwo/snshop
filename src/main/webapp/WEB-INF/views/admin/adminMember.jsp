<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>회원관리페이지</title>
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
							<td>회원번호</td>
							<td>아이디</td>
							<td>이름</td>
							<td>이메일</td>
							<td>전화번호</td>
							<td>성별</td>
							<td>가입경로</td>
							<td>탈퇴여부</td>
							<td>권한</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mv" items="${mvList}">
							<tr>
								<td>${mv.memberNo}</td>
								<td>${mv.memberId}</td>
								<td>${mv.memberName}</td>
								<td>${mv.memberEmail}</td>
								<td>${mv.memberPhone}</td>
								<td>${mv.memberGender}</td>
								<td>${mv.social}</td>
								<td>${mv.delYn}</td>
								<td>${mv.role}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).on("click",".delYn",function(){
				
				
			});
		</script>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>