<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자주 묻는 질문</title>
		<link href="${pageContext.request.contextPath}/resources/css/customerCenter.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/customerCenterQuestion.css" rel="stylesheet"/>
		<style>
			.customerCenter_list li:nth-child(2) a{
				color:#222;
				font-weight:bold;
			}
			.questionTable tr:nth-child(2) td:nth-child(1) a{
  				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="customerCenter_wrap">
			<div class="customerCenter_inner_wrap">
				<jsp:include page="../common/customerCenter_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div class="content_title">
						<h3 class="content_title_txt">자주 묻는 질문</h3>
					</div>
					<jsp:include page="../common/customerCenter_question.jsp"></jsp:include>
					<ul class="titleSorting">
						<li>
							<div class="titleContainer">
								<div class="titleBox">
									<a>
										<span class="title">
											<strong class="question">구매</strong>
											패널티 정책
											<img class="downImage" src='${pageContext.request.contextPath}/resources/image/down.png/'>
										</span>
									</a>								
								</div>
							</div>	
							<div class="contentContainer">
								<div class="contentBox">
									<P>1.dkfjdakfghjsdk</P>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>