<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>포인트</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_point.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(5) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="popup/point_popup.jsp"></jsp:include>
		<jsp:include page="popup/admin_coupon.jsp"></jsp:include>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div class="content_title">
						<h3>포인트</h3>
					</div>
					
					<!-- 포인트 내역 창 -->
					<div class="point_area">
						<div class="point_summery">
							<div class="point point_p">
								<span class="point_title">사용 가능 포인트</span>
								<span class="point_content">
									<c:choose>
										<c:when test="${mpv!=null}">
											${mpv.avaPoint}P
										</c:when>
										<c:otherwise>
											0P
										</c:otherwise>
									</c:choose>
								</span>
							</div>
							<div class="point point_n">
								<span class="point_title">이번달 소멸예정 포인트</span>
								<span class="point_content">
									<c:choose>
										<c:when test="${mpv!=null}">
											${mpv.expPoint}P
										</c:when>
										<c:otherwise>
											0P
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						<div class="register_btn">
							<c:choose>
								<c:when test="${sessionScope.memberNo == 1}">
									<input type="button" id="admin_register" class="register admin_coupon_register" value="+ 쿠폰 등록하기">
								</c:when>
								<c:otherwise>
									<input type="button" id="register" class="register" value="+ 포인트 적립하기">
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					<!-- 포인트 설명 -->
					<div class="description">포인트 유효기간은 적립일로부터 최대 1년까지이며, 유형에 따라 달라질 수 있습니다.</div>
					
					<!-- 포인트 적립 내역 -->
					<table class="point_table">
						<thead>
							<tr>
								<td colspan="5" class="point_history_header point_history_title" style="text-align:center">상세 내역</td>
							</tr>
							<tr>
								<td class="point_history_header" style="text-align:center">포인트</td>
								<td class="point_history_header" style="text-align:center">만료기간</td>
								<td class="point_history_header" style="text-align:center">적립 및 사용 현황</td>
								<td class="point_history_header" style="text-align:center">적립 및 사용 날짜</td>
								<td class="point_history_header" style="text-align:center;margin-bottom:20px;">적립/사용</td>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${mpv == null}">
									<tr>
										<td colspan="5" class="point_history_body empty_point">적립 또는 사용한 내역이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="plist" items="${plist}">
										<tr>
											<td class="point_history_body">${plist.point}</td>
											<td class="point_history_body">${plist.expiration}</td>
											<td class="point_history_body">${plist.useHistory}&nbsp;&nbsp;${plist.useDetail}</td>
											<td class="point_history_body">${plist.useDate}</td>
											<td class="point_history_body">${plist.useStatus}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>								
							
						</tbody>
					</table>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/point_popup.js"></script>
		<script>
			$(document).ready(function(){
				var msg = "${msg}";
				if(msg != "")
					alert(msg);
			});
			
			function submitCoupon(){
				var fm = document.frm;
				fm.action = "${pageContext.request.contextPath}/myPage/couponAction.do?index=coupon";
				fm.method = "post";
				fm.submit();
			}
			function addCoupon(){
				var fm = document.frm_admin;
				fm.action = "${pageContext.request.contextPath}/myPage/couponAddAction.do";
				fm.method = "post";
				fm.submit();
			}
			
		</script>
	</body>
</html>