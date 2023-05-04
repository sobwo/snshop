<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<link href=" ${pageContext.request.contextPath}/resources/css/order/orderFinish.css" rel="stylesheet">
	 
</head>
	<body>
		<div id="top_inner">
			<div id="top_menu">
				<ul>
					<li><a>������</a></li>
					<li style='margin-left:24px'><a>���ɻ�ǰ</a></li>
					<li style='margin-left:24px'><a>�α���</a></li>
					<li><a>�α׾ƿ�</a></li>
				</ul>
			</div>
		</div>
		<div id="header_main">
			<div id="main_inner">
				<div id="logo">
					<h1 style='font-size:22px;'><a>�ΰ�</a></h1>
				</div>
			</div>
		</div>
		<div class="orderFinishContainer">
			<div class="orderFinishContent">
				<div class="orderFinishBox">
					<div class="orderFinisTitle">
						<h2>
							�ֹ� ������ <span class="accentTitle">�Ϸ�</span> �Ǿ����ϴ�.				
						</h2>
					</div>
					<div class="pay">
						<div class="payText">
							<p class="payTotal">���� �ݾ�</p>
						</div>	
						<div class="payNumber">
							<p class="payTotalNumber">��</p>
						</div>		
					</div>
					<div class="buyProduct">
						<img class="buyItem" src=""/>
						<div class="buyInfo">
							<strong class="modelNumber">123456789</strong>
							<p class="modelName">���� 1 ��Ʈ�� ���� OG ��ī��</p>
							<p class="modelSize">230</p>
						</div>				
					</div>
					<div class="orderFinishBtn">
						<input type="button" name="orderFinish" id="orderFinish" value="Ȯ ��" onclick="location.href='${pageContext.request.contextPath}/'">
					</div>	
				</div>
			</div>	
		</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	</body>
</html>