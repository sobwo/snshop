<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>home</title>
<link
	href=" ${pageContext.request.contextPath}/resources/css/order/orderPage.css"
	rel="stylesheet">
	<style>
		.nav_list:nth-child(3) a {
			font-weight: bold;
		}
	
		#card{
			background-image:url("${pageContext.request.contextPath}/resources/image/card.png");
		}
		#kakaopay{
			background-image:url("${pageContext.request.contextPath}/resources/image/kakaopay.png");
		}
		#vBank{
			background-image:url("${pageContext.request.contextPath}/resources/image/bankBook.png");
		}
	</style>
</head>
<body>
	<c:set var="total" value="${total}" />
	<div>
		<jsp:include page="../common/header_style.jsp"></jsp:include>
		<div class="totalsize">
			<div class="content">
				<div class="buy_immediate">
					<div class="product_info_area" style="background-color: #fff;">
						<div class="product_info">
							<div class="product">
								<img src="" style="width: 80px;height:80px;">
							</div>
							<div class="product_detail">

								<strong class="model_number"> ${gv.goodsEng} </strong>
								<p class="model_title"> ${gv.goodsName}</p>
								<p class="model_ko">${gv.modelNum}</p>
								<div class="model_desc">
									<p class="size_txt">${sizeName}</p>
								</div>
							</div>
						</div>
					</div>
					<section>
						<div class="section_unit">
							<div class="section_title">
								<h3 class="title_txt">배송주소</h3>
								<div class="address_popup">
									<button onclick="add_address_openPopup()"
										style="border: 1px solid white; cursor: pointer; background-color: white">+새
										주소 추가
									</button>
								</div>
							</div>
							<!--section_title-->
							<div id="address_popup">
								<h3 style="text-align: center;">
									<b>새 주소 추가</b>
								</h3>
								<form name="frm">
									<input type="hidden" name="goodsNo" value="${gv.goodsNo}">
									<p>
										<b>이름</b>
									</p>
									<input type="text" class="popup_style" id="basic_name"
										name="basicName"> <span class="basic_msg"
										id="name_msg" style="display: none">올바른 이름을
										입력해주세요.(2~10자)</span>
									<p>
										<b>휴대폰 번호</b>
									</p>
									<input type="tel" class="popup_style" placeholder="- 없이 입력"
										id="basic_phone" name="basicPhone"> <span
										class="basic_msg" id="phone_msg" style="display: none">정확한
										휴대폰 번호를 입력해주세요.</span>
									<p>
										<b>우편번호 검색</b>
									</p>
									<input type="text" class="popup_style" id="basic_AddrNum"
										name="basicAddrNum">
									<p>
										<b>주소</b>
									</p>

									<input type="text" class="popup_style" id="basic_Addr"
										placeholder=" 우편번호 검색 후, 자동 입력됩니다." name="basicAddr">
									<p>
										<b>상세주소</b>
									</p>
									<input type="text" class="popup_style" id="basic_AddrDetail"
										placeholder=" 건물,아파트,동/호수 입력" name="basicAddrDetail">
									<div class="basic_check">
										<input type="checkbox" class="basic_checkBtn" name="basic_check" value="Y">
										<span class="basic_checkTitle">
											기본 배송지로 설정
										</span>
									</div>
									<button onclick="add_address_closePopup()"
										class="popup_inner_btn2">닫기
									</button>
									<button class="addressSave" value="저장하기"
										onclick="submit_address()">저장
									</button>
								</form>
							</div>

							<div class="delivery_info">
								<div class="address_popup address_plus_wrap">
									<c:choose>
										<c:when test="${av.addressNo == null}">
											<div class="btn_2">
												주소를 추가해주세요.
											</div>
										</c:when>
										<c:otherwise>									
											<div class="address_Box">
												<div class="info_box">
													<dt class="title">받는분</dt>
													<dd class="desc">${av.userName}</dd>
												</div>
												<!--info_box-->
												<div class="info_box">
													<dt class="title">연락처</dt>
													<dd class="desc">${av.addressPhone}</dd>
												</div>
												<!--info_box-->
												<div class="info_box">
													<dt class="title">배송 주소</dt>
													<dd class="desc">${av.zipCode}&nbsp;&nbsp;${av.address}&nbsp;&nbsp;${av.detailAddress}</dd>
												</div>
												<!--info_box-->
											</div>
											<!--  -->
										</c:otherwise>
									</c:choose>
								</div>
							</div>						
							<div style="width: 636px; height: 48px;">
								<form name="info" class="info">
									<input type="hidden" name="price" value="${t_Total}">
									<input type="hidden" name="goodsNo" value="${gv.goodsNo}">
									<input type="hidden" name="addressNo" value="${av.addressNo}"/>
									
									<label for="my-select">
									 <select class="payInfo" name="payInfo" id="payInfo_value">
											<option value="요청 사항을 선택해주세요">요청 사항을 선택해주세요</option>
											<option value="문 앞에 놓아주세요">문 앞에 놓아주세요</option>
											<option value="경비실에 맡겨 주세요">경비실에 맡겨 주세요</option>
											<option value="파손 위험 상품입니다. 배송 시 주의해주세요">파손 위험 상품입니다. 배송 시 주의해주세요</option>
									</select>
									</label>
								</form>
							<!-- 	</form>	 -->
								<h3 class="title_txt1">배송방법</h3>
								<c:choose>
									<c:when test="${total <= 200000}">
										<button class="btnimg2">
											<img src="${pageContext.request.contextPath}/resources/image/parcel.png" alt="button image2" class="btnimg-img">
											<div style="display: flex; flex-direction: column;">
												<span style="display: block;" class="movespan2"><b>일반배송 3000원
												</b> </span> <span style="display: block;">검수 후 배송 * 5~7일 내 도착 예정</span>
											</div>
										</button>
									</c:when>
									<c:otherwise>
										<button class="btnimg">
											<img src="" alt="button image" class="btnimg-img">
											<div style="display: flex; flex-direction: column;">
												<span style="display: block;" class="movespan"><b>무료배송
												</b> </span> <span style="display: block;">검수 후 배송 * 5~7일 내 도착예정</span>
											</div>
										</button>
										<div
											style="display: flex; justify-content: space-between; align-items: center">
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</section>
					<div class="point_area">
						<div class="inner_point_area">
							<h3 class="title_txt">포인트</h3>
							<input type="number" class="point_view" id="result" placeholder="0(또는 직접입력)">							
							<button class="all_use"id="all_use">모두 사용</button>
							<button class="apply"id="apply" onclick="applyDirectInput()">적용</button>
							<button class="cancel" id="cancel">적용 취소</button>
							<p id="output"></p>
							<p class="have_point">
								보유포인트:
								<button onclick="openPopup()" class="Q">?</button>
								${Avapoint} P						
							</p>
							<!--포인트 - 팝업창-->
							<div class="point_popup">
								<div id="popup">

									<h3 style="text-align: center;">이용안내</h3>
									<p>사용 가능한 포인트</p>
									<p>
										<b>${totalPoint}P</b>
									</p>
									<hr>
									<!-- <p>이번달 소멸 예정 포인트 0P</p> -->
									<p style="font-size: 10px;">포인트 유효기간은 적립일로부터 최대 1년까지이며, 유형에
										따라 달라질 수 있습니다.</p>
									<hr>
									<p style="font-size: 10px;">
										1,000P 이상부터 구매금액 제한 없이 사용하실 수 있습니다.<br> 입찰 삭제, 거래 취소 시
										사용한 포인트는 환불됩니다.<br> 먼저 적립된 포인트부터 순서대로 사용되며, 사용하지 않으실 경우
										유효기간이 지나면 자동 소멸됩니다.<br> 유효기간이 지난 후 환불받은 포인트는 다시 사용하실 수
										없습니다.
									</p>
									<button onclick="closePopup()" class="popup_inner_btn">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!--end포인트 - 팝업창-->
					<div class="totalprice">
						<h3>
							<strong>최종 주문 정보</strong>
						</h3>
						<p>총 결제금액</p>
						<p style="color: red; text-align: right;">
  							<c:choose>
								<c:when test="${gv.price >= 200000}">
									<fmt:formatNumber value="${total}" pattern="#,##0" var="t_Total" />
									<c:set var="price" value="${total}"></c:set>
								</c:when>
								<c:otherwise>
									<fmt:formatNumber value="${total+3000}" pattern="#,##0" var="t_Total" />
									<c:set var="price" value="${total+3000}"></c:set>
								</c:otherwise>
							</c:choose>
						<c:out value="${t_Total}" /> 												
						</p>
						<hr>
						<!--가로로-->
						<div
							style="display: flex; justify-content: space-between; align-items: center;">
							<p>구매가</p>
							<p style="color: red; text-align: right;">
								<fmt:formatNumber type='number' maxFractionDigits='3'
									value='${gv.price}' />
							</p>
						</div>
						<div class="inner_totalprice"
							style="display: flex; justify-content: space-between; align-items: center;">
							<p>포인트</p>							
							<p id="inner_point" style="color: red; text-align: right;">${point}</p>
						</div>					
				 		<div 
							style="display: flex; justify-content: space-between; align-items: center;">
							<p>배송비</p>
							<p id="del2" style="color: red; text-align: right;">-</p>	 
						</div> 
						<hr>
					</div>
					
					<div class="payMethod">
						<h3 class="title_txt1 title_pay">결제 방법</h3>
						<div class="method_title">
							<div class="pay_box" id="card">신용카드
								<input type="hidden" class="method" value="off">
							</div>
							<div class="pay_box" id="kakaopay">카카오페이
								<input type="hidden" class="method" value="off">
							</div>
							<div class="pay_box" id="vBank">무통장입금
								<input type="hidden" class="method" value="off">
							</div>
						</div>
					</div>
					
					<div class="agree_wrap">
						<div class="agree">
							<p>
								<b>판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수<br>
									있습니다
								</b>
							</p>
							<p style="font-size: 15px">앱 알림해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는
								거래 진행 상태 알림을 받을 수 없습니다.</p>
							<br>
							 <input type="checkbox" class="agree-storage"
								id="checkbox1"> <label for="agree-storage">위 내용을
								모두 확인하였으며, 동의합니다.</label>					
							<hr>
							<p>
								<b>'결제하기'를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 <br>취소가
									불가능합니다
								</b>
							</p>
							<p style="font-size:15px">본 거래는 개인간 거래로 전자상거래법(제 17조)에 따른
								철약철회(환불,교환) 규정이 적용되지 <br> 않습니다.
							</p>
							<div class=agree-terms2>
								<input type="checkbox" class="agree-terms" id="checkbox3">
								<label for="agree-terms" ><b>위 내용을 모두 확인하였으며, 거래 진행에동의합니다.</b></label> <br>									
							</div>
							
							<div class="totalprice_area">
								<p style="font-size:20px;">총 결제금액</p>
								<p style="color: red;">
								<c:out value="${t_Total}" /> 
								
								</p>
							</div>
						</div>
									
 						<button class="payment-button" id="payment-button" disabled onclick="orderPay()">결제하기
						</button>					
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/order/orderPage.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script>
    
	    var total = ${total};
		var btnimg = document.querySelector('.btnimg');
		var btnimg2 = document.querySelector('.btnimg2');
		
		
		//pay관련 변수
		var goodsNo = "${gv.goodsNo}";
		var goodsName = "${gv.goodsName}";
		var name = "${av.userName}";
		var phone = "${av.addressPhone}";
		var price = "${price}";
		
		$(document).ready(function() {
			$("input[name=price]").val(price);
			
			var del2Element = $("#del2");
			
			if (total >= 200000) {
				del2Element.text("-");
			} else {
				del2Element.text("3,000");
			}
		}); 
		
		//포인트 전체 사용
 		$("#all_use").click(function() {
			var point = ${totalPoint};
			
			if(point<1000)
				alert("1000 포인트 이상부터 사용 가능합니다.");
			else{
				var goodsNo = ${gv.goodsNo};
				
				var sizeName = "${sizeName}";
				$(location).attr("href","${pageContext.request.contextPath}/order/orderPage.do?goodsNo="+goodsNo+"&point="+point+"&sizeName="+sizeName);
			}
		});
 		
		//포인트 취소
 		$(".cancel").click(function(){
 			var pointCost = 0;

			var goodsNo = ${gv.goodsNo};
			
			var sizeName = "${sizeName}";
			$(location).attr("href","${pageContext.request.contextPath}/order/orderPage.do?goodsNo="+goodsNo+"&point="+pointCost+"&sizeName="+sizeName);
 		});
		
		//포인트 입력창
		$(".point_view").on("propertychange change keyup paste input", function() {
			const maxPoint = parseInt('${Avapoint}');

			let inputValue = parseInt($(this).val());

			if (inputValue < 0) {
				$(this).val(0);
			} else if (inputValue > maxPoint) {
				$(this).val(maxPoint);
			}

		});
		
		//주소
		function submit_address() {
			var fm = document.frm;
			fm.action = "${pageContext.request.contextPath}/order/order_addressAction.do?sizeName="+${sizeName};
			fm.method = "POST";
			fm.submit();
		}
		
		function showAddress(index) {
			$.ajax({
				url : "${pageContext.request.contextPath}/order/order_showAddress.do",
				method : "GET",
				data : {"index" : index
				},
				dataType : "json",
				cache : false,
				success : function(data) {
					$("#basic_AddrNum").val(data.av.zipCode);
					$("#basic_Addr").val(data.av.address);
				},
				error : function(request, status, error) {
					alert("다시 시도하시기 바랍니다.");
					console.log("code: " + request.status);
					console.log("message: " + request.responseText);
					console.log("error: " + error);
				}
			});
		}
		

		function applyDirectInput() {
			var point = ${totalPoint};
			
			if(point<1000)
				alert("1000 포인트 이상부터 사용 가능합니다.");
			else{
				var result = document.getElementById("result").value;
				document.getElementById("inner_point").textContent = result;
				
				var goodsNo = ${gv.goodsNo};
				var sizeName = "${sizeName}";
				$(location).attr("href","${pageContext.request.contextPath}/order/orderPage.do?goodsNo="+goodsNo+"&point="+result+"&sizeName="+sizeName);
			}
		}

		
		function orderPay(){
			for(var i=0; i<$(".method").length; i++){
				if($(".method").eq(i).val() == "on"){
					if($(".method").eq(i).closest(".pay_box").attr("id") == "card")
						nicePay();
					else if($(".method").eq(i).closest(".pay_box").attr("id") == "kakaopay")
						kakaoPay();
					else
						vPay();
				}
			}
		}
		
		function kakaoPay() {
	        // getter
	        IMP.init('imp23228257');

	        IMP.request_pay({
	            pg: 'kakaopay.TC0ONETIME',
	            merchant_uid: goodsNo + new Date().getTime(),
	            name: goodsName,
	            amount: price,
	            buyer_name: name,
	            buyer_tel: phone
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	            	pay_ajax(rsp,price);	
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	            }
	            alert(msg);
	        
	        });
	    }
		
		function nicePay(){
	        IMP.init('imp23228257');
	    	
	        IMP.request_pay({
	            pg: 'nice.nictest00m',
	            pay_method: 'card',
	            merchant_uid: goodsNo + new Date().getTime(),
	            name: goodsName,
	            amount: price,
	            buyer_name: name,
	            buyer_tel: phone
	        }, function (rsp) {
	            console.log(rsp);
	            if (rsp.success) {
	            	pay_ajax(rsp,price);	
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
	        IMP.init('imp23228257');
	    	
	        IMP.request_pay({
	            pg: 'nice',
	            pay_method: 'vbank',
	            merchant_uid: goodsNo + new Date().getTime(),
	            name: goodsName,
	            amount: price,
	            buyer_name: name,
	            buyer_tel: phone
	        }, function (rsp) {
	            if (rsp.success) {
	            	pay_ajax(rsp,price);	
	            } else {
	                var msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	            }
// 	            alert(msg);
	        });
	    }
		
		/*******************************
					결제 ajax
		********************************/
		
		function pay_ajax(rsp,price){
			var addressNo = "${av.addressNo}";
			var size = "${sizeName}";
			var pay_info = $("#payInfo_value").val();
			var point = $("#inner_point").text();
			
			let pay_data = {
				"imp_uid" : rsp.imp_uid,
				"price" : price,
				"goodsNo" : goodsNo,
				"size" : size,
				"addressNo" : addressNo,
				"pay_info" : pay_info,
				"point" : point
			};
			
			$.ajax({
				url: "${pageContext.request.contextPath}/Iamport/verifyIamport.do",		
				method: "POST",
				contentType: "application/json",
				dataType: "json",
				data: JSON.stringify(pay_data),
				success : function(data){
					console.log(data);
					if(data.result == 2){
						$(location).attr("href","${pageContext.request.contextPath}/order/orderFinish.do?orderNum="+data.orderNum);
					}
				},
				error : function(request,status,error){
					alert("다시 시도하시기 바랍니다.");
					cancelPayments(rsp);
					console.log("code: " + request.status);
			        console.log("message: " + request.responseText);
			        console.log("error: " + error);
				}	
			});
		}
		
		/*******************************
					결제 취소
		********************************/
		function cancelPayments(temp){
			let data = null;
			if(temp!=null){//결제금액이 달라졌을때 결제취소
					data={
					impUid:temp.imp_uid,
					reason:"결제 금액 위/변조. 결제 금액이 일치안함",
					checksum:temp.paid_amount,
					refundHolder:temp.buyer_name,
					bank_name:temp.bank_name
				};
			}
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/Iamport/cancelIamport.do",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success: function(result){
					alert("결제금액 환불완료");
				},
				error: function(result){
					alert("결제금액 환불못함. 이유: "+result.responseText);
				}
			});
		}//cancelPayments
		
	</script>
</body>
</html>