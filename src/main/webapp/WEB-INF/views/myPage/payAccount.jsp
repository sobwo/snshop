<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결제정보</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_payAccount.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(3) a{
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
					<div class="content_title content_title_on content_title_account">
						<div>
							<h3>결제 정보</h3>
							<span style="display:block;font-size:12px;color:rgba(34,34,34,.5);">수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고지 없이 해당 금액을 결제 시도할 수 있습니다.</span>
						</div>
						<input type="button" class="plus_account" value="+ 새 카드 추가하기">
					</div>
					<div class="payAccount_info_wrap">
						<div class="payAccount_info empty_payAccount_info">추가하신 결제 정보가 없습니다.</div>
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/payAccount.js"></script>
		<script>
		</script>
	</body>
</html>