<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 정산 계좌</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_incomeAccount.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(4) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<!-- 판매정산계좌 헤더 -->
					<div class="content_title">
						<h3>판매 정산 계좌</h3>
					</div>
					
					<!-- 은행명 -->
					<div class="account_registration">
						<div class="account_registration_wrap">
							<div class="ar_title_wrap">
								<h3 class="ar_title">은행명</h3>
							</div>
							<div class="ar_input_wrap">
								<input type="text" class="ar_input" id="ar_bankName" name="ar_bankName" placeholder="은행명을 입력하세요.">
							</div>
						</div>
					</div>
					
					<!-- 계좌번호 -->
					<div class="account_registration">
						<div class="account_registration_wrap">
							<div class="ar_title_wrap">
								<h3 class="ar_title">계좌번호</h3>
							</div>
							<div class="ar_input_wrap">
								<input type="text" class="ar_input" id="ar_accountNum" name="ar_accountNum" placeholder="- 없이 입력하세요.">
								<span class="ar_msg" style="display:none">-빼고 숫자를 입력해주세요.</span>
							</div>
						</div>
					</div>
					
					<!-- 예금주 -->
					<div class="account_registration">
						<div class="account_registration_wrap">
							<div class="ar_title_wrap">
								<h3 class="ar_title">예금주명</h3>
							</div>
							<div class="ar_input_wrap">
								<input type="text" class="ar_input" id="ar_name" name="ar_name" placeholder="예금주 명을 정확히 입력하세요.">
							</div>
						</div>
					</div>
					
					<!-- 저장하기버튼 -->
					<div class="ar_btn_area">
						<input type="button" class="ar_btn" disabled="disabled" value="저장하기">
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/incomeAccount.js"></script>
		<script>
		</script>
	</body>
</html>