<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
			.popup{
				width:448px;
				background:#fff;
				border-radius:16px;
				box-shadow: 0 4px 10px 0 rgba(0,0,0,.1);
				padding:15px;
			}
			.close{
				all:unset;
			    width: 24px;
			    height: 24px;
			    font-size: 24px;
			    position: absolute;
			    top: 10px;
			    right: 10px;
			    cursor: pointer;
			}
			.goodsArea{
				display : flex;
				justify-content: center;
				margin-bottom: 10px;
				border-bottom: 1px solid #e4e4e4;
			}
			.goodsArea>div{
				margin-bottom: 10px;
			}
			.sizeArea{
				display: grid;
				grid-template-columns: repeat(2,1fr);
				row-gap: 10px;
				padding: 10px;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<!-- 팝업창 -->
		<div class="popup_wrap">
			<div class="popup">
				<div class="close">X</div>
				<div class="goodsArea">
					<div>${gv.goodsName}</div>
				</div>
				<div class="sizeArea">
					<div>사이즈</div>
					<div>재고량</div>
					<c:forEach var="sl" items="${asList}">
						<div>${sl.sizeName}</div>
						<div>${sl.quantity}</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</body>
</html>