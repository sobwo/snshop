<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet"/>
		<style>
			#join_wrap{
				height:986px;
			}
			
			#join_area{
				height:866px;
			}
			
			#join_area span{
				text-align:left;
				font-size:12px;
				color:#f00;
			}
			
			#joinId_area, #joinPw_area, #joinEmail_area, #joinPhone_area, #joinGender_area{
				padding:20px 0 24px 0;
			}
			
			#joinGender_inner_area{
				width:400px;
				height:37px;
				padding:8px 30px 8px 0;
			}
			#joinGender_area input{
				width:21px;
				height:21px;
				vertical-align:middle;
				margin-left:10px;
			}
			
			.input_item{
				text-align:left;		
			}
			
			.input_item div{
				display:inline-block;
			}
			
			#woman{
				margin-left:30px;
			}	
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
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
							<input type="text" id="memberPhone" name="memberPhone" placeholder="EX)010-1234-1234" />
						</div>			
						<span id="phoneMsg"></span>			
					</div>
					<div id="joinGender_area">
						<h3>성별(선택)</h3>
							<div id="joinGender_inner_area">
							<div class="input_item">
								<div id="man">남성<input type="radio" name="memberGender"/></div>
								<div id="woman">여성<input type="radio" name="memberGender"/></div>
							</div>
						</div>						
					</div>
					<div id="joinBtn_area">
						<input type="button" id="joinBtn" name="joinBtn" value="회원가입" onclick="check()">
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){});
			function check(){
				var isYN;
				
				let memberId = $("#memberId").val();
				let memberPw = $("#memberPw").val();
				let memberPw2 = $("#memberPw2").val();
				let memberName = $("#memberName").val();
				let memberPhone = $("#memberPhone").val();
				let memberEmail = $("#memberEmail").val();
				
				$("#idMsg").text("");
				$("#pwMsg").text("");
				$("#pw2Msg").text("");
				$("#nameMsg").text("");
				$("#emailMsg").text("");
				$("#phoneMsg").text("");
				
				if(!memberId) {
					$("#idMsg").text("필수 정보입니다.");
					$("#memberId").focus();
					isYN = 0;
				}
				
				if(!memberPw) {
					$("#pwMsg").text("필수 정보입니다."); 
					$("#memberPw").focus();
					isYN = 0;
				}
				
				if(!memberPw2) {
					$("#pw2Msg").text("필수 정보입니다."); 
					$("#memberPw2").focus();
					isYN = 0;
				}
				
				else if(memberPw!=memberPw2){
					$("#pw2Msg").text("비밀번호가 일치하지 않습니다."); 
					$("memberPw2").focus();
					isYN = 0;
				}
				
				if(!memberName) {
					$("#nameMsg").text("필수 정보입니다."); 
					$("#name").focus();
					isYN = 0;
				}
				
				if(!memberPhone) {
					$("#phoneMsg").text("필수 정보입니다."); 
					$("#memberPhone").focus();
					isYN = 0;
				}
				else if(isNaN(memberPhone)){
					$("#phoneMsg").text("숫자를 입력해주세요."); 
					$("#memberPhone").focus();
					isYN = 0;
				}
				
				if(!memberEmail) {
					$("#emailMsg").text("필수 정보입니다."); 
					$("#memberEmail").focus();
					isYN = 0;
				}
				
				else IdCheck();
			}
			
			function IdCheck(){
	 			let memberId = $("#memberId").val();
	 			var isYN;
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