// 사진 업로드 개수 제한, n개 초과 시 첨부버튼 숨김
function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}
function addHashtag(hashtag) {
      var textarea = document.getElementById("contents");
      var currentText = textarea.value;
      var newText = currentText + " " + hashtag;
      textarea.value = newText;
}

function readImage(event) {
	  var previewImages = document.querySelector("div#previewImages");
	  var fileLabel = document.querySelector("label#fileLabel");

	  // 파일 개수가 5개를 초과하는 경우 업로드를 막음
	  if (event.target.files.length > 5) {
	    alert("사진은 5개까지만 첨부 가능합니다.");
	    event.target.value = "";
	    return;
	  }

	  for (var image of event.target.files) {
	    var reader = new FileReader();
	    reader.onload = function(event) {
	      var img = document.createElement("img");
	      img.setAttribute("src", event.target.result);
	      previewImages.appendChild(img);
	      if (previewImages.childElementCount >= 5) {
	        fileLabel.style.display = "none";
	      }
	    };
	    console.log(image);
	    reader.readAsDataURL(image);
	  }
}

function check(){
	
	var fm = document.frm;
	fm.action ="<%=request.getContextPath()%>/myPage/myStyle_uploadeAction.do";
	fm.method="post";
	fm.enctype ="multipart/form-data";
	fm.submit();
	return;
}
