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
			
			<div class="feedContainer">
				<c:choose>
					<c:when test="${not empty blist}">
						<div class="feed_wrap">
						<c:forEach var="bv" items="${blist}" varStatus="status">
						
							<div class="feeds" >
								<div class="feedPost" id="feedPost${bv.boardNo}">
									<div class="feedPostImage" onclick="location.href='#'">
										<c:choose>
											<c:when test ="${bv.contentsImg==null}">
											</c:when>
											
											<c:otherwise>
											<c:set var="exp" value= "${bv.contentsImg.substring(bv.getContentsImg().length()-3, bv.getContentsImg().length())}" />
											<c:if test="${exp == 'jpg' || exp == 'gif' || exp == 'png' || exp == 'fif'}">
											<c:forEach var="img" items="${bv.contentsImg}">
												<img class="postImage" src="${pageContext.request.contextPath}/myPage/displayFile.do?contentsImg=${bv.contentsImg}">
											</c:forEach>											
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
											
											<a class="prev" >&#10094;</a>
											<a class="next" >&#10095;</a>
										</c:otherwise>
									</c:choose>
												
									<div class="feedPostUser">
										<img class="userProfileImage" src="${pageContext.request.contextPath}/resources/image/blank_profile.png" />
										<p class="userName">${mv.memberId}</p>
										<span class="likeBox">
											<button type="button" class="likeImage" value="${bv.boardNo}">
												<c:choose>
													<c:when test="${bv.like_check == 0}">
														<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
													</c:when>
													<c:when test="${bv.like_check eq 1}">
														<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart2.png/">
													</c:when>
													<c:otherwise>
														<img id="likeImageChange" src="${pageContext.request.contextPath}/resources/image/heart.png/">
													</c:otherwise>
												</c:choose>
											</button>
											<span class="likeCount">${bv.likeCnt}</span>
										</span>					
									</div>
									<div class="feedPostContent" onclick="location.href='#'">
										<p>${bv.contents}</p>
									</div>
								</div>
							</div>
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
			</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
		 $(".likeImage").click(function() {
				var boardNo = $(this).val();
				var clickImage = $(this).children("#likeImageChange");
				var likeCountChange = $(this).siblings(".likeCount");

		    $.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath}/myPage/like_check.do",
		        dataType: "json",
		        data: {
					"boardNo": boardNo,
		        	},
		        cache: false,
		        success: function(data) {	
		        	
					if (data.cnt == 1) {
						clickImage.attr("src", "${pageContext.request.contextPath}/resources/image/heart2.png/");
		          
		         	}else {
		         		clickImage.attr("src", "${pageContext.request.contextPath}/resources/image/heart.png/");
		          
		         	}
					
					likeCountChange.text(data.totalCnt);
					
		        },
		        error: function() {
		        }

		      });
		     

		      });		    
		 
		 
		 
		 
		 
		 
		 $(".prev").on("click", function (e) {
		      e.preventDefault();

		      // 이미지 현재의 위치
		      var imgOn = $(".feedPostImg").find(".on").index();
		      // 이미지 총 개수 
		      var imgLen = $(".feedPostImg .PostImage").length;
		      console.log(imgOn)
		      
		      // imgBox안의 img 중 imgOn 번째의 on 클래스 삭제 
		      $(".feedPostImg .PostImage").eq(imgOn).removeClass("on");
		      // imgBox안의 img 중 imgOn 번째 숨기기 
		      $(".feedPostImg .PostImage").eq(imgOn).css("opacity", 0);
		      
		      //  이전의 위치로 돌아가야함으로
		      imgOn = imgOn -1;

		      if( imgOn < 0 ){
		        // 돌아가 위치가 -1일 경우 
		        // 이미지의 마지막으로 돌아간다
		        $(".feedPostImg .PostImage").eq(imgLen -1).css("opacity", 1);
		        $(".feedPostImg .PostImage").eq(imgLen -1).addClass("on");
		      }else{
		        // 돌아갈 위치가 -1이 아닌 경우
		        $(".feedPostImg .PostImage").eq(imgOn).css("opacity", 1);
		        $(".feedPostImg .PostImage").eq(imgOn).addClass("on");
		      }


		    });

		    $(".next").on("click", function (e) {
		      e.preventDefault();
		      // 위에 동일 
		      var imgOn = $(".feedPostImg").find(".on").index();
		      var imgLen = $(".feedPostImg .PostImage").length;

		      // 위에 동일
		      $(".feedPostImg .PostImage").eq(imgOn).removeClass("on");
		      $(".feedPostImg .PostImage").eq(imgOn).css("opacity", 0);
		      
		      // 다음의 위치로 알아야 되기 때문에 
		      imgOn = imgOn + 1;
		      
		      if( imgOn === imgLen ){
		        // 다음의 위치가 총 개수보다 클 경우
		        // 처음의 위치로 돌아간다
		        $(".feedPostImg .PostImage").eq(0).css("opacity", 1);
		        $(".feedPostImg .PostImage").eq(0).addClass("on");
		      }else{
		        // 다음 위치가 있는 경우 
		        $(".feedPostImg .PostImage").eq(imgOn).css("opacity", 1);
		        $(".feedPostImg .PostImage").eq(imgOn).addClass("on");
		      }
		    });
		 
		 
		 
		 
		 
		 
		 
		 
		 
		</script>
	</body>
</html>