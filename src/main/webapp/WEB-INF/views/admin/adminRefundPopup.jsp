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
			
			.btn{
				height: 32px;
				border: 1px solid #ebebeb;
				background-color: white;
				border-radius: 5px;
				font-size: 13px;
				line-height: 30px;
			}
			.reason{
				margin : 10px 0;
			}
			.reason>div, .price>div{
				margin : 10px 0;
			}
		</style>
	</head>
	<body>
		<!-- 팝업창 -->
		<div class="popup_wrap">
			<div class="popup">
				<div class="close">X</div>
				<div class="goodsArea">
				</div>
				<form name="frm">
					<input type="hidden" name="orderNo" value ="${od.orderNo}" />
					<div class="refundArea">
						<div class="reason">
							<div>환불 이유</div>
							<input type="text" name="reason" value="${od.reason}">
						</div>
						<div class="price">
							<div>환불금액</div>
							<c:set var ="detail" value="${od.statusDetail}" />
							
							<c:if test="${detail eq '대기중'}" >
								<input type="text" name="totalPrice" value="0">	
							</c:if>
							
							<c:if test="${detail eq '입금완료'}" >
								<input type="text" name="totalPrice" value="${od.totalPrice}">	
							<div>
								<div>환불 은행</div>
								<input type="text" value="accountUserName" value="${rv.accountUserName}">
								<input type="text" name="accountName" value="${rv.accountName}">
								<input type="text" value="accountNum" value="${rv.accountNum}">
							</div>
							</c:if>
						</div>
						<div>
							<button class="btn" type = "button" onclick="submitRefund();">확인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript">
		function submitRefund(){
			var fm = document.frm;
			fm.action = "${pageContext.request.contextPath}/admin/adminRefundAction.do";
			fm.method = "post";
			fm.submit();
		}
		</script>
	</body>
</html>