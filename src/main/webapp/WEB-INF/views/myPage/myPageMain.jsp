<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_PitemCommon.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_main.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
				
					<!-- 유저 프로필 정보 -->
					<div class="user_memberShip">
						<div class="user_detail">
							<div class="user_thumb">
								<img class="profileImage">
							</div>
							<div class="user_info">
								<strong class="user_name">${mv.memberName}</strong>
								<c:choose>
									<c:when test="${mv.social == 'other'}">
										<p class="user_id">${mv.memberId}</p>
									</c:when>
									<c:when test="${mv.social == 'social'}">
										<p class="user_id">${mv.memberEmail}</p>
									</c:when>
								</c:choose>
								<input type="button" class="myPageBtn" value="프로필 수정" onclick="location.href='${pageContext.request.contextPath}/myPage/profileInfo.do'">
								<input type="button" class="myPageBtn" value="내 스타일" onclick="location.href='${pageContext.request.contextPath}/myPage/myStyle.do'">
							</div>
						</div>
						<div class="memberShip_detail">
							<div class="memberShip_item" style="border-right:1px solid #ebebeb">
								<strong class="info">일반 회원</strong>
								<p class="title">회원 등급</p>
							</div>
							<div class="memberShip_item">
								<a>
									<c:choose>
										<c:when test="${empty mpv}">
											<strong class="info">0P</strong>
										</c:when>
										<c:otherwise>
											<strong class="info">${mpv.avaPoint}P</strong>
										</c:otherwise>
									</c:choose>
									<span class="title">포인트</span>
								</a>
							</div>
						</div>
					</div>
					
					<!-- 구매내역 -->
					<div class="myHome_title_wrap">
						<h3 class="myHomeTitle">구매 내역</h3>
						<a href='${pageContext.request.contextPath}/myPage/purchase.do'><span>더보기 &rarr;</span></a>
					</div>
					
					<!-- 구매내역 메뉴 -->
					<div class="recent_purchase">
						<div class="purchase_list_wrap">
							<div class="purchase_item">
								<a>
									<span class="purchase_title">전체</span>
									<span class="purchase_cnt_1">${purchaseCntAll}</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">진행중</span>
									<span class="purchase_cnt">${purchaseCntIng}</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">종료</span>
									<span class="purchase_cnt">${purchaseCntEnd}</span>
								</a>
							</div>
						</div>
						
						<!-- 구매내역 리스트 -->
						<div class="purchase_contents_wrap">
							<c:forEach var="purchase" items="${ov_purchase}" begin="0" end="3" step="1">
								<div class="purchase_contents">
									<div class="purchase_detail">
										<div class="purchase_thumb">
											<!-- 이미지 파일 -->
											<c:set var="exp" value= "${purchase.productImg.substring(purchase.getProductImg().length()-3, purchase.getProductImg().length())}" />
											<c:set var="imgList" value="${fn:split(purchase.productImg, ',')}" />
											<c:choose>
												<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
													<c:forEach var="img" items="${imgList}">
														<img class="pro_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
													</c:forEach>
												</c:when>
												<c:otherwise>
													<img class="pro_img" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="purchase_info">
											<strong class="purchase_name">${purchase.goodsName}</strong>
										 	<p class="purchase_size">${purchase.size}</p> 
										</div>
									</div>
									<div class="delivery_info">
										<p class="delivery_status">${purchase.statusDetail}</p>
									</div>
								</div>
							</c:forEach>
							<c:if test="${purchaseCntAll > 4}">
								<div class="dotImage_wrap">
									<img class="dotImage" src="${pageContext.request.contextPath}/resources/image/dot.png"/>
								</div>
							</c:if>
						</div>
					</div>
					
					<!-- 판매내역 -->
					<div class="myHome_title_wrap">
						<h3 class="myHomeTitle">판매 내역</h3>
						<a href='${pageContext.request.contextPath}/myPage/sale.do'><span>더보기 &rarr;</span></a>
					</div>
					
					<!-- 판매내역 메뉴 -->
					<div class="recent_purchase">
						<div class="purchase_list_wrap">
							<div class="purchase_item">
								<a>
									<span class="purchase_title">전체</span>
									<span class="purchase_cnt_1">${saleCntAll}</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">진행중</span>
									<span class="purchase_cnt">${saleCntIng}</span>
								</a>
							</div>
							<div class="purchase_item">
								<a>
									<span class="purchase_title">종료</span>
									<span class="purchase_cnt">${saleCntEnd}</span>
								</a>
							</div>
						</div>
						
						<!-- 판매내역 리스트 -->
						<div class="purchase_contents_wrap">
							<c:forEach var="sale" items="${ov_sale}" begin="0" end="3" step="1">
								<div class="purchase_contents">
									<div class="purchase_detail">
										<div class="purchase_thumb">
											<div class="purchase_thumb">
											<!-- 이미지 파일 -->
											<c:set var="exp" value= "${sale.productImg.substring(sale.getProductImg().length()-3, sale.getProductImg().length())}" />
											<c:set var="imgList" value="${fn:split(sale.productImg, ',')}" />
											<c:choose>
												<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
													<c:forEach var="img" items="${imgList}">
														<img class="pro_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
													</c:forEach>
												</c:when>
												<c:otherwise>
													<img class="pro_img" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
												</c:otherwise>
											</c:choose>
										</div>
										</div>
										<div class="purchase_info">
											<strong class="purchase_name">${sale.goodsName}</strong>
											<p class="purchase_size">${sale.size}</p>
										</div>
									</div>
									<div class="delivery_info">
										<p class="delivery_status">${sale.statusDetail}</p>
									</div>
								</div>
							</c:forEach>
							<c:if test="${saleCntAll > 4}">
								<div class="dotImage_wrap">
									<img class="dotImage" src="${pageContext.request.contextPath}/resources/image/dot.png"/>
								</div>
							</c:if>
						</div>
					</div>
					
					<!-- 관심상품 -->
					<div class="myHome_title_wrap">
						<h3 class="myHomeTitle">관심 상품</h3>
						<a href='${pageContext.request.contextPath}/myPage/interest.do'><span>더보기 &rarr;</span></a>
					</div>
					
					<!-- 관심상품 리스트 -->
					<div class="recent_purchase" style="display:flex;">
						<c:choose>
							<c:when test="${empty glist}">
								<span style="width:100%;height:100%;text-align:center;padding-top:100px">등록된 관심상품이 없습니다.</span>
							</c:when>
							<c:otherwise>
								<c:forEach var="glist" items="${glist}">
									<input type="hidden" name="goodsNo" value="${glist.goodsNo}">
									<div class="product_item" onclick="location.href='${pageContext.request.contextPath}/shop/shopContents.do?goodsNo=${glist.goodsNo}'">
										<div class="item_thumb">
											<!-- 이미지 파일 -->
											<c:set var="exp" value= "${glist.productImg.substring(glist.getProductImg().length()-3, glist.getProductImg().length())}" />
											<c:set var="imgList" value="${fn:split(glist.productImg, ',')}" />
											<c:choose>
												<c:when test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
													<c:forEach var="img" items="${imgList}">
														<img class="pro_img" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${img}&index=product">
													</c:forEach>
												</c:when>
												<c:otherwise>
													<img class="pro_img" src="${pageContext.request.contextPath}/resources/image/blank_product.png">
												</c:otherwise>
											</c:choose>
										</div>
										<div class="item_info">
											<div class="item_name">${glist.goodsName}</div>
											<div class="item_contents">${glist.categoryName} ${glist.goodsBrandName} ${glist.goodsEng}</div>
											<div class="item_price">${glist.price} 원</div>
											<div class="item_size">${glist.sizeName} size</div>
										</div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
				<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).ready(function(){
				showImg();
			});
			
			function showImg(){
				var src;
				$.ajax({
					url: "${pageContext.request.contextPath}/image/profileImgShow.do",		
					method: "GET",
					  xhrFields: {
					    responseType: "blob" // 이미지를 바이너리 형태로 받기 위해 responseType을 설정합니다.
					},
					success : function(data){
						console.log(data);
						if(data.size==0){
							src = "${pageContext.request.contextPath}/resources/image/blank_profile.png";
						}
						else{
							src = URL.createObjectURL(data);
							
						}
						$(".profileImage").attr("src",src);
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});	
			}
		</script>
	</body>
</html>