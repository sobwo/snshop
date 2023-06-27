<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		 <link href="${pageContext.request.contextPath}/resources/css/customerCenter/AdminDetail.css" rel="stylesheet"/> 
</head>
		<body>
			<div id="header_wrap" style='height:94px;border:0'>	
		 		<jsp:include page="../common/header_common.jsp"></jsp:include> 
			</div>	
			<div class= "detail">
				<div class="area">
					<h3>${awv.AWtitle} </h3>
					
					<hr>
					<p class="p1">${awv.AWwriteday} </p>
				</div>
				<hr>
				<div class="area2">
					<p class="AWcontents"> ${awv.AWcontents}</p>
					
					<%-- <p> ${awv.categorytitle}</p> --%>
					<input type="hidden" name="awBoardNo" value="${awv.AWboardNo}" />
				</div>
			</div>
			<div class="menu_wrap">
				<div class="btns">

					<button class="btn1" onclick="location.href='${pageContext.request.contextPath}/customerCenter/customerCenterMain.do'">공지사항 </button>
					<button class="btn1-1" onclick="location.href='${pageContext.request.contextPath}/customerCenter/customerCenterQuestion_all.do'">자주 묻는 질문  </button>
					<c:set var="role" value = "${sessionScope.role}" />
						<c:if test="${role eq 'admin'}">
				  			<button class="btn2"onclick="confirmDelete(${awv.AWboardNo})">삭제 </button>
			  			</c:if>
	  			</div>
			</div>
		  		  <jsp:include page="../common/footer.jsp"></jsp:include>
	    		<script>
					function confirmDelete(boardNo) {
					  if (confirm("정말로 삭제하시겠습니까?")) {
					    var url = '${pageContext.request.contextPath}/AdminWrite/AdminWriteDelete.do?AWboardNo=' + boardNo;
					    location.href = url;
					  }
					}
			</script>
		</body>
	</html> 
	