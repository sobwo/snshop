<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로필정보</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_profileInfo.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(1) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../common/purchase_popup.jsp"></jsp:include>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div class="content_title content_title_on">
						<h3>프로필 정보</h3>
					</div>
					<div class="user_profile">
						<div class="user_thumb">
							<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
						</div>
						<div class="user_info user_info_profile">
							<strong class="user_name user_name_profile">이름</strong>
							<div class="imgBtn_wrap">
								<input type="button" class="myPageBtn" value="이미지 변경">
								<input type="button" class="myPageBtn" value="삭제">
							</div>
						</div>
					</div>
					<div class="profile_info">
						<div class="profile_group">
							<h2>로그인 정보</h2>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>ID</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="asdfasdf" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>비밀번호</h3>		
								</div>
								<div class="profile_user_info">
									<input type="password" class="profile_contents" value="asdfasdf" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
							</div>
						</div>
						<div class="profile_group">
							<h2>개인 정보</h2>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>이름</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="asdfasdf" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
								<div class="profile_modify_info" style="display:none">
									<h6>새로운 이름</h6>
									<input type="text" class="modify_name" name="modify_name" placeholder="이름을 입력하세요.">
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>이메일 주소</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="snshop@naver.com" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>휴대폰 번호</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="010-0000-0000" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>성별</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="남자" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
							</div>
						</div>
						<div class="profile_group">
							<h2>광고성 정보 수신</h2>
							<div class="profile_unit">
								<div class="profile_user_info profile_check_wrap">
									<span class="profile_contents profile_check">이메일</span>
									<div class="radio_btn_area">
										<div class="agree_btn">
											수신 동의&nbsp;<input type="radio" name="email_agree" value="agree">
										</div>
										<div class="agree_btn">
											수신 비동의&nbsp;<input type="radio" name="email_agree" value="disagree">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/purchase_menu.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/calander.js"></script>
		<script>
		</script>
	</body>
</html>