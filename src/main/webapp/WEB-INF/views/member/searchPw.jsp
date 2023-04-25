<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet"/>
		<style>
			#search_wrap{
				height:704px;
			}
			
			##search_area{
				height:584px;
			}	
				 		
			.search_radio_wrap{
				width:100%;
				height:21px;
				text-align:left;
				padding-bottom:15px;
			}
			
			.search_radio_wrap h3{
				height:25px;
				font-size:15px;	
				display:inline-block;
				padding-left:20px;	
				vertical-align:middle;	
			}
			
			input[name=searchMeasure]{
				width:19px;
				height:19px;
			}
			
			.searchInfo{
				margin:0 auto;
				margin-top:20px;
				width:500px;
				text-align:left;
			}
		</style>
	</head>
	<body>
		<form name="frm">
			<div id="header_wrap" style='height:94px'>
				<jsp:include page="../common/header_common.jsp"></jsp:include>
			</div>
			<div id="search_wrap">
				<div id="search_inner_wrap">
					<div id="search_area">
						<h2 style='padding-bottom:50px'>
							<span style='font-size:35px'>아이디 찾기</span><br/>
							<span style='font-size:15px; font-weight:normal'>아이디 찾는 방법을 선택해 주세요.</span>
						</h2>
						<div id="searchPhone_area">
							<div class='search_radio_wrap'>
								<input type="radio" name="searchMeasure" value="phone"><h3>회원정보에 등록한 휴대전화로 찾기</h3>
							</div>
							<div id="searchPhone">
								<div class="input_item">
									<input type="text" name="memberId" placeholder="ID를 입력해주세요.">
								</div>		
								<div class="input_item">
									<input type="text" name="memberName" placeholder="이름을 입력해주세요.">
								</div>	
								<div class="input_item">
									<input type="text" name="memberPhone" placeholder="휴대폰번호를 입력해주세요.">
								</div>
								<div class="searchInfo">
									<p>회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 합니다.</p>
								</div>
							</div>				
						</div>
						<div id="searchEmail_area">
							<div class="search_radio_wrap">
								<input type="radio" name="searchMeasure" value="email"><h3>회원정보에 등록한 이메일 주소로 찾기</h3>
							</div>
							<div id="searchEmail">
								<div class="input_item">
									<input type="text" name="memberId" placeholder="ID를 입력해주세요.">
								</div>
								<div class="input_item">
									<input type="text" name="memberName" placeholder="이름을 입력해주세요.">
								</div>
								<div class="input_item">
									<input type="text" name="memberEmail" placeholder="이메일을 입력해주세요.">
								</div>
								<div class="searchInfo">
									<p>회원정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 합니다.</p>
								</div>
							</div>						
						</div>
						<div id="searchBtn_area">
							<input type="button" id="searchBtn" name="searchBtn" value="찾기" onclick="search()">
						</div>
					</div>
				</div>
			</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).ready(function(){
				$('#searchPhone').hide();
				$('#searchEmail').hide();
				$("input:radio[name=searchMeasure]").click(function(){
					if($("input[name=searchMeasure]:checked").val() == "phone"){
						$('#searchEmail').hide();
						$('#searchPhone').show();
						$('#searchPhone_area').css('height','150px');
						$('#searchEmail_area').css('height','100px');
					}
					else if($("input[name=searchMeasure]:checked").val() == "email"){
						$('#searchEmail').show();
						$('#searchPhone').hide();
						$('#searchPhone_area').css('height','100px');
						$('#searchEmail_area').css('height','150px');
					}
				});
			});
			
			function search(){
				var fm = document.frm;
				fm.action ="${pageContext.request.contextPath}/member/searchIdAction.do";
				fm.method = "post";
				fm.submit();
				fm.reset();
			}
		</script>
	</body>
</html>