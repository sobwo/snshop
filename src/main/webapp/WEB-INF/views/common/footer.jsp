<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>footer</title>
		<style>
			#footer_wrap{
				font-family:'수트';
				width:1902px;
				height:300px;
				padding-top:100px;
			}
			
			#footer_service_wrap,#corporation_info{
				margin:0 auto;
				width:1200px;
				height:150px;
				padding:40px 40px;
				border:1px solid #e4e4e4;
				border-left:0;
				border-right:0;
				display:flex;
				justify-content:space-between;
				line-height:30px;
			}
			
			#menu_box, #custmor_service{
				width:280px;
				height:500px;
			}
			
			#btn_Wrap{
				padding-top:20px;
			}
			
			#questionBtn{
				background:#222;
				color:#fafafa;
				width:105px;
				height:34px;
			}
			
			#corporation_info li{
				display:inline-block;
				margin-right:50px;
			}
		</style>
	</head>
	<body>
		<div id="footer_wrap">
			<div id="footer_service_wrap">
				<div id="menu_box">
					<h4>고객지원</h4>
					<ul>
						<li><a>공지사항</a></li>
						<li><a>서비스 소개</a></li>
						<li><a>쇼룸 안내</a></li>
						<li><a>판매자 방문 접수</a></li>
					</ul>
				</div>
				<div id="custmor_service">
					<h4>고객센터 0000-0000</h4>
					<p>운영시간 평일 10:00 ~ 18:00(토,일, 공휴일 휴무) 점심시간 평일 13:00 ~ 14:00</p>
					<div id="btn_Wrap">
						<input type="button" id="questionBtn" value="자주 묻는 질문" />
					</div>
				</div>
			</div>
			<div id="corporation_info">
				<ul>
					<li><a>회사소개</a></li>
					<li><a>이용약관</a></li>
					<li><a><strong>개인정보처리방침</strong></a></li>
				</ul>
			</div>
		</div>
	</body>
</html>