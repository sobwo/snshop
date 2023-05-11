<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>home</title>
			<link href=" ${pageContext.request.contextPath}/resources/css/order/orderPage.css" rel="stylesheet">
		<style>
		.nav_list:nth-child(3) a{
			font-weight:bold;
		}
		</style>
	</head>
	<body>
	    <div>
	        <jsp:include page="../common/header_style.jsp"></jsp:include>
	        <div class="totalsize">
	            <div class="content">
	                <div class="buy_immediate">
	                    <div class="product_info_area" style="background-color: #fff;">
	                        <div class="product_info">
	                            <div class="product">
	                                <img src="" ; style=width:80px height:80px; background>
	                            </div><!--product-->
	
	                            <div class="product_detail">
	                                <strong class="model_number">
	                                    ${gv.modelNum}
	                                </strong>
	                                <p class="model_title">
	                                    (TD) Jordan 1 X Travis Scott Retro Low OG SP Medium Olive
	                                </p>
	                                <p class="model_ko">
	                                    ${gv.goodsName}
	                                </p>
	                                <div class="model_desc">
	                                    <p class="size_txt">
	                                        270
	                                    </p>
	                                </div><!--model_desc -->
	                            </div><!--product_detail-->
	                        </div><!--product_info-->
	                    </div><!--product_info_area-->
	                    <section>
	                        <div class="section_unit">
	                            <div class="section_title">
	                                <h3 class="title_txt">배송주소</h3>
	                                <div class="address_popup">
	                                    <button onclick="add_address_openPopup()" style="border:1px solid white;cursor:pointer;background-color: white">+새 주소
	                                 	추가</button>
	                                </div>
	                            </div><!--section_title-->           
	                            <div id="address_popup">		                                
			                                <h3 style="text-align: center;">
			                                    <b>새 주소 추가</b>
			                                </h3>
			                               	<p><b>이름</b></p>		                                			                                	
			                                	<input type="text"class="popup_style">			                                		                                
			                                <p><b>휴대폰 번호</b></p>			                            
			                                	<input type="tel" class="popup_style"placeholder="- 없이 입력">		                                
			                                <p><b>우편번호 검색</b></p>
			                                <input type="text"class="popup_style">
			                                <button class="addressnum">우편번호</button>
			                                <p><b>주소</b></p>
			                                <input type="text"class="popup_style" placeholder=" 우편번호 검색 후, 자동 입력됩니다.">
			                                <p><b>상세주소</b></p>
			                                <input type="text"class="popup_style" placeholder=" 건물,아파트,동/호수 입력">				
			                                <button onclick="add_address_closePopup()" class="popup_inner_btn">닫기</button>	                            		
	                            </div>
	
	                            <div class="delivery_info">
	                                <div class="address_popup address_plus_wrap">
	                                    <button class="btn_2 " style="border: 1px solid #ebebeb"
	                                        onclick="add_address_openPopup()">주소를 추가해주세요</button>
	                                </div>
	                            </div><!--delivery_info-->
	                            <div style="width: 636px ;height:48px ;">
	                                <!--  button_shipping_memo -->
	                                    <label for="my-select">
	                                        <select class="my-button5"><!--이름 바꿀것-->
	                                            <option value="option1">요청 사항을 선택해주세요</option>
	                                            <option value="option2">문 앞에 놓아주세요</option>
	                                            <option value="option3">경비실에 맡겨 주세요</option>
	                                            <option value="option3">파손 위험 상품입니다. 배송 시 주의해주세요</option>
	                                        </select>
	                                    </label>
	                                    <h3 class="title_txt1">배송방법</h3>
	                                    <button class="btnimg">
	                                       
	                                        <img src="" alt="button image"
	                                            style="width: 40px; height: 40px; margin-right: 10px;">
	
	                                        <div style="display:flex; flex-direction:column; ">
	                                            <span style="display:block;" class="movespan1"><b>일반배송 3,000원</b>
	                                            </span>
	                                            <span style="display:block;">검수 후 배송 * 5~7일 내 도착 예정</span>
	                                        </div>
	                                    </button>
	                                    <button class="btnimg2">                                     
	                                        <img src="" alt="button image"
	                                            style="width: 40px; height: 40px; margin-right: 10px;">
	                                        <div style="display:flex; flex-direction:column;">
	                                            <span style="display:block;" class="movespan"><b>창고보관 </b>첫 30일 무료
	                                            </span>
	                                            <span style="display:block;">배송 없이 창고에 보관 * 빠르게 판매 가능 </span>
	                                        </div>
	                                    </button>
	                                <!--  button_shipping_memo -->
	                            </div>
	                        </div><!--section_unit-->
	                    </section>
	                    <div class="point_area">
	                        <div class="inner_point_area">
	                            <h3 class="title_txt">포인트</h3>
	                            <input type="text" class="point_view" placeholder="0">
	                            <button class="all_use">모두사용</button>
	                            <p class="have_point"> 보유포인트:
	                                <button onclick="openPopup()"  class="Q">?</button> 0p
	                            </p>
	                            <!--포인트 - 팝업창-->
	                            <div class="point_popup">
	                                <div id="popup">
	                                    
	                                    <h3 style="text-align: center;">이용안내</h3>
	                                    <p>사용 가능한 포인트 </p>
	                                    <p><b>0P</b></p>
	                                    <hr>
	                                    <p>이번달 소멸 예정 포인트 0P</p>
	                                    <p style="font-size: 10px;">포인트 유효기간은 적립일로부터 최대 1년까지이며, 유형에 따라 달라질 수 있습니다.</p>
	                                    <hr>
	                                    <p style="font-size: 10px;">1,000P 이상부터 구매금액 제한 없이 사용하실 수 있습니다.<br>
					                                        입찰 삭제, 거래 취소 시 사용한 포인트는 환불됩니다.<br>
					                                        먼저 적립된 포인트부터 순서대로 사용되며, 사용하지 않으실 경우 유효기간이 지나면 자동 소멸됩니다.<br>
					                                        유효기간이 지난 후 환불받은 포인트는 다시 사용하실 수 없습니다.
	                                    </p>
	                                    <button onclick="closePopup()" class="popup_inner_btn">확인</button>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <!--end포인트 - 팝업창-->
	                    <div class="totalprice">
	                        <h3> <strong>최종 주문 정보</strong></h3>
	                        <p >총 결제금액</p>
	                        <p style="color: red; text-align: right;">436,300</p>
	                        <hr>
	                        <!--가로로-->
	                        <div  style="display: flex; justify-content: space-between; align-items: center;">
	                            <p>구매가</p>
	                            <p style="color: red; text-align: right;">
	                            	<fmt:formatNumber type='number' maxFractionDigits='3' value='${gv.price}'/>
	                            </p>
	                        </div>
	                        <div class="inner_totalprice" style="display: flex; justify-content: space-between; align-items: center;">
	                            <p>포인트</p>
	                            <p style="color: red; text-align: right;">-</p>
	                        </div>
	                        <div style="display: flex; justify-content: space-between; align-items: center;">
	                            <p>배송비</p>
	                            <p style="color: red; text-align: right;">3000원</p>
	                        </div>
	                        <hr>
	                    </div>
	                    <div class="agree_wrap">
	                        <div class="agree">
	                            <p><b>판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수<br> 있습니다</b></p>
	                           
	                            <p style="font-size:15px">앱 알림해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없습니다.</p>
	                            <br>
	                            <input type="checkbox" class="agree-storage" id="checkbox1">
	                            <label for="agree-storage">위 내용을 모두 확인하였으며, 동의합니다.</label>
	                            <!-- <p><a href="#">보관판매란?</a></p>-->
	                            <hr>
	                            <p><b>창고 보관을 선택한 경우, 구매자에게 배송되지 않고 (쇼핑몰 이름) 창고에 보관됩니다.</b></p>
	                            
	                            <p style="font-size:15px">보관이 완료되면 창고 이용료(현재 첫 30일 무료)가 결제됩니다.</p>
	                            <br>
	                            <input type="checkbox" class="agree-storage" id="checkbox2">
	                            <label for="agree-storage">위 내용을 모두 확인하였으며, 창고 보관에 동의합니다.</label>
	                            <hr>
	                            <p><b>'바로 결제하기'를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 <br>취소가 불가능합니다</b></p>
	                             
	                            <p style="font-size:15px">본 거래는 개인간 거래로 전자상거래법(제 17조)에 따른 철약철회(환불,교환) 규정이 적용되지 않습니다.</p>
	                          
	                            <input type="checkbox" class="agree-terms" id="checkbox3">
	                            
	                            <label for="agree-terms"><b>위 내용을 모두 확인하였으며, 거래 진행에 동의합니다.</b></label>
								<br>
	                            <div class="totalprice_area">
		                            <p>총 결제금액</p>
		                            <p style="color:red;" >436.300</p>
	                        	</div>
	                        </div>                        
	                        <button class="payment-button"id="payment-button" onclick="location.href='${pageContext.request.contextPath}/order/orderFinish.do'">결제하기</button>                      
	                    </div>
	                </div><!--buy_immediate-->
	            </div><!-- content-->
	        </div><!--totalsize-->
	        <jsp:include page="../common/footer.jsp"></jsp:include>
	       	<script src="${pageContext.request.contextPath}/resources/js/order/orderPage.js"></script>
	    </div>	
		</body>
</html>