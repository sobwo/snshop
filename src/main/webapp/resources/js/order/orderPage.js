	
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
