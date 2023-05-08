<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로필정보</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_profileInfo.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(1) a{
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
					<!-- 프로필정보 헤더 -->
					<div class="content_title content_title_on">
						<h3>프로필 정보</h3>
					</div>
					
					<!-- 프로필 사진,이름 -->
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
					
					<!-- 로그인정보 -->
					<div class="profile_info">
						<div class="profile_group">
							<h2>로그인 정보</h2>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>ID</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="asdfasdf" readonly>
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
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status modify_password_area">
										<h6 class="modify_info_title">새로운 비밀번호</h6>
										<input type="password" class="modify_info_status_1" id="modify_pw" name="modify_name" placeholder="비밀번호를 입력하세요.">
										<input type="password" class="modify_info_status" id="modify_pw2" placeholder="비밀번호를 다시 입력하세요.">
										<span class="msg" id="pw_msg"></span>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<input type="button" class="modify_btn_2" disabled="disabled" value="저장">
									</div>
								</div>
							</div>
						</div>
						
						<!-- 기타 개인정보 -->
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
									<div class="profile_modify_info_status">
										<h6 class="modify_info_title">새로운 이름</h6>
										<input type="text" class="modify_info_status" id="modify_name" name="modify_name" placeholder="이름을 입력하세요.">
										<span class="msg" id="name_msg"></span>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<input type="button" class="modify_btn_2" disabled="disabled" value="저장">
									</div>
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
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status">
										<h6 class="modify_info_title">이메일 주소</h6>
										<input type="text" class="modify_info_status" id="modify_email" name="modify_name" placeholder="이메일 주소을 입력하세요.">
										<span class="msg" id="email_msg"></span>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<input type="button" class="modify_btn_2" disabled="disabled" value="저장">
									</div>
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
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status">
										<h6 class="modify_info_title">휴대폰 번호</h6>
										<input type="text" class="modify_info_status" id="modify_phone" name="modify_name" placeholder="휴대폰 번호를 입력하세요.">
										<span class="msg"  id="phone_msg"></span>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<input type="button" class="modify_btn_2" disabled="disabled" value="저장">
									</div>
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
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status modify_gender_area">
										<h6 class="modify_info_title">새로운 성별</h6>
										<div class="modifyGender_area">
											<div id="man">남성<input type="radio" class="modifyGender" name="modifyGender"/></div>
											<div id="woman">여성<input type="radio" class="modifyGender" name="modifyGender"/></div>
										</div>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<input type="button" class="modify_btn_2" disabled="disabled" value="저장">
									</div>
								</div>
							</div>
						</div>
						
						<!-- 동의 체크 버튼 -->
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
		<script src="${pageContext.request.contextPath}/resources/js/myPage/profileInfo.js"></script>
		<script>
		</script>
	</body>
</html>