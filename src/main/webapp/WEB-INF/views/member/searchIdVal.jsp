<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기 결과</title>
		<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet"/>
		<style>
			#searchIdVal{
				height:150px;
				line-height:150px;
			}
			#searchIdVal *{
				display:inline-block;
			}
			#searchIdVal input[type=radio]{
				margin-right:15px;
			}
			
			#searchLoginBtn, #searchPwBtn{
				background:#444;
				color:#fff;
			}
			
			#searchLoginBtn{
				margin-bottom:15px;
			}
		</style>
	</head>
	<body>
		<form name="frm">
			<div id="header_wrap" style='height:94px'>
				<jsp:include page="../common/header_common.jsp"></jsp:include>
			</div>
			<div id="searchVal_wrap">
				<div id="searchVal_inner_wrap">
					<div id="searchVal_area">
						<h2 style='padding-bottom:50px'>
							<span style='font-size:35px'>아이디 찾기</span><br/>
							<span style='font-size:15px; font-weight:normal'>아이디 검색 결과</span>
						</h2>
						<div id="searchIdVal_area">
							<div id="searchIdVal">
								<input type="radio" name="searchValId"><p>ID</p>
							</div>
						</div>
						<div id="searchValBtn_area">
							<input type="button" id="searchLoginBtn" name="loginBtn" value="로그인" onclick="logIn()">
							<input type="button" id="searchPwBtn" name="searchPwBtn" value="비밀번호 찾기" onclick="searchPw()">
						</div>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).ready(function(){});
			function login(){
				var fm = document.frm;
				fm.action ="${pageContext.request.contextPath}/member/memberLogin.do";
				fm.method = "post";
				fm.submit();
			}
			
			function searchPw(){
				var fm = document.frm;
				fm.action ="${pageContext.request.contextPath}/member/searchPw.do";
				fm.method = "post";
				fm.submit();
			}
		</script>
	</body>
</html>