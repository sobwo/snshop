<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주소록</title>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_address.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage_menu.css" rel="stylesheet"/>
		<style>
			.memberInfo_list li:nth-child(2) a{
				color:#222;
				font-weight:bold;
			}
		</style>
	</head>
	<body>
		<jsp:include page="popup/address_popup.jsp"></jsp:include>
		<div id="header_wrap" style='height:94px;border:0'>
			<jsp:include page="../common/header_common.jsp"></jsp:include>
		</div>
		<div class="myPage_wrap">
			<div class="myPage_inner_wrap">
				<jsp:include page="../common\myPage_menu.jsp"></jsp:include>
				<div class="content_wrap">
				
					<!-- 주소록 헤더 -->
					<div class="content_title">
						<h3>주소록</h3>
						<input type="button" class="plus_address" value="+ 새 배송지 추가">
					</div>
					
					<!-- 주소록 리스트 -->
					<c:forEach var="alist" items="${alist}">
						<div class="address_list">
							<div class="basic_address">
								<div class="address_contents">
									<div class="basic_title">
										<span class="addr_name">${alist.userName}</span>
										<c:if test="${alist.mainAddress=='Y'}">
											<span class="basic_mark">기본 배송지</span>
										</c:if>
									</div>
									<div class="basic_title">
										<span class="addr_phone">${alist.addressPhone}</span>
									</div>
									<div class="basic_title">
									<span class="addr_address">${alist.zipCode}&nbsp;&nbsp;${alist.address}&nbsp;&nbsp;${alist.detailAddress}</span>
									</div>
								</div>
								<div class="address_btn_area">
									<button class="address_btn" name="modifyBtn" value="${alist.addressNo}">수정</button>
									<button class="address_btn" name="deleteBtn" value="${alist.addressNo}">삭제</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage/address.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function submit_address() {
				var fm = document.frm;
				fm.action = "${pageContext.request.contextPath}/myPage/addressAction.do";
				fm.method = "POST";
				fm.submit();
			}
			
			$("button[name=modifyBtn]").on("click",function() {
				popup_wrap.show();
				var index = $(this).val();
				showAddress(index);
			});
			
			$("button[name=deleteBtn]").on("click",function(){
				 if (!confirm("확인(예) 또는 취소(아니오)를 선택해주세요.")) {
						
			        }
				else{
					var index = $(this).val();
					deleteAddress(index);
				}
			});
			
			function showAddress(index){
				$.ajax({
					url: "${pageContext.request.contextPath}/myPage/showAddress.do",		
					method: "GET",
					data: {"index" : index},
					dataType: "json",
					cache : false,
					success : function(data){
						$("#basic_name").val(data.av.userName);
						$("#basic_phone").val(data.av.addressPhone);
						$("#basic_AddrNum").val(data.av.zipCode);
						$("#basic_Addr").val(data.av.address);
						$("#basic_AddrDetail").val(data.av.detailAddress);
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});	
			}
			
			function deleteAddress(index){
				$.ajax({
					url: "${pageContext.request.contextPath}/myPage/deleteAddress.do",		
					method: "POST",
					data: {"index" : index},
					dataType: "json",
					cache : false,
					success : function(data){
						if(data.value == 1){
							alert("주소가 삭제되었습니다.");
							location.reload();
						}
					},
					error : function(request,status,error){
						alert("다시 시도하시기 바랍니다.");	
						console.log("code: " + request.status);
				        console.log("message: " + request.responseText);
				        console.log("error: " + error);
					}	
				});	
			}
		</script>
	</body>
</html>