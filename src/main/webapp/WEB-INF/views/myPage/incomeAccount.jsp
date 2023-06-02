<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 정산 계좌</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_incomeAccount.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
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
					<!-- 판매정산계좌 헤더 -->
					<div class="content_title">
						<h3>판매 정산 계좌</h3>
					</div>
					<form name="frm">
						<!-- 은행명 -->
						<div class="account_registration">
							<div class="account_registration_wrap">
								<div class="ar_title_wrap">
									<h3 class="ar_title">은행명</h3>
								</div>
								<div class="ar_input_wrap">
									<c:choose>
										<c:when test="${rv.refundNo == null}">
											<select class="ar_input" id="ar_bankName" name="ar_bankName">
													<option value="국민">국민은행</option>
													<option value="국민">SC제일은행</option>
													<option value="국민">경남은행</option>
													<option value="국민">광주은행</option>
													<option value="국민">기업은행</option>
													<option value="국민">농협은행</option>
													<option value="국민">대구은행</option>
													<option value="국민">부산은행</option>
													<option value="국민">산업은행</option>
													<option value="국민">새마을금고</option>
													<option value="국민">수협</option>
													<option value="국민">신한은행</option>
													<option value="국민">신협</option>
													<option value="국민">외환은행</option>
													<option value="국민">우리은행</option>
													<option value="국민">우체국</option>
													<option value="국민">전북은행</option>
													<option value="국민">축협</option>
													<option value="국민">카카오뱅크</option>
													<option value="국민">케이뱅크</option>
													<option value="국민">하나은행</option>
													<option value="국민">한국씨티뱅크</option>
													<option value="국민">토스뱅크</option>
											</select>
										</c:when>
										<c:otherwise>
											<input type="text" class="ar_input" id="ar_bankName" name="ar_bankName" value="${rv.accountName}">
										</c:otherwise>
									</c:choose>
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
									<c:choose>
										<c:when test="${rv.refundNo == null}">
											<input type="text" class="ar_input" id="ar_accountNum" name="ar_accountNum" placeholder="- 없이 입력하세요.">
											<span class="ar_msg" style="display:none">-빼고 숫자를 입력해주세요.</span>
										</c:when>
										<c:otherwise>
											<input type="text" class="ar_input" id="ar_accountNum" name="ar_accountNum" value="${rv.accountNum}">
										</c:otherwise>
									</c:choose>
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
									<c:choose>
											<c:when test="${rv.refundNo == null}">
												<input type="text" class="ar_input" id="ar_name" name="ar_name" placeholder="예금주 명을 정확히 입력하세요.">
											</c:when>
											<c:otherwise>
												<input type="text" class="ar_input" id="ar_name" name="ar_name" value="${rv.accountUserName}">
											</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						
						<!-- 저장하기버튼 -->
						<div class="ar_btn_area">
							<c:choose>
								<c:when test="${rv.refundNo == null}">
									<input type="button" class="ar_btn" disabled="disabled" value="저장하기" onclick="accountAdd()">
								</c:when>
								<c:otherwise>
									<input type="button" class="ar_btn" value="수정하기" onclick="accountModify()"
									style="background:#222">
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/incomeAccount.js"></script>
		<script>
			var msg = "${msg}";
			if(msg != "")
				alert(msg);
		
			function accountAdd(){
				var fm = document.frm;
				fm.action="${pageContext.request.contextPath}/myPage/incomeAccountAction.do";
				fm.submit();
			}
			
			function accountModify(){
				var fm = document.frm;
				fm.action="${pageContext.request.contextPath}/myPage/incomeAccountModify.do";
				fm.submit();
			}
		</script>
	</body>
</html>