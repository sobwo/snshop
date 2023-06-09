<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>LogIn</title>
		<link href="${pageContext.request.contextPath}/resources/css/member/member.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/member/memberLogin.css" rel="stylesheet"/>
		<style>
		#naverLogin{
			background-image:url("${pageContext.request.contextPath}/resources/image/naver.png");
		}
		#kakaoLogin{
			background-image:url("${pageContext.request.contextPath}/resources/image/kakao_login.png");
		}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
				<jsp:include page="../common/header_common.jsp"></jsp:include>
			</div>
		<form name="frm">
			<div id="login_wrap">
				<div id="login_inner_wrap">
					<div id="login_area">
						<h2 style='padding-bottom:50px'>
							<span style='font-size:35px'>TLING</span><br/>
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
								<input type="button" id="naverLogin" name="naverLogin" value="네이버로 로그인" onclick="location.href='${urlNaver}'">
							</div>
							<div id="kakaoLogin_area">
								<input type="button" id="kakaoLogin" name="kakaoLogin" value="카카오로 로그인" onclick="location.href='${urlKakao}'">
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/member/memberLogin.js"></script>
		<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
		<script>
			$(document).ready(function(){
				var msg = "${msg}";
				if(msg != "") alert(msg);
			});
			
			function login(){
				var fm = document.frm;
				fm.action="${pageContext.request.contextPath}/member/memberLoginAction.do";
				fm.method="post";
				fm.submit();
			}
		</script>
	</body>
</html>