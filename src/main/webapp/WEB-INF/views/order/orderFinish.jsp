<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
		<link href=" ${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
		<style> 
			.orderFinishContainer{
				width:1902px;
				height:881px;
				background-color: #fafafa;
			}
			.orderFinishContent{
				width:700px;
				height:701px;
				margin: 0 auto;
			    padding: 20px 40px 160px;
			    max-width: 780px;
			}
			.orderFinishBox{
				width:700px;
				height:601px;
				background-color: #fff;
			}
			.orderFinisTitle{
				display: flex;
			    -webkit-box-align: center;
			    align-items: center;
			    line-height: 38px;
			    padding: 32px 32px 40px;
			    font-size: 25px;
			    letter-spacing: -.48px;
			    font-weight: 700;
			}
			.accentTitle{
				color: #f15746;
			}
			.pay{
				display: flex;
				align-items: center;
				width: 636px;
				height: 120px;
				padding: 0 32px 18px;
				justify-content:space-between;
			}
			.payText{
				display: flex;
			    -webkit-box-align: center;
			    align-items: center;
			    line-height: 38px;
			    padding: 32px 32px 40px;
			    font-size: 25px;
			    letter-spacing: -.48px;
			    font-weight: 700;
			}
			.payTotal{}
			.payNumber{
				display: flex;
			    -webkit-box-align: center;
			    align-items: center;
			    line-height: 38px;
			    padding: 32px 32px 40px;
			    font-size: 25px;
			    letter-spacing: -.48px;
			    font-weight: 700;
			}
			.payTotalNumber{}
			
			.buyProduct{
				display: flex;
				align-items: center;
				width: 636px;
				height: 200px;
				padding: 0 32px 18px;
			}
			.buyItem{
				width: 80px;
				height: 80px;
				object-fit: cover;
			    image-rendering: auto;
			}
			.buyInfo{
				width: 540px;
				height: 80px;
				padding-left: 16px;
				text-align: left;
			}
			.modelNumber{}
			.modelName{}
			.modelSize{}
			.buyCheckBox{
				width:700px;
				height:493px;
			}
			.orderFinishBtn{
				width:636px;
				height:52px;
				padding:32px 32px;
			}
			#orderFinish{
				width:636px;
				height:52px;
				background-color: #222;
				color: #fff;
			    vertical-align: middle;
			    text-align: center;
			    font-weight: 700;
			    font-size:20px;
			    border-radius: 8px;
			    border:none;
			}
			
		</style>   
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
						<input type="button" name="orderFinish" id="orderFinish" value="Ȯ ��" onclick="">
						<label for="buyContinue"></label>
				</div>	
			</div>
		</div>	
	<jsp:include page="../common/footer.jsp"></jsp:include>	
	</body>
</html>