<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>header_shop</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<style>
			#subject_h2{
				width:1280px;
				height:50px;
				margin:0 auto;
				line-height:50px;
				text-align:center;
			}
			
			#subject_h2 h2{
				font-weight:bold;
				font-size:27px;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:190px;'>
			<jsp:include page="header_common.jsp"></jsp:include>
			<div id="subject_h2">
				<h2>SHOP</h2>
			</div>			
			<div id="header_down">
				<div id="down_inner">
					<ul>
						<li><a>전체</a></li>
						<li style='margin-left:27px'><a>아우터</a></li>
						<li style='margin-left:27px'><a>상의</a></li>
						<li style='margin-left:27px'><a>하의</a></li>
						<li style='margin-left:27px'><a>신발</a></li>
					</ul>
				</div>
			</div>	
		</div>
	</body>
</html>