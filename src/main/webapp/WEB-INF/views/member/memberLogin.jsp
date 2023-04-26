<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>LogIn</title>
		<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet"/>
		<style>
			#look_area{
				width:400px;
				height:17px;
				margin-top:20px;
				color:#222;
			}
			
			#look_area li{
				height:100%;
				display:inline-block;
			}
			
			#look_area a{
				padding:0 10px;
				margin:0 22.75px;
				font-size:14px;
			}
			
			#socialLogin_area{
				width:400px;
				height:52px;
				margin-top:40px;
			}
			
			#naverLogin{
				width:100%;
				height:52px;
				background:#fff;
				border:1px solid #ebebeb;
				border-radius:12px;
				font-size:18px;
				font-weight:bold;
				background-image:url("${pageContext.request.contextPath}/resources/image/naver.png");
				background-position: 15px center;
				background-size: 30px;
				background-repeat:no-repeat;
				cursor:pointer;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
				<jsp:include page="../common/header_common.jsp"></jsp:include>
			</div>
		<div id="login_wrap">
			<div id="login_inner_wrap">
				<div id="login_area">
					<h2 style='padding-bottom:50px'>
						<span style='font-size:35px'>SNSHOP</span><br/>
						<span style='font-size:15px; font-weight:normal'>SNS플랫폼 기반 쇼핑몰</span>
					</h2>
					<div id="loginId_area">
						<h3>ID</h3>
						<div class="input_item">
							<input type="text" id="memberId" name="memberId" placeholder="ID를 입력해주세요." />
						</div>						
					</div>
					<div id="loginPw_area">
						<h3>PASSWORD</h3>
						<div class="input_item">
							<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요." />
						</div>						
					</div>
					<div id="loginBtn_area">
						<input type="button" id="loginBtn" name="loginBtn" value="로그인" disabled="disabled" onclick="login()">
					</div>
					<ul id="look_area">
						<li><a href="${pageContext.request.contextPath}/member/memberJoin.do">회원 가입</a></li>
						<li style='border-left:1px solid #ebebeb;border-right:1px solid #ebebeb'><a href="${pageContext.request.contextPath}/member/searchId.do">아이디 찾기</a></li>
						<li><a href="${pageContext.request.contextPath}/member/searchPw.do">비밀번호 찾기</a></li>
					</ul>
					<div id="socialLogin_area">
						<div id="naverLogin_area">
							<input type="button" id="naverLogin" name="naverLogin" value="네이버로 로그인">
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).ready(function(){});
			
			$('#memberId,#memberPw').on('input',function(){
				var inputId = $('#memberId').val();
				var inputPw = $('#memberPw').val();

				if(inputId != '' && inputPw != ''){ 
					$('#loginBtn').css('background-color', '#222');
					$('#loginBtn').prop('disabled', false);
				}
				else {
					$('#loginBtn').css('background-color', '#ebebeb');
					$('#loginBtn').prop('disabled', true);
				}
			});
			
			function login(){
				alert("로그인");
			}
		</script>
	</body>
</html>