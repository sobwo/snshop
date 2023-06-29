<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>판매 페이지</title>
		<link href="${pageContext.request.contextPath}/resources/css/shop/salePage.css" rel="stylesheet"/>
	</head>
	<body>
		<jsp:include page="../common/header_shop.jsp"></jsp:include>
		<div class="content_wrap">
			<div class="content">
				<h2 style='padding-bottom:50px;text-align:center'>
					<span style='font-size:35px;color:#222;'>판매 상품 입력</span><br/>
				</h2>
				<form name="frm">
					<table>
						<thead>
						</thead>
						<tbody>
							<tr>
								<td>상품 사진</td>
								<td>
									<div id="previewImages"></div>
									<div class="product_img">
										<input type="file" multiple="multiple" id="fileatt" name="contentsImg" onchange="readImage(event)">
										<label for="fileatt" id="fileLabel"><img class="fileattImage" src="${pageContext.request.contextPath}/resources/image/imageAdd.png"></label>
										<span style="margin-left:15px;font-size:13px;">최대 5개까지 등록 가능합니다.</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>상품 이름</td>
								<td><input type="text" name="goodsName" id="goodsName"  placeholder="상품 이름을 입력하세요">
									<span id="nameMsg"></span></td>
							</tr>
							<tr>
								<td>상품 브랜드 이름</td>
								<td><input type="text" name="goodsBrandName" id="goodsBrandName"  placeholder="상품 브랜드 이름을 입력하세요">
									<span id="nameBrandMsg"></span></td>
							</tr>
							<tr>
								<td>상품 영문 이름</td>
								<td><input type="text" name="goodsEng" id="goodsEng" placeholder="상품 영문 이름 입력하세요">
									<span id="nameEngMsg"></span></td>
							</tr>
							<tr>
								<td>상품 색상</td>
								<td><input type="text" name="goodsColor" id="goodsColor" placeholder="상품 색상을 입력하세요">
									<span id="nameColor"></span></td>
							</tr>
							<tr>
								<td>모델 번호</td>
								<td><input type="text" name="modelNum" id="modelNum" placeholder="모델 번호를 입력하세요">
									<span id="numMsg"></span></td>
							</tr>
							<tr>
								<td>카테고리 분류</td>
								<td>
									<select name="category" class="category" id="category">
										<option value="none" selected>상위 카테고리 선택</option>
										<option value="신발">신발</option>
										<option value="아우터">아우터</option>
										<option value="상의">상의</option>
										<option value="하의">하의</option>
										<option value="가방">가방</option>
										<option value="시계">시계</option>
									</select>
									<select name="categoryName" class="shoes categoryName">
										<option value="none" selected>하위 카테고리 선택</option>
										<option value="스니커즈">스니커즈</option>
										<option value="플랫">플랫</option>
										<option value="로퍼">로퍼</option>
										<option value="샌들">샌들</option>
										<option value="더비">더비</option>
										<option value="힐">힐</option>
										<option value="기타">기타</option>
									</select>
									<select name="categoryName" class="outer categoryName">
										<option value="none" selected>하위 카테고리 선택</option>
										<option value="자켓">자켓</option>
										<option value="코트">코트</option>
										<option value="패딩">패딩</option>
										<option value="기타">기타</option>
									</select>
									<select name="categoryName" class="top categoryName">
										<option value="none" selected>하위 카테고리 선택</option>
										<option value="가디건">가디건</option>
										<option value="긴팔">긴팔</option>
										<option value="반팔">반팔</option>
										<option value="셔츠">셔츠</option>
										<option value="후드">후드</option>
										<option value="후드집업">후드집업</option>
										<option value="맨투맨">맨투맨</option>
										<option value="원피스">원피스</option>
										<option value="니트">니트</option>
										<option value="기타">기타</option>
									</select>
									<select name="categoryName" class="pants categoryName">
										<option value="none" selected>하위 카테고리 선택</option>
										<option value="바지">바지</option>
										<option value="반바지">반바지</option>
										<option value="스커트">스커트</option>
										<option value="레깅스">레깅스</option>
										<option value="기타">기타</option>
									</select>
									<span id="categoryMsg"></span>
								</td>
							</tr>
							<tr>
								<td>착용 성별</td>
								<td>
									<select name="goodsGender" id="goodsGender">
										<option value="공용">공용</option>
										<option value="남성">남성</option>
										<option value="여성">여성</option>
									</select>
									<span id="genderMsg"></span>
								</td>
							</tr>
							<tr>
								<td>희망 가격</td>
								<td><input type="text" name="price" id="price" placeholder="상품 가격을 입력하세요">
									<span id="priceMsg"></span>
								</td>
							</tr>
							<tr>
								<td>사이즈</td>
								<td><input type="text" name="size" id="size" placeholder="사이즈를 입력하세요">
									<span id="sizeMsg"></span>
								</td>
							</tr>
							<tr>
								<td>판매 재고량</td>
								<td><input type="text" name="quantity" id="quantity" placeholder="판매 재고 수를 입력하세요">
									<span id="sizeMsg"></span>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="submit">
						<span><input type="button" id="submit_btn" onclick="check()" value="등록" disabled="disabled"></span>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script>
			$(document).ready(function(){
				var msg = "${msg}";
				if(msg != "")
					alert(msg);
			});
			
			$("select[name=categoryName]").hide();
			
			$(".category").change(function(){
				var category = $(".category").val();
				if(category == '신발'){
					$("select[name=categoryName]").hide();
					$(".shoes").show();
				}
				else if(category == '아우터'){
					$("select[name=categoryName]").hide();
					$(".outer").show();
				}
				else if(category == '상의'){
					$("select[name=categoryName]").hide();
					$(".top").show();
				}
				else if(category == '하의'){
					$("select[name=categoryName]").hide();
					$(".pants").show();
				}
					
			});
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
					var imgContainer = document.createElement("div");
					var img = document.createElement("img");
					var imgWrapper = document.createElement("div");
					var deleteButton = document.createElement("button");
					deleteButton.textContent = "X";
					deleteButton.classList.add("delete-button");
					imgWrapper.classList.add("img-wrapper");
					
		
					img.setAttribute("src", event.target.result);
					imgWrapper.appendChild(img);
					imgWrapper.appendChild(deleteButton);
				 	imgContainer.appendChild(imgWrapper);
			      	previewImages.appendChild(imgContainer);
					 
			
					if (previewImages.childElementCount >= 5) {
						fileLabel.style.display = "none";
					}
					deleteButton.addEventListener("click", function() {
						imgContainer.remove();
						event.target.value = "";
						event.target.dispatchEvent(new Event("change"));
						if (previewImages.childElementCount < 5) {
							fileLabel.style.display = "block";
						}
					});
				};
			
			console.log(image);
			reader.readAsDataURL(image);
			}
			
			previewImages.style.display = "flex";
			previewImages.style.flexWrap = "wrap";
		}
			
			$('#fileatt, #goodsBrandName, #goodsName, #goodsEng, #modelNum, #goodsColor, #category, #price, .categoryName, #size, #quantity').on('input',function(){
				
				var inputImg = $('#fileatt').val();
				var inputBrandName = $('#goodsBrandName').val();
				var inputName = $('#goodsName').val();
				var inputEng = $(' #goodsEng').val();
				var inputNum = $('#modelNum').val();
				var inputColor = $('#goodsColor').val();
				var inputCategory = $('#category').val();
				var inputCategoryName = 'none';
				for(var i=0;i<$('.categoryName').length;i++)
					if($('.categoryName').eq(i).val() != 'none')
							inputCategoryName = $('.categoryName').eq(i).val();
				var inputPrice = $('#price').val();
				var inputSize = $('#size').val();
				var inputQuantity = $('#quantity').val();

				if((inputImg != '') && (inputBrandName != '') && (inputName != '') && (inputEng != '') && (inputNum != '') && (inputCategory != 'none') && (inputCategoryName != 'none') 
						&& (inputPrice != '') &&(inputSize !='') && (inputQuantity != '') && (isNaN(inputQuantity)==false)){
					$('#submit_btn').prop('disabled', false);
					$('#submit_btn').css('background-color', '#222');
				}
				else{ 
					$('#submit_btn').css('background-color', '#ebebeb');
					$('#submit_btn').prop('disabled', true);
				}
			});
			
			function check(){
				var fm = document.frm;
				fm.action ="${pageContext.request.contextPath}/shop/shop_upload.do?index=product";
				fm.method="post";
				fm.enctype ="multipart/form-data";
				fm.submit();
				return;
			}
		</script>
	</body>
</html>