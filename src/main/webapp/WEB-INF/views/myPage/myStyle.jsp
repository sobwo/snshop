<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="shortcut icon" href="data:image/x-icon" type="image/x-icon">
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_PitemCommon.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_main.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myStyle.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		
		<div class="myStyleContainer">
			<div class="userProfileTop">
				<div>
					<img class="userProfileImageTop" src="${pageContext.request.contextPath}/resources/image/blank_profile.png">
					<span class="userNameTop">${mv.memberName}</span>
					<span class="userIdTop">${mv.memberId}</span>
				</div>
			</div>
			<div class="socialTab">
				<ul class="socialList">
					<li class="socialItem">
						<a class="menuLink" href="#">
							<span class="socialMenu">게시물</span>
							<span class="socialMenuCnt">0</span>
						</a>
					</li>
					<li class="socialItem">
						<a class="menuLink" href="#">
							<span class="socialMenu">팔로워</span>
							<span class="socialMenuCnt">0</span>
						</a>
					</li>
					<li class="socialItem">
						<a class="menuLink" href="#">
							<span class="socialMenu">팔로잉</span>
							<span class="socialMenuCnt">0</span>
						</a>
					</li>
					
					<li>
						<a href="${pageContext.request.contextPath}/myPage/myStyle_upload.do">+</a>
					</li>
				</ul>
			</div>
			<c:choose>
				<c:when test="${not empty blist}">
					<div class="feedContainer">
						<c:forEach var="bv" items="${blist}" varStatus="status">
						<c:if test="${status.count % 4 == 1}">
			                <div class="feedRow">
			            </c:if>
							<div class="feeds" >
								<div class="feedPost" id="feedPost${bv.boardNo}">
									<div class="feedPostImage" onclick="location.href='#'">
										<c:choose>
											<c:when test ="${bv.contentsImg==null}">
											</c:when>
											
											<c:otherwise>											
											<c:set var="exp" value= "${bv.contentsImg.substring(bv.getContentsImg().length()-3, bv.getContentsImg().length())}" />
											
											<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
												<img class="postImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${bv.contentsImg}">
											</c:if>
											</c:otherwise>
										</c:choose>	
									</div>	
									<c:choose>
										<c:when test="${bv.viewCnt == 1}">
											<div class="imageCnt" style="display:none"></div>
										</c:when>
										<c:otherwise>
											<div class="imageCnt" onclick="location.href='#'">
												<span class="imageCount">+${bv.viewCnt-1}</span>
											</div>
										</c:otherwise>
									</c:choose>
									<div class="feedPostUser">
										<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" />
										<p class="userName">${mv.memberId}</p>
										
									<c:choose>
									
										<c:when test="${not empty sessionScope.memberNo}">  <!-- 로그인 상태일 때 하트 클릭 가능 -->
											<span class="likeBox">
												<button type="button" class="likeImage" value="${bv.boardNo}"><img src="${pageContext.request.contextPath}/resources/image/heart${lv.like_check}.png/"></button>
						 						<input type="hidden" id="like_check${bv.boardNo}" value="${lv.like_check}">	
												<span class="likeCount">${lv.like_check}</span>
											</span>
									 	</c:when>
										
										<c:otherwise>
											<span class="likeBox">  <!-- 버튼 클릭 시 로그인 페이지로  -->
												<button type="button" class="likeImageLogin" value="${bv.boardNo}"><img src="${pageContext.request.contextPath}/resources/image/heart.png/"></button>	
												<span class="likeCount">${bv.likeCnt}</span>
											</span>
										</c:otherwise>
										
									</c:choose>					
									</div>
									<div class="feedPostContent" onclick="location.href='#'">
										<p>${bv.contents}</p>
									</div>
								</div>
							</div>
						<c:if test="${status.count % 4 == 0}">
		              		</div>
		           		</c:if>	
						</c:forEach>
					</div>
				</c:when>
				<c:otherwise>
				<div class="feedEmpty">
					<div>
						<img class="feedEmptyImage" src="${pageContext.request.contextPath}/resources/image/camera.png">
						<strong class="EmptyTxt">게시물 없음</strong>
						<p class="EmptySubTxt">사진을 공유하면 내 프로필에 표시됩니다.</p>
					</div>
					<input type="button" class="feedFirstShare" value="첫 사진 공유" onclick="location.href='${pageContext.request.contextPath}/myPage/myStyle_upload.do'">
				</div>
				</c:otherwise>	
			</c:choose>		
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
		$(document).ready(function() {
			
			  $(".likeImage").click(function() {
					var clickImage = $(this);
					var boardNo = $(this).val();
					var memberNo = <%= session.getAttribute("memberNo") %>;
					var value = $("#like_check"+boardNo).val();
					
					value = value === "0" ? 1 : 0;

			    $.ajax({
			        type: "POST",
			        url: "${pageContext.request.contextPath}/myPage/like_check.do",
			        dataType: "json",
			        data: {
						"boardNo": boardNo,
						"like_check": value,
			    	    "memberNo": memberNo
			        	},
			        cache: false,
			        success: function(data) {	
			        	console.log(data);
			        	
						if (data.like_check == 1) {
			            	clickImage.attr("src", "${pageContext.request.contextPath}/resources/image/heart2.png/");
			          
			         	}else {
			         		clickImage.attr("src", "${pageContext.request.contextPath}/resources/image/heart.png/");
			          
			         	}
			          
			          alert("좋아요");
			        },
			        error: function() {
			          alert("실패");
			        }
			      });
			    });
			  });
		</script>
	</body>
</html>