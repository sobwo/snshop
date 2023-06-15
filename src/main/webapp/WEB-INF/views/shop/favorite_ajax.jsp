<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/popup/popup.css" rel="stylesheet"/>
	<link href="${pageContext.request.contextPath}/resources/css/popup/favorite_popup.css" rel="stylesheet"/>
</head>
<body>
	<!-- 팝업창 -->
		<div class="popup shopMain_popup">
			<div class="popup_head">
				<h2 class="popup_name">관심 상품 추가</h2>
				<div class="popup_cancel">X</div>
			</div>
			<div class="popup_contents">
				<div class="suggest_wrap">
					<div class="suggest_thumb_area">
							<c:set var="exp" value= "${gv.productImg.substring(gv.getProductImg().length()-3, gv.getProductImg().length())}" />
							<c:set var="imgList" value="${fn:split(gv.productImg, ',')}" />
							<c:choose>
								<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
									<c:forEach var="img" items="${imgList}">
										<img class="suggest_thumb" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
									</c:forEach>
								</c:when>
								<c:otherwise>
									<img class="suggest_thumb" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
								</c:otherwise>
							</c:choose>
					</div>
					<div class="suggest_info">
						<span class="model_title">${gv.goodsName}</span>
						<span class="model_info">${gv.goodsEng}</span>
					</div>
				</div>
				<ul class="status_item_list">
					<c:forEach var="sizeList" items="${sizeList}">
						<li class="status_item_fb">
							<input type="hidden" name="sizeNo" value="${sizeList.sizeNo}"/>
							<span class="item_size_fb" style="font-size:14px">${sizeList.sizeName}</span>
							<span class="item_price_fb">
								<c:choose>
									<c:when test="${sizeList.interestCheck == 1 && sizeList.memberNo == sessionScope.memberNo}">
										<img class="interestImg" src="${pageContext.request.contextPath}/resources/image/favorites2_on.png">
									</c:when>
									<c:otherwise>
										<img class="interestImg" src="${pageContext.request.contextPath}/resources/image/favorites2.png">
									</c:otherwise>
								</c:choose>
							</span>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(".popup_cancel").click(function(){
				$(".shopMain_popup_wrap").hide();
			});
			
			$(".status_item_fb").on("click",function(){
				var memberNo = "${sessionScope.memberNo}";
				var sizeNo = $(this).children("input[name=sizeNo]").val();
				var goodsNo = $("input[name=goodsNo]").val();
				var interestImg = $(this).find(".interestImg");
				
				if(memberNo == null || memberNo == ""){
					alert("로그인이 필요합니다.");
					$(location).attr("href","${pageContext.request.contextPath}/member/memberLogin.do");
				}
				else{
					$.ajax({
				        type: "POST",
				        url: "${pageContext.request.contextPath}/shop/interest_check.do",
				        dataType: "json",
				        data: {
							"goodsNo" : goodsNo,
							"sizeNo" : sizeNo
				        	},
				        cache: false,
				        success: function(data) {
				        	console.log(data);
				        	if(data.value >= 1){
				        		if(data.interestCheck == 1){
				        			interestImg.attr("src","${pageContext.request.contextPath}/resources/image/favorites2_on.png")
				        		}
				        		else{
				        			interestImg.attr("src","${pageContext.request.contextPath}/resources/image/favorites2.png")
				        		}
				        		
				        		if(data.interestGoodsCheck > 0)
				        			$("#"+goodsNo).siblings(".wish_btn").children(".wish_img").attr("src","${pageContext.request.contextPath}/resources/image/favorites2_on.png");
				        		else
				        			$("#"+goodsNo).siblings(".wish_btn").children(".wish_img").attr("src","${pageContext.request.contextPath}/resources/image/favorites2.png");
				        		
				        		$("#"+goodsNo).siblings(".interestNum").text(data.interestCnt);
				        	}
				        	
				        },
				        error: function() {
				        }
		
					});
				}
			});
		</script>
</body>
</html>