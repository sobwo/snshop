<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
							<img src="" id="profileImg_show">
						</div>
						<div class="user_info user_info_profile">
							<strong class="user_name user_name_profile">${mv.memberName}</strong>
							<div class="imgBtn_wrap">
									<label for="profileImg"><div class="myPageBtn" id="myPageBtn">이미지 변경</div></label>
									<input type="file" multiple="multiple" name="profileImg" id="profileImg">
								<input type="button" class="myPageBtn" value="삭제" onclick="deleteImg()">
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
									<input type="text" class="profile_contents" value="${mv.memberId}" readonly>
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>비밀번호</h3>		
								</div>
								<div class="profile_user_info">
									<input type="password" class="profile_contents" value="${mv.memberPw}" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status modify_password_area">
										<h6 class="modify_info_title">새로운 비밀번호</h6>
										<input type="password" class="modify_info_status_1" id="modify_pw" name="modify_pw" placeholder="비밀번호를 입력하세요.">
										<input type="password" class="modify_info_status" id="modify_pw2" placeholder="비밀번호를 다시 입력하세요.">
										<span class="msg" id="pw_msg"></span>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<button class="modify_btn_2" disabled="disabled" value="pw">변경</button>
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
									<input type="text" class="profile_contents" value="${mv.memberName}" readonly>
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
										<button class="modify_btn_2" disabled="disabled" value="name">변경</button>
									</div>
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>이메일 주소</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="${mv.memberEmail}" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status">
										<h6 class="modify_info_title">이메일 주소</h6>
										<input type="text" class="modify_info_status" id="modify_email" name="modify_email" placeholder="이메일 주소을 입력하세요.">
										<span class="msg" id="email_msg"></span>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<button class="modify_btn_2" disabled="disabled" value="email">변경</button>
									</div>
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>휴대폰 번호</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="${mv.memberPhone}" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status">
										<h6 class="modify_info_title">휴대폰 번호</h6>
										<input type="text" class="modify_info_status" id="modify_phone" name="modify_phone" placeholder="휴대폰 번호를 입력하세요.">
										<span class="msg"  id="phone_msg"></span>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<button class="modify_btn_2" disabled="disabled" value="phone">변경</button>
									</div>
								</div>
							</div>
							<div class="profile_unit">
								<div class="profile_title">
									<h3>성별</h3>		
								</div>
								<div class="profile_user_info">
									<input type="text" class="profile_contents" value="${mv.memberGender}" readonly>
									<input type="button" class="modify_btn" value="변경">
								</div>
								<div class="profile_modify_info" style="display:none">
									<div class="profile_modify_info_status modify_gender_area">
										<h6 class="modify_info_title">새로운 성별</h6>
										<div class="modifyGender_area">
											<div id="man">남성<input type="radio" class="modifyGender" name="modifyGender" value="man"/></div>
											<div id="woman">여성<input type="radio" class="modifyGender" name="modifyGender" value="woman"/></div>
										</div>
									</div>
									<div class="modify_btn_box">	
										<input type="button" class="modify_btn_1" value="취소">
										<button class="modify_btn_2" disabled="disabled" value="gender">변경</button>
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
			$(document).ready(function(){
				$('input[type="file"]').change(function() {
				    imageFilter(this); // 이미지 파일 필터링
				    inputImg();
				});
				
				showImg();
			});
			function inputImg(){
				var formdata = new FormData();
				formdata.append('profileImg', $('#profileImg')[0].files[0]);
				$.ajax({
					url: "${pageContext.request.contextPath}/myPage/profileImgChange.do",		
					method: "POST",
					data: formdata,
					processData : false,
			        contentType : false,
					success : function(data){
							var result = JSON.parse(data);
							if(result.value==1){
								showImg();
							}
						},
						error : function(request,status,error){
							alert("다시 시도하시기 바랍니다.");	
							console.log("code: " + request.status);
					        console.log("message: " + request.responseText);
					        console.log("error: " + error);
						}	
				});	
			}
			
			function showImg(){
				var src;
				$.ajax({
					url: "${pageContext.request.contextPath}/myPage/profileImgShow.do",		
					method: "GET",
					dataType: "json",
					success : function(data){
						if(data.value != ""){
							src = "${pageContext.request.contextPath}/resources/uploadFiles"+data.value;
							$("#profileImg_show").attr("src",src);
						}
						else{
							src = "${pageContext.request.contextPath}/resources/image/blank_profile.png";
							$("#profileImg_show").attr("src",src);
						}
						
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});	
			}
			
			function deleteImg(){
				$.ajax({
					url: "${pageContext.request.contextPath}/myPage/profileImgDelete.do",		
					method: "POST",
					dataType: "json",
					success : function(data){
						if(data.value==1){
							showImg();
						}
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});	
			}
			
			
			$(".modify_btn_2").on("click",function(){
				var value;
				if($(this).val() == "pw") value=$("#modify_pw").val();
				else if($(this).val()=="name") value=$("#modify_name").val();
				else if($(this).val()=="email") value=$("#modify_email").val();
				else if($(this).val()=="phone") value=$("#modify_phone").val();
				else if($(this).val()=="gender") value=$('input[name=modifyGender]:checked').val();
				
				infoChange($(this).val(), (value));
			});
			
			function infoChange(index,value){
				$.ajax({
					url: "${pageContext.request.contextPath}/myPage/infoChange.do",		
					method: "POST",
					data: {"index":index, "value":value},
					dataType: "json",
					success : function(data){
						if(data.result==1){
						    location.reload();
						}
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});	
			}			
		</script>
	</body>
</html>