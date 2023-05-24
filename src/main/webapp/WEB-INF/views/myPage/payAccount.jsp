<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>결제정보</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_payAccount.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(3) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
					<div class="content_title content_title_on content_title_account">
						
						<!-- 결제정보 헤더 -->
						<div>
							<h3>결제 정보</h3>
							<span style="display:block;font-size:12px;color:rgba(34,34,34,.5);">수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고지 없이 해당 금액을 결제 시도할 수 있습니다.</span>
						</div>
						<input type="button" class="plus_account" value="+ 새 카드 추가하기" onclick="vPay()">
					</div>
					
					<!-- 결제정보 리스트 -->
					<div class="payAccount_info_wrap">
						<div class="payAccount_info empty_payAccount_info">추가하신 결제 정보가 없습니다.</div>
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<%-- 	    <script src="${pageContext.request.contextPath}/resources/js/myPage/payAccount.js"></script> --%>
		<script>
			function kakaoPay() {
		        // getter
		        IMP.init('imp23228257');
	
		        IMP.request_pay({
		            pg: 'kakaopay.TC0ONETIME',
		            merchant_uid: 'merchant_' + new Date().getTime(),
		            name: 'test1 : test1',
		            amount: '10000',
		            buyer_email: 'so_bw74@naver.com',
		            buyer_name: 'test1',
		            buyer_tel: '0101',
		            buyer_addr: '전주',
		            buyer_postcode: '123-456'
		        }, function (rsp) {
		            console.log(rsp);
		            if (rsp.success) {
		                var msg = '결제가 완료되었습니다.';
// 		                msg += '고유ID : ' + rsp.imp_uid;
// 		                msg += '상점 거래ID : ' + rsp.merchant_uid;
// 		                msg += '결제 금액 : ' + rsp.paid_amount;
// 		                msg += '카드 승인번호 : ' + rsp.apply_num;
// 		                $.ajax({
// 		                    type: "GET", 
// 		                    url: "/user/mypage/charge/point", //충전 금액값을 보낼 url 설정
// 		                    data: {
// 		                        "amount" : money
// 		                    },
// 		                });
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
		            alert(msg);
		            document.location.href="${pageContext.request.contextPath}/myPage/payAccount.do"; //alert창 확인 후 이동할 url 설정
		        });
		    }
			
			function nicePay(){
		        IMP.init('imp23228257');
		    	
		        IMP.request_pay({
		            pg: 'nice.nictest04m',
		            pay_method: 'card',
		            merchant_uid: 'merchant_' + new Date().getTime(),
		            name: 'test1',
		            amount: '10000',
		            buyer_email: 'so_bw74@naver.com',
		            buyer_name: 'test1',
		            buyer_tel: '0101',
		            buyer_addr: '전주',
		            buyer_postcode: '123-456'
		        }, function (rsp) {
		            console.log(rsp);
		            if (rsp.success) {
		                var msg = '결제가 완료되었습니다.';
		                $.ajax({
		                    type: "POST", 
		                    url: "${pageContext.request.contextPath}/order/payAction.do", //충전 금액값을 보낼 url 설정
		                    data: {  
		                        "merchant_uid" : rsp.merchant_uid,
		                        "price" : rsp.amount,
		                    },
		                    success : function(data){
								alert("성공");
							},
							error : function(request,status,error){
								alert("다시 시도하시기 바랍니다.");	
								console.log("code: " + request.status);
						        console.log("message: " + request.responseText);
						        console.log("error: " + error);
							}	
		                });
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
		            alert(msg);
		        });
		    }
			
			function vPay(){
				var today = new Date();   

				var year = today.getFullYear().toString(); // 년도
				var month = (today.getMonth() + 1).toString();  // 월
				var date = (today.getDate()+3).toString();  // 날짜
				
				var vday = year+month+date;
				alert(vday);
		        IMP.init('imp23228257');
		    	
		        IMP.request_pay({
		            pg: 'nice',
		            pay_method: 'vbank',
		            vbank_due: vday,
		            vbank_holder : '소병운',
		            vbank_num : '50108456179234',
		            merchant_uid: 'merchant_' + new Date().getTime(),
		            name: 'test1',
		            amount: '10000',
		            buyer_email: 'so_bw74@naver.com',
		            buyer_name: 'test1',
		            buyer_tel: '0101',
		            buyer_addr: '전주',
		            buyer_postcode: '123-456'
		        }, function (rsp) {
		            console.log(rsp);
		            if (rsp.success) {
		                var msg = '결제가 완료되었습니다.';	
		                $.ajax({
		                    type: "POST", 
		                    url: "${pageContext.request.contextPath}/order/payAction.do", //충전 금액값을 보낼 url 설정
		                    data: {  
		                        "merchant_uid" : rsp.merchant_uid,
		                        "vbank_code" : rsp.vbank_code,
		                        "price" : rsp.amount,
		                        "vbank_num" : rsp.vbank_num,
		                        "vbank_due" : rsp.vbank_due,
		                    },
		                    success : function(data){
								alert("성공");
							},
							error : function(request,status,error){
								alert("다시 시도하시기 바랍니다.");	
								console.log("code: " + request.status);
						        console.log("message: " + request.responseText);
						        console.log("error: " + error);
							}	
		                });
		            } else {
		                var msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		            }
		            alert(msg);
		        });
		    }
			
		</script>
	</body>
</html>