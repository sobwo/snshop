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
			#searchIdVal input[type=text]{
				border:0;
				font-size:16px;
				text-align:center;
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
			<div class="search_wrap">
				<div class="search_inner_wrap">
					<div class="search_area">
						<h2 style='padding-bottom:50px'>
							<span style='font-size:35px'>아이디 찾기</span><br/>
							<span style='font-size:15px; font-weight:normal'>아이디 검색 결과</span>
						</h2>
						<div id="searchIdVal_area">
							<div id="searchIdVal">
								<input type="radio" id="searchId" name="searchId"><input type="text" id="memberId" name="memberId" value="ID" readonly>
							</div>
						</div>
						<div id="searchIdValBtn_area">
							<input type="button" id="searchLoginBtn" class="searchBtn" name="loginBtn" value="로그인" onclick="logIn()">
							<input type="button" class="searchBtn" name="searchPwBtn" value="비밀번호 찾기" onclick="searchPw()">
						</div>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).ready(function(){});
			
			$('input[name=searchId]').on('click',function(){
				
				if($('#searchId').is(':checked')){
					$('.searchBtn').prop('disabled', false);
					$('.searchBtn').css('background-color', '#222');
				}
				else{ 
					$('.searchBtn').css('background-color', '#ebebeb');
					$('.searchBtn').prop('disabled', true);
				}
			});
			
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