<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기 결과</title>
		<link href="${pageContext.request.contextPath}/resources/css/member/member.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/member/searchPwVal.css" rel="stylesheet"/>
	</head>
	<body>
		<form name="frm">
			<div id="header_wrap" style='height:94px;border:0'>
				<jsp:include page="../common/header_common.jsp"></jsp:include>
			</div>
			<div class="search_wrap">
				<div class="search_inner_wrap">
					<div class="search_area">
						<h2 style='padding-bottom:50px'>
							<span style='font-size:35px'>비밀번호 찾기</span><br/>
							<span style='font-size:15px; font-weight:normal'>비밀번호 변경</span>
						</h2>
						<div id="searchPwVal_area">
							<div id="searchPwVal">
								<div class="input_item">
									<p>ID</p>
									<input type="text" id="searchId" name="searchId" placeholder="ID를 입력해주세요.">
								</div>
								<div class="input_item">
									<p>비밀번호</p>
									<input type="password" id="searchPw" name="searchPw" placeholder="비밀번호를 입력해주세요.">
								</div>
								<div class="input_item">
									<p>비밀번호 확인</p>
									<input type="password" id="searchPw2" placeholder="비밀번호를 입력해주세요.">
								</div>
							</div>
						</div>
						<div id="searchIdValBtn_area">
							<input type="button" class="searchBtn" value="비밀번호 변경" disabled="disabled" onclick="change()">
						</div>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).ready(function(){});
			
			$('#searchId, #searchPw, #searchPw2').on('input',function(){
				var inputId = $('#searchId').val();
				var inputPw = $('#searchPw').val();
				var inputPw2 = $('#searchPw2').val();

				if(inputId != '' && inputPw != '' && inputPw2 != ''){
					$('.searchBtn').prop('disabled', false);
					$('.searchBtn').css('background-color', '#222');
				}
				else{ 
					$('.searchBtn').css('background-color', '#ebebeb');
					$('.searchBtn').prop('disabled', true);
				}
			});
			
			function change(){
				var searchPw = $('#searchPw').val();
				var searchPw2 = $('#searchPw2').val();
				
				if(searchPw != searchPw2){
					alert("비밀번호가 일치하지 않습니다.");
					$("#searchPw2").focus();
				}
				
				else{
					var fm = document.frm;
					fm.action ="${pageContext.request.contextPath}/member/searchPwAction.do";
					fm.method = "post";
					fm.submit();
				}
			}
		</script>
	</body>
</html>