<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="page-enter" content="blendTrans(duration=0.3)">
<meta http-equiv="page-exit" content="blendTrans(duration=0.3)">
</head>
	<style>
	.detail{
	width:700px;

	background-color:white;
	padding-top: 100px;
	margin-left: 600px;
	}
	.area{

	padding: 17px 0 19px;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #ebebeb;
    cursor: pointer;
    background-color:white;
    margin-left:25px;
	}
	.menu_wrap{
	margin-left:950px;
	width:50px;
	height:30px;
	color:black;
	}
	.area2{
	
	padding: 30px 30px 28px;
	}
	.btn1{
    display: inline-block;
    height: 30px;
    width: 58px;
    background: #fff;
    border: 1px solid #d3d3d3;
    border-radius: 10px;
    padding: 0 14px;
    margin-top: 12px;
    cursor: pointer;
    margin-left: -75px;
	}
	.btn2{
    display: inline-block;
    height: 30px;
    width: 58px;
    background: #fff;
    border: 1px solid #d3d3d3;
    border-radius: 10px;
    padding: 0 14px;
    margin-top: 12px;
    cursor: pointer;
	
	
	}
	
	.AWcontents{
	
  line-height: 50px;

	
	}
	</style>
		<body>
			<div id="header_wrap" style='height:94px;border:0'>	
		 		<jsp:include page="../common/header_common.jsp"></jsp:include> 
			</div>	
			
			
			<div class= "detail">
				<div class="area">
					<h3>${awv.AWtitle} </h3>
					<hr>
					<p>${awv.AWwriteday} </p>
				</div>
				<hr>
				<div class="area2">
					<p class="AWcontents"> ${awv.AWcontents}</p>
					
					<%-- <p> ${awv.categorytitle}</p> --%>
					<input type="hidden" name="awBoardNo" value="${awv.AWboardNo}" />
				</div>
			</div>
			<div class="menu_wrap">
				<button class="btn1" onclick="location.href='${pageContext.request.contextPath}/customerCenter/customerCenterMain.do'">목록 </button>
				<c:set var="role" value = "${sessionScope.role}" />
					<c:if test="${role eq 'admin'}">
			  			<button class="btn2"onclick="confirmDelete(${awv.AWboardNo})">삭제 </button>
		  			</c:if>
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
	