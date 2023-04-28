<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주소록</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_address.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(2) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/address_popup.jsp"></jsp:include>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div class="content_title">
						<h3>주소록</h3>
						<input type="button" class="plus_address" value="+ 새 배송지 추가">
					</div>
					<div class="address_list">
						<div class="basic_address">
							<div class="address_contents">
								<div class="basic_title">
									<span class="addr_name">이름</span><span class="basic_mark">기본 배송지</span>
								</div>
								<div class="basic_title">
									<span class="addr_phone">010-0000-0000</span>
								</div>
								<div class="basic_title">
									<span class="addr_address">주소</span>
								</div>
							</div>
							<div class="address_btn_area">
								<input type="button" class="address_btn" value="수정">
								<input type="button" class="address_btn" value="삭제">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/address.js"></script>
		<script>
		</script>
	</body>
</html>