<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>home</title>
		<style>
        
        .container {
        width: 640px;
        height: 43.98px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        
        }
      
        .circle {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-color: #ddd;
        display: flex;
        justify-content: center;
        align-items: center;
        
        }
      
        .circle img {
        width: 20px;
        height: 20px;
        object-fit: cover;
        border-radius: 50%;
        background-color: black;
        }
        .userid {
        display: flex;
        flex-direction: column;
        margin-left:-450px;
       /*justify-content: center;

        align-items:center;*/
        }

        .userid p {
        margin: 0;
        font-size: 14px;
        margin-left: 5px;
        }

        .btn {
        width: 100px;
        height: 30px;
        background-color: black;
        color: #fff;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
        maring-left:auto;
        border-radius: 15px;
        }
        .product img {

        width: 111.92px;
        height: 111.92px;

        }
        .product img{
        width: 111.92px;
        height: 111.92px;
        

        }
        .product-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        }

        .total{
        width:640px;
        height: 1418.65px;

        }

        .tag{
        width:640px;
        height: 43.96px;
        }

        .emoticon{
        width:640px;
        height: 43.96px;
        }
        
        .like{
        width:640px;
        height:33.98px;
        }
        
        .commentcnt{
        width:640px;
        height:58.44px;
        }
        
        .comment{
        width:640px;
        height:57.93px;
        }
        
        body{
        display: flex;
        flex-direction: row;
        justify-content: center;
        }
        
        .write{
            margin-top: 4px;
        }
        
        .like_btn {
        background-color: #ccc;
        border: none;
        color: whitesmoke;
        padding: 10px 15px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 25px;
        
        }
        /**/
        input[type="text"] {
        width: 370px;
        height: 50px;
        border-radius: 15px;
        background-color: white;
        }
        
        .comment {
        display: flex; /* 가로 정렬을 위해 flexbox 사용 */
        align-items: center; /* 수직 중앙 정렬 */
        }

        .comment a {
        display: block; /* a 태그를 블록 요소로 설정하여 가로폭 전체를 차지하도록 함 */
        }

        .comment img {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        margin-right: 10px;
        }
        
        .close_btn{
        margin-top: 430px;
        }
        
        .reply_btn{
        border-radius: 10px;
        border: none;
        font-size: 10px;
        color: black;
        margin-left: 50px;
        }
				
		</style>
	</head>
	<body>
		<div>
			<jsp:include page="../common/header_style.jsp"></jsp:include>
				    <div class="total">
        <div class="container">
            <div class="circle">
            <img src="" alt="Image"><!--상단 프로필 사진 -->
         
       
            </div>
            <div class="userid">
                <p><strong><a href="#">dfdrrff</a></strong></p>
                <p>2일전</p>
            </div>
                <button id="follow-button" class="btn">팔로우</button>        
      </div>
        <div style="position:relative;">
            <style>img {width:639.98px; height: 854.32px;}</style>
            <img src="">
            <div style="position:absolute; bottom:10px; left:10px; display:flex;">
            
                <div style="font-size: 24px; margin-right: 10px;">
                
                </div> 
            </div>
        <div class="tag">
            <p>상품 태그 2개</p>
        </div>
       
        <div class="product"style="display: inline-block; font-size:13px; " >
            <img src="">
            <p>NIKe x supreme air</p>
            <p><strong>284,000</strong></p>
        </div>    
        <div class ="product" style="display: inline-block;font-size:13px ;margin-left: 15px; " >
            <img src="">
            <p>lee cup</p>
            <p><strong>494,000</strong></p>
        </div>

     <!--하트 추가하기-->  
        <div style="display: flex;   gap: 10px;">       
            <div class="heart">           
                <!--하트클릭시 좋아요1 up-->       
                <button id="like-btn" class="like_btn" style="font-size:15px; border:none;background-color: white;">&#x2764;</button>
                <br>

               <p><p style="text-align: justify;">좋아요 <span id="like-count">0 </span>개</p></p>
            


                <!--end하트클릭시-->


            </div>
          <!--말풍선 추가하기-->  
                <div class="write">


                    <button id="write-btn" style ="font-size:24px; border:none;  background-color:white;">
                        <img src="" style="height:30px ;width:30.33px">            
                    </button>
                        <div class="point_popup">
                            <button onclick="openPopup()" style="border-radius: 10px;">?</button>
                        
                            <div id="popup" style="display: none; position: absolute; top: 50%; right: -441px; transform: translateY(-50%); width: 420px; height: 832px; margin-top: -262px; background-color: #fff; border: 1px solid #ccc; padding: 10px;">
                        
                           
                                <h3 style="text-align: center;">댓글</h3>
                            
                            <div class="comment">
                              <img src="" alt="userid">
                              <a href="#"><p>userid</p></a>
                            </div>  

                            <div class="comment_area">
                              <p>처음 올리는 타이렉스 코디</p>
                              <p><a href="#">#sneakers #스타일컬렉터 #캐주얼스트릿 #전신샷</a></p> 
                              <input type="text" placeholder="댓글을 남기세요..">
                            </div>      
                                <hr>
                                  
                                    <div class="comment">
                                    <img src="" style="width: 35px; height: 35px; border-radius: 50%; margin-right: 10px;">
                                        <a href="#"><p>otherid </p></a>
                                        <p style="font-size: 13px;">너무 이뻐요~!! 사이즈 알수있을까요?</p><br>
                                        </div>
                                        <button class="reply_btn"> 답글달기</button>
                                    
                                        
                                    <div class="close_btn">
                                    <button onclick="closePopup()" style="border-radius: 10px;">닫기</button>
                                    </div>
                                        
                            </div>
                        </div>
                </div>
        </div>

          <!-- 나중에 지울것 필요 x css js
        <div class="like">  
            <p> 좋아요 45개</p>
            
        
        </div>
            -->
		        <div class="hashtag">
		            <p><a href="#">#sneakers #스타일컬렉터 #캐주얼스트릿 #전신샷</a></p> 
		        </div>
		
		        <div class="commentcnt">
		            <p>댓글 2개</p>
		        </div>
		        
		        
		        <div class="comment" style="display: flex; align-items: center;">
		            <img src="" style="width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;"><!--댓글  프로필 사진 -->
		            <p >dfsdffsfs</p><!--other계정-->
		            <p style="margin-left: 25px;">셋업 정보 알 수 있을까요?</p><!--댓글-->
		        
		        </div>
		        









    </div>
				
				
			<jsp:include page="../common/footer.jsp"></jsp:include>
		</div>
		<script>
		
		 /*
        const btn = document.getElementById('heart-btn');
        let isLiked = false;

        btn.addEventListener('click', () => {
            isLiked = !isLiked;
            if (isLiked) {
                btn.style.color = 'red';
            } else {
                btn.style.color = 'black';
            }
        });
    */
        /*END하트눌렀을때 빨간색으로*/

        /*팔로우 버튼 클릭시 색상 변경*/
        const followButton = document.getElementById("follow-button");

		    followButton.addEventListener("click", function() {
		    if (followButton.innerHTML === "팔로우") {
		        followButton.innerHTML = "팔로잉";
		        followButton.style.backgroundColor = "white";
		        followButton.style.color = "black";
		    } else {
		        followButton.innerHTML = "팔로우";
		        followButton.style.backgroundColor = "black";
		        followButton.style.color = "white";
		    }
		    });
		    /*END팔로우 버튼 클릭시 색상 변경*/
        

		        /*하트버튼 js*/
	    const likeBtn = document.getElementById("like-btn");
	    const likeCount = document.getElementById("like-count");
		
		    let count = 0;
		
		    likeBtn.addEventListener("click", function() {
		    count++;
		    likeCount.innerHTML = count;
		    likeBtn.style.backgroundColor = "pink";
		    });
		
		    /*end하트버튼 js*/
		    function openPopup() {
		    var popup = document.getElementById("popup");
		    popup.style.display = "block";
		    }
		
		    function closePopup() {
		    var popup = document.getElementById("popup");
		    popup.style.display = "none";
		    }
		            
		
		
		
		
		
		</script>
	</body>
</html>