<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시판 글쓰기</title>
				 <style>
				    body {
				      font-family: Arial, sans-serif;
				    }
				    .container {
				      width: 500px;
				      margin: 0 auto;
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
				      height: 150px;
				    }
				    .form-group button {
				      padding: 10px 20px;
				      background-color: #007bff;
				      color: #fff;
				      border: none;
				      border-radius: 4px;
				      cursor: pointer;
				    }
			  </style>
				</head>
					<body>
					  <div class="container">
					    <h2>공지사항 작성</h2>
					    <form action="process.php" method="post">
					      <div class="form-group">
					        <label for="title">제목</label>
					        <input type="text" id="title" name="title" required>
					      </div>
					      <div class="form-group">
					        <label for="content">내용</label>
					        <textarea id="content" name="content" required></textarea>
					      </div>
					      <div class="form-group">
					        <button type="submit">작성하기</button>
					      </div>
					    </form>
					  </div>
					</body>
				</html>