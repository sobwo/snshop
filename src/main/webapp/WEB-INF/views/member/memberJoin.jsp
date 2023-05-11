<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link href="${pageContext.request.contextPath}/resources/css/member/member.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/member/memberJoin.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
				<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<form name="frm">
			<div id="join_wrap">
				<div id="join_inner_wrap">
					<div id="join_area">
						<h2 style='padding-bottom:50px'>
							<span style='font-size:35px;color:#222;'>회원가입</span><br/>
						</h2>
						<div id="joinId_area">
							<h3>ID</h3>
							<div class="input_item">
								<input type="text" id="memberId" name="memberId" placeholder="ID를 입력해주세요." />
							</div>
							<span id="idMsg"></span>						
						</div>
						<div id="joinPw_area">
							<h3>비밀번호</h3>
							<div class="input_item">
								<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요." />
							</div>
							<span id="pwMsg"></span>						
						</div>
						<div id="joinPw2_area">
							<h3>비밀번호 확인</h3>
							<div class="input_item">
								<input type="password" id="memberPw2" name="memberPw2" placeholder="비밀번호를 입력해주세요." />
							</div>
							<span id="pw2Msg"></span>						
						</div>
						<div id="joinName_area">
							<h3>이름</h3>
							<div class="input_item">
								<input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요." />
							</div>
							<span id="nameMsg"></span>						
						</div>
						<div id="joinEmail_area">
							<h3>E-mail</h3>
							<div class="input_item">
								<input type="text" id="memberEmail" name="memberEmail" placeholder="EX)snshop@naver.com" />
							</div>
							<span id="emailMsg"></span>						
						</div>
						<div id="joinPhone_area">
							<h3>핸드폰 번호</h3>
							<div class="input_item">
								<input type="text" id="memberPhone" name="memberPhone" placeholder="EX)01012341234" />
							</div>			
							<span id="phoneMsg"></span>			
						</div>
						<div id="joinGender_area">
							<h3>성별(선택)</h3>
								<div id="joinGender_inner_area">
								<div class="input_item">
									<div id="man">남성<input type="radio" name="memberGender" value="man"/></div>
									<div id="woman">여성<input type="radio" name="memberGender" value="woman"/></div>
								</div>
							</div>						
						</div>
						<div id="joinBtn_area">
							<input type="button" id="joinBtn" name="joinBtn" value="회원가입" disabled="disabled">
						</div>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/member/memberJoin.js"></script>
		<script>
			//memberJoin 로그인 버튼
	
			function IdCheck(){
				let memberId = $("#memberId").val();
				$.ajax({
					url: "${pageContext.request.contextPath}/member/memberIdCheck.do",		
					method: "POST",
					data: {"memberId": memberId },
					dataType: "json",
					success : function(data){
							if (data.value == 1){
								$("#idMsg").text("중복된 ID 입니다.");
								$("#memberId").focus();
							}
							else{
								alert("회원가입 완료");
								var fm = document.frm;
								fm.action ="${pageContext.request.contextPath}/member/memberJoinAction.do";
								fm.method = "post";
								fm.submit();
								fm.reset();
							}
						},
						error : function(request,status,error){
							alert("다시 시도하시기 바랍니다.");		
						}	
				});	
			}
			
		</script>
	</body>
</html>