<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>home</title>
		<style>
        .totalsize {
            width: 1902px;
            height: 2456px;
            background-color: #fafafa;

        }

        .content {
            width: 700px;
            height: 2338px;
            margin: 0 auto;
            padding: 20px 40px 160px;
        }

        .buy_immediate {
            width: 700px;
            height: 2338px;
        }

        .product_info_area {
            width: 700px;
            height: 144px;
            padding: 32px;
            margin: 0;
            /* 확인해야함*/
            box-sizing: border-box;
        }

        .product_info {
            width: 636px;
            height: 104px;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            width: 100%;
            background-color: #fff;
            margin-top: -10px;
            /* 확인해야함*/
        }


        .product {
            width: 80px;
            height: 80px;
            padding-top: 0;
            flex-shrink: 0;
            border-radius: 10px;
            background-color: black;
            position: relative
        }

        .product_detail {
            width: 556px;
            height: 82px;
            overflow: hidden;
            -webkit-box-flex: 1;
            flex: 1;
            padding-left: 16px;
            margin: 0;
        }

        .model_number {
            display: block;
            line-height: 17px;
            font-size: 14px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .model_title {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            line-height: 17px;
            margin-top: 1px;
            font-size: 14px;
        }

        .model_ko {
            line-height: 16px;
            margin-top: -15px;
            font-size: 13px;
            letter-spacing: -.05px;
            color: rgba(34, 34, 34, .5);
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
        }

        .model_desc {
            display: flex;
            -webkit-box-align: start;
            align-items: flex-start;
            -webkit-box-pack: justify;
            justify-content: space-between;
            margin-top: 7px;
            margin-top: 10PX;
            box-sizing: border-box;

        }

        .size_txt {
            line-height: 17px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0;
            margin: 0;
        }

        .section {
            width: 636px;
            height: 370px;
            padding: 32px;
            background-color: #fff;
            border-top: 8px solid #fafafa;
        }

        .section_unit {
            width: 636px;
            height: 365px;
            margin: 0;
            padding: 32px;
            background-color: #fff;
            margin-top: 12px;
        }

        .section_title {
            width: 636px;
            height: 34px;
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            padding-bottom: 12px;
            padding: 0px 0px 12px;
        }

        .title_txt {
            line-height: 22px;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: -.15px;
            -webkit-box-flex: 1;
            flex: 1;
            width: 552.55px;
            height: 22px;
        }


        .section_content {
            width: 636px;
            height: 123px;
        }

        .delivery_info {
            position: relative;
            width: 636px;
            height: 63px;
        }

        .address_info {
            width: 556px;
            height: 63px;
            margin-top: -55px;
        }

        .info_list {
            width: 556px;
            height: 63px;
        }

        .info_box {
            overflow: hidden;
            line-height: 17px;
            letter-spacing: -.15px;
        }

        .title {
            float: left;
            min-width: 80px;

            font-size: 13px;
            letter-spacing: -.07px;
            color: rgba(34, 34, 34, .5);
        }

        .dd {
            overflow: hidden;
            font-size: 14px;
            letter-spacing: -.21px;
        }

        .info_box {
            margin-top: 6px;
            overflow: hidden;
            line-height: 17px;
            letter-spacing: -.15px;
        }


        .btn_2 {
            width: 636px;
            height: 47px;
            text-align: left;
            border-radius: 10px;
            background-color: white;
        }

        .button_shipping_memo {

            width: 609.516px;
            height: 17.488px;
            padding: 14px 12px;
            border: 1.250px;
            margin-top: -16px;
        }



        .button-text {
            color: #2222224d;
            font-size: 16px;
            font-weight: bold;
        }



        .button-text1 {
            color: black;
            font-size: 13px;
            font-weight: bold;
        }

        .button-text2 {
            color: #2222224d;
            font-size: 8px;
        }

        .point_area {
            width: 700px;
            height: 250px;
            background-color: #fff;
        }

        .inner_point_area {
            width: 636px;
            height: 139px;
            padding: 32px;
            margin-top: 12px;
            border-top: 7.5px;
        }

        .all_use {
            width: 70.69px;
            height: 24px;
            color: grey;
            font-size: 12px;
            border-radius: 12px;
        }

        .have_point {
            font-size: 14px;

        }

        .totalprice {
            background-color: #fff;
            width: 636px;
            height: 300px;
            padding: 32px;
            border-top: 8px;
            margin-top: 12px;
        }

        .agree_wrap {
            width: 636px;
            height: 645px;
            padding: 32px 32px 16px;
            background-color: #fff;
            margin-top: 12px;
        }

        .point_view {
            width: 608px;
            height: 20px;
            padding: 14px 12px;
            border: 1px solid #ebebeb;
            border-radius: 10px;
        }

        .Q {
            border-radius: 10px;
        }

        .title_txt1 {
            margin-left: -13px;
            font-size: 18px;
        }

        .movespan {
            margin-left: -112px;
        }

        .movespan1 {
            margin-left: -100px;
        }

        .btnimg {
            border-radius: 15px;
            border: 1px solid #ebebeb
        }

        .btnimg2 {
            border-radius: 15px;
            border: 1px solid #ebebeb
        }

        .my-button5 {
            width: 636.02px;
            height: 47.99px;
            padding: 14px 2px;
            margin-left: -12px;
            border-radius: 10px;
            border: 1px solid #ebebeb
        }

        .payment-button {
            width: 100%;
            height: 51.98px;
            background-color: #cccccc;
            border: none;
            color: white;
            font-size: 16px;
        }

        button.active {
            background-color: red;
        }

        /* 체크박스 3개 체크시 결제하기버튼 빨간색으로*/
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
                                    "DZ5908-106"
                                </strong>
                                <p class="model_title">
                                    (TD) Jordan 1 X Travis Scott Retro Low OG SP Medium Olive
                                </p>
                                <p class="model_ko">
                                    (TD) 조던 1 x 트래비스 스캇 레트로 로우 미디엄 올리브
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
                                    <button onclick="add_address_openPopup()" style="border:1px solid white">+새 주소
                                        추가</button>
                                </div>
                            </div><!--section_title-->
                            <div id="address_popup"
                                style="display: none; position: absolute;z-index: 10; top: 500px; left: 950px; transform: translate(-50%, -50%); width: 400px; height: 500px; background-color: white; border: 1px solid #ccc; padding: 10px;">
                                <h3 style="text-align: center;">
                                    <b>새 주소 추가</b>
                                </h3>
                                <p><b>이름</b></p>
                                <input type="text">
                                <p><b>휴대폰 번호</b></p>
                                <input type="tel" placeholder="- 없이 입력">
                                <p><b>우편번호 검색</b></p>
                                <input type="text">
                                <button>우편번호</button>
                                <p><b>주소</b></p>
                                <input type="text" placeholder=" 우편번호 검색 후, 자동 입력됩니다.">
                                <p><b>상세주소</b></p>
                                <input type="text" placeholder=" 건물,아파트,동/호수 입력">
                                <hr>
                                <button onclick="add_address_closePopup()" style="border-radius: 10px;">닫기</button>
                            </div>

                            <div class="delivery_info">
                                <div class="address_popup">
                                    <button class="btn_2 " style="border: 1px solid #ebebeb"
                                        onclick="add_address_openPopup()">주소를 추가해주세요</button>
                                </div>
                            </div><!--delivery_info-->
                            <div style="width: 636px ;height:48px ;">
                                <div class="button_shipping_memo">
                                    <label for="my-select">
                                        <select class="my-button5"><!--이름 바꿀것-->
                                            <option value="option1">요청 사항을 선택해주세요</option>
                                            <option value="option2">문 앞에 놓아주세요</option>
                                            <option value="option3">경비실에 맡겨 주세요</option>
                                            <option value="option3">파손 위험 상품입니다. 배송 시 주의해주세요</option>
                                        </select>
                                    </label>
                                    <hr>
                                    <h3 class="title_txt1">배송방법</h3>
                                    <button class="btnimg"
                                        style="width:636px;height:66px; display:flex; align-items:center; margin-left: -12px;background-color:white">
                                        <img src="" alt="button image"
                                            style="width: 40px; height: 40px; margin-right: 10px;">

                                        <div style="display:flex; flex-direction:column; ">
                                            <span style="display:block;" class="movespan1"><b>일반배송 3,000원</b>
                                            </span>
                                            <span style="display:block;">검수 후 배송 * 5~7일 내 도착 예정</span>
                                        </div>
                                    </button>
                                    <button class="btnimg2"
                                        style="width:636px;height:66px; display:flex; align-items:center; margin-left: -12px; margin-top: 5px;background-color:white">
                                        <img src="" alt="button image"
                                            style="width: 40px; height: 40px; margin-right: 10px;">
                                        <div style="display:flex; flex-direction:column;">
                                            <span style="display:block;" class="movespan"><b>창고보관 </b>첫 30일 무료
                                            </span>
                                            <span style="display:block;">배송 없이 창고에 보관 * 빠르게 판매 가능 </span>
                                        </div>
                                    </button>
                                    </button>
                                </div>
                            </div>
                        </div><!--section_unit-->
                    </section>
                    <div class="point_area">
                        <div class="inner_point_area">
                            <h3 class="title_txt">포인트</h3>
                            <input type="text" class="point_view" placeholder="0">
                            <button class="all_use">모두사용</button>
                            <p class="have_point"> 보유포인트:
                                <button onclick="openPopup()" style="border-radius: 10px;" class="Q">?</button> 0p
                            </p>
                            <!--포인트 - 팝업창-->
                            <div class="point_popup">
                                <div id="popup"
                                    style="display: none; position: absolute; top: 955px; left: 950px; transform: translate(-50%, -50%); width: 400px; height: 350px; background-color: #fff; border: 1px solid #ccc; padding: 10px;">
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
                                    <button onclick="closePopup()" style="border-radius: 10px;">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end포인트 - 팝업창-->
                    <div class="totalprice">
                        <h3> <strong>최종 주문 정보</strong></h3>
                        <p>총 결제금액</p>
                        <p style="color: red; text-align: right;">436,300</p>
                        <hr>
                        <!--가로로-->
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <p>구매가</p>
                            <p style="color: red; text-align: right;">436,000</p>
                        </div>
                        <div style="display: flex; justify-content: space-between; align-items: center;">
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
                            <input type="checkbox" class="agree-storage" id="checkbox1">
                            <label for="agree-storage">위 내용을 모두 확인하였으며, 동의합니다.</label>
                            <!-- <p><a href="#">보관판매란?</a></p>-->
                            <hr>
                            <p><b>창고 보관을 선택한 경우, 구매자에게 배송되지 않고 (쇼핑몰 이름) 창고에 보관됩니다.</b></p>
                            <p style="font-size:15px">보관이 완료되면 창고 이용료(현재 첫 30일 무료)가 결제됩니다.</p>
                            <input type="checkbox" class="agree-storage" id="checkbox2">
                            <label for="agree-storage">위 내용을 모두 확인하였으며, 창고 보관에 동의합니다.</label>
                            <hr>
                            <p><b>'바로 결제하기'를 선택하시면 즉시 결제가 진행되며, 단순 변심이나 실수에 의한 <br>취소가 불가능합니다</b></p>
                            <p style="font-size:15px">본 거래는 개인간 거래로 전자상거래법(제 17조)에 따른 철약철회(환불,교환) 규정이 적용되지 않습니다.</p>
                            <input type="checkbox" class="agree-terms" id="checkbox3">
                            <label for="agree-terms"><b>위 내용을 모두 확인하였으며, 거래 진행에 동의합니다.</b></label>
                            <br>
                            <br>
                            <br>
                            <p class="end">총 결제금액</p>
                            <p style="color: red; text-align: right;">436.300</p>
                        </div>
                        <button class="payment-button" id="payment-button">결제하기</button>
                        <!--<button style="width: 100%; height: 51.98px; background-color: #cccccc; border: none; color: white; font-size: 16px;">결제하기</button>-->
                    </div>
                </div><!--buy_immediate-->
            </div><!-- content-->
        </div><!--totalsize-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
    </div>	
    
    
    	
	<script>
	
	    /*v포인트 옆 ? 버튼 팝업창*/
	    function openPopup() {
	        var popup = document.getElementById("popup");
	        popup.style.display = "block";
	    }
	
	    function closePopup() {
	        var popup = document.getElementById("popup");
	        popup.style.display = "none";
	    }
	    /*end포인트 옆 ? 버튼 팝업창*/
	
	    /* 주소 추가 팝업*/
	    function add_address_openPopup() {
	        var popup = document.getElementById("address_popup");
	        popup.style.display = "block";
	    }
	
	    function add_address_closePopup() {
	        var popup = document.getElementById("address_popup");
	        popup.style.display = "none";
	    }
	    /*end 주소 추가 팝업*/
	
	    /* 체크박스 3개 체크시 결제하기버튼 빨간색으로*/
	    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    const button = document.getElementById('payment-button');
	
	    function updateButton() {
	        let allChecked = true;
	        checkboxes.forEach(function (checkbox) {
	            if (!checkbox.checked) {
	                allChecked = false;
	            }
	        });
	
	        if (allChecked) {
	            button.classList.add('active');
	        } else {
	            button.classList.remove('active');
	        }
	    }
	
	    checkboxes.forEach(function (checkbox) {
	        checkbox.addEventListener('change', updateButton);
	    });
	        /* end체크박스 3개 체크시 결제하기버튼 빨간색으로*/

	</script>
	</body>
</html>