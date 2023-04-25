<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 찾기</title>
		<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet"/>
		<style>
			#searchPhone_area, #searchEmail_area{
				height:200px;
			}
			
			#searchPhone_area h3, #searchEmail_area h3{
				width:150px;
				font-size:15px;	
				display:inline-block;		
			}
			
			input[name=searchMeasure]{
				width:19px;
				height:19px;
			}
		</style>
	</head>
	<body>
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
						<div class="input_item">
							<input type="text" name="memberName_phone">
							<input type="text" name="memberPhone">
						</div>	
						<div>
							<span class="searchInfo">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 합니다.</span>
						</div>				
					</div>
					<div id="searchEmail_area">
						<div class="search_radio_wrap">
							<input type="radio" name="searchMeasure" value="email"><h3>회원정보에 등록한 이메일 주소로 찾기</h3>
						</div>
						<div>
							<span class="searchInfo">회원정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 합니다.</span>
						</div>
						<div class="input_item">
							<input type="text" name="memberName_email">
							<input type="text" name="memberEmail">
						</div>						
					</div>
					<div id="searchBtn_area">
						<input type="button" id="searchBtn" name="searchBtn" value="찾기" onclick="search()">
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 		<script> -->
// 			$(document).ready(function(){
// 				$('#searchPhone_area').hide();
// 				$('#searchEmail_area').hide();
// 				$("input:radio[name=searchMeasure]").click(function(){
// 					if($("input[name=searchMeasure]:checked").val() == "phone"){
// 						$('#emailInput').hide();
// 						$('#phoneInput').show();
// 					}
// 					else if($("input[name=searchMeasure]:checked").val() == "email"){
// 						$('#emailInput').show();
// 						$('#phoneInput').hide();
// 					}
// 				});
// 			});
			
// 			function search(){
// 				var fm = document.frm;
// 				fm.action ="${pageContext.request.contextPath}/search/searchAction.do?var=1";
// 				fm.method = "post";
// 				fm.submit();
// 				fm.reset();
// 			}
<!-- 		</script> -->
	</body>
</html>