<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>구매내역</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_purchase.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_PitemCommon.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
		<style>
			.shopping_info_list li:nth-child(1) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<form name="frm">
		<jsp:include page="popup/history_popup.jsp"></jsp:include>
		<jsp:include page="popup/purchase_popup.jsp"></jsp:include>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<!-- 구매내역 헤더 -->
					<div class="content_title">
						<h3>구매 내역</h3>
					</div>
					
					<!-- 구매내역 메뉴 -->
					<div class="purchase_category">
						<input type="hidden" class="purchase_index" value="${value}">
						<div class="tab_category category_first">
							<div class="tab_count count_first">${cntAll}</div>
							<div class="tab_title title_first">전체</div>
						</div>
						<div class="tab_category">
							<div class="tab_count">${cntIng}</div>
							<div class="tab_title">진행중</div>
						</div>
						<div class="tab_category">
							<div class="tab_count">${cntEnd}</div>
							<div class="tab_title">종료</div>
						</div>
					</div>

					<!-- 기간별 설정 -->
					<div class="period_search">
						<ul class="month_btn_area">
							<li><input type="button" class="month_link" value="최근 2개월"></li>
							<li><input type="button" class="month_link" value="4개월"></li>
							<li><input type="button" class="month_link" value="6개월"></li>
						</ul>

						<div class="calander_area">
							<input type="date" class="calander" name="startDate" value="${startDate}">
							<span>~</span>
							<input type="date" class="calander" name="endDate" value="${endDate}">
						</div>
						<div>
							<input type="button" class="btn_search" value="조회">
						</div>
					</div>
					<div class="search_info">
						<p>&#183;&nbsp;한 번에 조회 가능한 기간은 최대 6개월입니다.</p>
						<p>&#183;&nbsp;기간별 조회 결과는 결제일 기준으로 노출됩니다.</p>
					</div>
					<div class="search_head">
						<div class="search_filter">
							<span class="search_filter_txt">${filter}</span>
							<span class="downside_img"><img src="${pageContext.request.contextPath}/resources/image/downside.png"></span>
						</div>
						<div class="price_filter">
							<span class="price_txt">구매 금액&nbsp;
								<c:choose>
									<c:when test="${price=='initial'}">
										<img class="price_btn_img" src="${pageContext.request.contextPath}/resources/image/updownfilter.png">
									</c:when>
									<c:when test="${price=='up'}">
										<img class="price_btn_img" src="${pageContext.request.contextPath}/resources/image/invertedTriangle.png">
									</c:when>
									<c:when test="${price=='down'}">
										<img class="price_btn_img" src="${pageContext.request.contextPath}/resources/image/triangle.png">
									</c:when>
								</c:choose>
							</span>
							<input type="hidden" class="price_filter_index" value="${price}"/>
						</div>
					</div>
				<!--  구매내역 리스트 -->
				<div class="purchase_contents_wrap">
					<c:forEach var="alist" items="${alist}">
						<div class="purchase_contents" onclick="showHistory('${alist.orderNo}')">
							<div class="purchase_detail">
								<div class="purchase_thumb">
									<!-- 이미지 파일(수정해야될곳) -->
									<img src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
								</div>
								<div class="purchase_info">
									<p class="purchase_name"><strong>${alist.goodsName}</strong></p>
									<p class="purchase_price">${alist.totalPrice}</p>
									<p class="purchase_size">${alist.size}</p>
									<p class="purchase_date">${alist.orderDays}</p>
								</div>
							</div>
							<div class="delivery_info">
								<c:choose>
									<c:when test="${alist.statusDetail == '입금대기' }">
										<p class="delivery_status">입금대기</p>
									</c:when>
									<c:when test="${alist.statusDetail == '입금완료' }">
										<p class="delivery_status">입금완료</p>
									</c:when>
									<c:when test="${alist.statusDetail == '상품준비중' }">
										<p class="delivery_status">상품준비중</p>
									</c:when>
									<c:when test="${alist.statusDetail == '발송완료' }">
										<p class="delivery_status">발송완료</p>
									</c:when>
									<c:when test="${alist.statusDetail == '배송중' }">
										<p class="delivery_status">배송중</p>
									</c:when>
									<c:when test="${alist.statusDetail == '대기중' }">
										<p class="delivery_status">대기중</p>
									</c:when>
									<c:when test="${alist.statusDetail == '배송완료' }">
										<p class="delivery_status">배송완료</p>
									</c:when>
									<c:when test="${alist.statusDetail == '취소완료' }">
										<p class="delivery_status">취소완료</p>
									</c:when>
									<c:when test="${alist.statusDetail == '반품준비중' }">
										<p class="delivery_status">반품준비중</p>
									</c:when>
									<c:when test="${alist.statusDetail == '교환완료' }">
										<p class="delivery_status">교환완료</p>
									</c:when>
								</c:choose>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</form>
		<jsp:include page="../common/footer.jsp"></jsp:include>	
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/orderHistory.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/purchase_menu.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/calander.js"></script>
		<script>
		tab.eq(0).click(function() {
			purchase_index.val("0");
			$(location).attr("href", "${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying&value="+purchase_index.val());
		});
		
		tab.eq(1).click(function() {
			purchase_index.val("1");
			$(location).attr("href", "${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying&value="+purchase_index.val());
		});

		tab.eq(2).click(function() {
			purchase_index.val("2");
			$(location).attr("href", "${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying&value="+purchase_index.val());
		});
		
		purchaseItemIng.on("click",function(){
			var filter = $(this).find('span').text();
			$(location).attr("href","${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying&value="+purchase_index.val()+"&filter="+filter);
		});
		
		purchaseItemEnd.on("click",function(){
			var filter = $(this).find('span').text();
			$(location).attr("href","${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying&value="+purchase_index.val()+"&filter="+filter);
		});
		
		price_filter.click(function(){
			if(price_filter_index.val()=="up"){
				price_filter_index.val("down");
			}
			else{
				price_filter_index.val("up");
			}
				
			$(location).attr("href","${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying&value="+purchase_index.val()+"&price="+price_filter_index.val());
		});
		
		btn_search.click(function(){
			var fm = document.frm;
			fm.method = "POST";
			fm.action="${pageContext.request.contextPath}/myPage/orderHistory.do?index=buying";
			fm.submit();
		});
		
		function showHistory(orderNo){
			$(".history_wrap").show();
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/myPage/historyShow.do",
				data:{
						"orderNo": orderNo},
				cache:false,
				success: function(data){
					$(".popup_contents").html(data);
				},
				error : function(request,status,error){
					alert("1다시 시도하시기 바랍니다.");	
					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
				}	
				
			});
		}
		
		</script>
	</body>
</html>