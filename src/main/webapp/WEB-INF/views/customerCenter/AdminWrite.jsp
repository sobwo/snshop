<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시판 글쓰기</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/customerCenter/adminWrite.css" rel="stylesheet"/> --%>
				 <style>
				    body {
				      font-family: Arial, sans-serif;
				    }
				    .container {
				     width: 500px;
				     margin-left:720px;
				     padding-top:140px;
				    }
				    .form-group {
				      margin-bottom: 20px;
				    }
				    .form-group label {
				      display: block;
				      font-weight: bold;
				      margin-bottom: 5px;
				    }
				    .form-group input[type="text"],
				    .form-group textarea {
				      width: 100%;
				      padding: 10px;
				      border: 1px solid #ccc;
				      border-radius: 4px;
				    }
				    .form-group textarea {
				      height: 500px;
				    }

				    .form-group button {
  
					display: inline-block;
					height: 36px;
					background: #fff;
					border: 1px solid #d3d3d3;
					border-radius: 10px;
					padding: 0 14px;
					margin-top: 12px;
					cursor: pointer;
					margin-left:210px;			       
				       }
				       
				    .menu_wrap{
				      margin-left:715px;
				    }
				    .button-link{
				    display: inline-block;
				    height: 36px;
				    background: #fff;
				    border: 1px solid #d3d3d3;
				    border-radius: 10px;
				    padding: 0 14px;
				    margin-top: 12px;
				    cursor: pointer;
				    margin-left: 900px;
				    margin-top:-10px;
				    }
				    h2 {
					  margin-bottom: 20px;
					  text-align: center;
					}
					.left{
					background-color:black;
					width:100px;
					height:100px;
					}

					    
			  </style> 
				</head>	
					<body>
						<div id="header_wrap" style='height:94px;border:0'>
						 	<jsp:include page="../common/header_common.jsp"></jsp:include> 
						</div>
						
					  		<div class="container">
					  	
						
							
							  <h2>공지사항 작성</h2>
							  <form id="writeForm" action="${pageContext.request.contextPath}/AdminWrite/AdminWriteAction.do" method="post">
							    <div class="form-group">
							      <label for="title"><b>제목</b></label>
							      <input type="text" id="AWtitle" name="AWtitle" required>
							    </div>
							    
						       	<div class="form-group">
							      <label for="category"><b>카테고리</b></label>
							      <input type="text" id="categorytitle" name="categorytitle" required>
							    </div>
							    
							    <div class="form-group">
							      <label for="content"><b>내용</b></label>
							      <textarea id="AWcontent" name="AWcontent" required></textarea>
							    </div>
							    
							    <div class="form-group">
							      <button type="submit" onclick="submitForm()">작성하기</button>
							    </div>
							  </form>
							  
							</div>
							<div class="menu_wrap3">
								
								<button onclick="window.location.href='${pageContext.request.contextPath}/customerCenter/customerCenterMain.do'" class="button-link">고객 센터 바로가기</button>
								
							</div>
						<script>
						function submitForm() {
							  var title = document.getElementById("AWtitle").value;
							  var category = document.getElementById("categorytitle").value;
							  var content = document.getElementById("AWcontent").value;

							  if (title === "") {
							    alert("제목을 입력해주세요!");
							    return false;
							  }
							  if (category === "") {
								    alert("타이틀을 입력해주세요!");
							    return false;
							  }
							  if (content === "") {
							    alert("내용을 입력해주세요!");
							    return false;
							  }
							  document.getElementById("writeForm").submit();
							}

						</script>
					    <jsp:include page="../common/footer.jsp"></jsp:include>
					</body>
				</html>