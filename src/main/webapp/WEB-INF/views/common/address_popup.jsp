<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/myPage/basic_popup.css" rel="stylesheet"/>
</head>
<body>
	<!-- 팝업창 -->
	<div class="basic_popup_wrap" style="display:none">
		<div class="basic_popup">
			<div class="popup_head">
				<h2 class="popup_name">새 주소 추가</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<!-- 이름 -->
				<div class="basic_wrap">
					<div class="basic_title_wrap">
						<h3 class="basic_title">이름</h3>
					</div>
					<div class="basic_input_wrap">
						<input type="text" class="basic_input" id="basic_name" name="basicName" placeholder="수령인의 이름">
					</div>
					<span class="basic_msg" style="display:none">올바른 이름을 입력해주세요.(2~10자)</span>
				</div>
				
				<!-- 휴대폰번호 -->
				<div class="basic_wrap">
					<div class="basic_title_wrap">
						<h3 class="basic_title">휴대폰 번호</h3>
					</div>
					<div class="basic_input_wrap">
						<input type="text" class="basic_input" id="basic_phone" name="basicPhone" placeholder="- 없이 입력">
					</div>
					<span class="basic_msg" style="display:none">정확한 휴대폰 번호를 입력해주세요.</span>
				</div>
				
				<!-- 우편 번호 -->
				<div class="basic_wrap">
					<div class="basic_title_wrap">
						<h3 class="basic_title">우편 번호</h3>
					</div>
					<div class="basic_input_wrap">
						<input type="text" class="basic_input" id="basic_AddrNum" name="basicAddrNum" placeholder="우편번호를 검색하세요.">
					</div>
				</div>
				
				<!-- 주소 -->
				<div class="basic_wrap">
					<div class="basic_title_wrap">
						<h3 class="basic_title">주소</h3>
					</div>
					<div class="basic_input_wrap">
						<input type="text" class="basic_input" id="basic_Addr" name="basicAddr" placeholder="우편번호 검색 후 자동입력 됩니다.">
					</div>
				</div>
				
				<!-- 상세 주소 -->
				<div class="basic_wrap">
					<div class="basic_title_wrap">
						<h3 class="basic_title">상세 주소</h3>
					</div>
					<div class="basic_input_wrap">
						<input type="text" class="basic_input" id="basic_AddrDetail" name="basicAddrDetail" placeholder="건물, 아파트, 동/호수 입력">
					</div>
				</div>
				
				<!-- 기본배송지 설정 체크 -->
				<div class="basic_check">
					<input type="checkbox" class="basic_checkBtn">
					<span class="basic_checkTitle">기본 배송지로 설정</span>
				</div>
			</div>
			<div class="popup_bottom">
				<input type="button" class="basic_btn_1" value="취소">
				<input type="button" class="basic_btn_2" disabled="disabled" value="저장하기">
			</div>
		</div>
	</div>
</body>
</html>