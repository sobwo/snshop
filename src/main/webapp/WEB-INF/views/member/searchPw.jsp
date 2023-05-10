<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<link href="${pageContext.request.contextPath}/resources/css/member/member.css" rel="stylesheet"/>
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
							<span style='font-size:15px; font-weight:normal'>비밀번호 찾는 방법을 선택해 주세요.</span>
						</h2>
						<div class="searchPhone_area">
							<div class='search_radio_wrap'>
								<input type="radio" name="searchMeasure" value="phone"><h3>회원정보에 등록한 휴대전화로 찾기</h3>
							</div>
							<div class="searchInfo">
									<p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 합니다.</p>
							</div>
							<div class="searchPhone">
								<div class="input_item">
									<input type="text" id="memberId_phone" name="memberId_phone" value="${memberId}" placeholder="ID를 입력해주세요.">
								</div>		
								<div class="input_item">
									<input type="text" id="memberName_phone" name="memberName_phone" placeholder="이름을 입력해주세요.">
								</div>	
								<div class="input_item">
									<input type="text" id="memberPhone" name="memberPhone" placeholder="휴대폰번호를 입력해주세요.">
								</div>
							</div>				
						</div>
						<div class="searchEmail_area">
							<div class="search_radio_wrap">
								<input type="radio" name="searchMeasure" value="email"><h3>회원정보에 등록한 이메일 주소로 찾기</h3>
							</div>
							<div class="searchInfo">
								<p>회원정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 합니다.</p>
							</div>
							<div class="searchEmail">
								<div class="input_item">
									<input type="text" id="memberId_email" name="memberId_email" value="${memberId}" placeholder="ID를 입력해주세요.">
								</div>
								<div class="input_item">
									<input type="text" id="memberName_email" name="memberName_email" placeholder="이름을 입력해주세요.">
								</div>
								<div class="input_item">
									<input type="text" id="memberEmail" name="memberEmail" placeholder="이메일을 입력해주세요.">
								</div>
							</div>						
						</div>
						<div class="searchBtn_area">
							<input type="button" class="searchBtn" name="searchBtn" value="찾기" disabled="disabled" onclick="search()">
						</div>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/member/searchPw.js"></script>
		<script>
			$(document).ready(function(){
				var msg = "${msg}"
				if(msg!="") alert(msg);
			});
			function search(){
				var fm = document.frm;
				fm.action ="${pageContext.request.contextPath}/member/searchPwAction.do";
				fm.method = "post";
				fm.submit();
				fm.reset();
			}
		</script>
	</body>
</html>