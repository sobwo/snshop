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
				height:786px;
			}
			
			#join_area{
				height:666px;
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
		<div id="header_wrap" style='height:94px'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div id="join_wrap">
			<div id="join_inner_wrap">
				<div id="join_area">
					<h2 style='padding-bottom:50px'>
						<span style='font-size:35px'>회원가입</span><br/>
					</h2>
					<div id="joinId_area">
						<h3>ID</h3>
						<div class="input_item">
							<input type="text" id="memberId" name="memberId" placeholder="ID를 입력해주세요." />
						</div>						
					</div>
					<div id="joinPw_area">
						<h3>PASSWORD</h3>
						<div class="input_item">
							<input type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요." />
						</div>						
					</div>
					<div id="joinEmail_area">
						<h3>E-mail</h3>
						<div class="input_item">
							<input type="text" id="memberEmail" name="memberEmail" placeholder="EX)snshop@naver.com" />
						</div>						
					</div>
					<div id="joinPhone_area">
						<h3>핸드폰 번호</h3>
						<div class="input_item">
							<input type="text" id="memberPhone" name="memberPhone" placeholder="EX)010-1234-1234" />
						</div>						
					</div>
					<div id="joinGender_area">
						<h3>성별</h3>
							<div id="joinGender_inner_area">
							<div class="input_item">
								<div id="man">남성<input type="radio" name="memberGender"/></div>
								<div id="woman">여성<input type="radio" name="memberGender"/></div>
							</div>
						</div>						
					</div>
					<div id="joinBtn_area">
						<input type="button" id="joinBtn" name="joinBtn" value="회원가입">
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>