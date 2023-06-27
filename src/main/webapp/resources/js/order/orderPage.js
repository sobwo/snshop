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



/* 체크박스  체크시 결제하기버튼 빨간색으로+버튼 활성화*/
const checkboxes = document.querySelectorAll('input[type="checkbox"]');
const button = document.querySelector('.payment-button');

function updateButton() {
    let checkedCount = 0;
    checkboxes.forEach(function (checkbox) {
        if (checkbox.checked) {
            checkedCount++;
        }
    });

    if (checkedCount === 2) {
        button.style.backgroundColor = 'red';
        button.disabled = false;
    } else {
        button.style.backgroundColor = '#cccccc';
        button.disabled = true;
    }
}

checkboxes.forEach(function (checkbox) {
    checkbox.addEventListener('change', updateButton);
});



 var basic_name = $("#basic_name");	    
    		    
basic_name.on("input",function(){
	if(basic_name.val()=='' || basic_name.val().length<3 || basic_name.val().length>10) {
		basic_name.css('border-bottom','2px solid #f00');
		$("#name_msg").show();
	}
	else {
		basic_name.css('border-bottom','2px solid #222');
		$("#name_msg").hide();
	}
});
	    

/* 5-12 유효성 검사 테스트*/
var basic_name = $("#basic_name");
var basic_phone = $("#basic_phone");

basic_name.on("input",function(){
	if(basic_name.val()=='' || basic_name.val().length<3 || basic_name.val().length>10) {
		basic_name.css('border-bottom','2px solid #f00');
		$("#name_msg").show();
	}
	else {
		basic_name.css('border-bottom','2px solid #222');
		$("#name_msg").hide();
	}
});

basic_phone.on("input",function(){
	if(basic_phone.val()=='' || isNaN(basic_phone.val())) {
		basic_phone.css('border-bottom','2px solid #f00');
		$("#phone_msg").show();
	}
	else {
		basic_phone.css('border-bottom','2px solid #222');
		$("#phone_msg").hide();
	}
});

/* 주소추가*/
$("#basic_AddrNum").click(function(){
new daum.Postcode({
	oncomplete: function(data) { //선택시 입력값 세팅
	$("#basic_AddrNum").val(data.zonecode); //우편번호
	$("#basic_Addr").val(data.address) // 주소 넣기
	$("#basic_AddrDetail").focus(); //상세입력 포커싱
		}
	}).open();
});


//결제수단 버튼 클릭시 css
$(".pay_box").on("click",function(){

	payCntCheck();
	var method = $(this).children(".method");
	
	if(method.val() == "off"){
		$(this).css("border","2px solid #222");
		method.val("on");
	}
	else{
		$(this).css("border","1px solid #ebebeb");
		method.val("off");
	}
});

function payCntCheck(){
	var cnt = 0;
	var length = $(".pay_box").length;
	var method_val = $(".pay_box").children(".method");
	for(var i=0;i<length;i++){
		if(method_val.eq(i).val() == "on")
			cnt++;
	}

	if(cnt>0){
		for(var i=0;i<length;i++){
			method_val.eq(i).val("off");
			$(".pay_box").eq(i).css("border","1px solid #ebebeb");
		}
	}
}
	    

