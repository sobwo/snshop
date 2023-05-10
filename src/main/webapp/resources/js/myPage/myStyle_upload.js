// textarea 입력 칸 만큼 높이 증가 
function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}

// hashTag 클릭 시 contents에 텍스트 추가
function addHashtag(hashtag) {
      var textarea = document.getElementById("contents");
      var currentText = textarea.value;
      var newText = currentText + " " + hashtag;
      textarea.value = newText;
}

// 사진 업로드 개수 제한, n개 초과 시 첨부버튼 숨김
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

// 파일 선택 시 파일 개수를 구하여 hidden input의 value로 설정
const fileInput = document.querySelector('input[name="contentsImg"]');
const viewCntInput = document.querySelector('#viewCntInput');
  
fileInput.addEventListener('change', () => {
	viewCntInput.value = fileInput.files.length;
});
