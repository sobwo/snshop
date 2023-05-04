//하트 클릭 시 이미지 변경
var imgChange = document.getElementById("likeImageChange");
var currentImage = '${pageContext.request.contextPath}/resources/image/heart.png/';

function like(){
    if (currentImage === '${pageContext.request.contextPath}/resources/image/heart.png/') {
        imgChange.setAttribute('src', '${pageContext.request.contextPath}/resources/image/heart2.png');
        currentImage = '${pageContext.request.contextPath}/resources/image/heart2.png';
    } else {
        imgChange.setAttribute('src', '${pageContext.request.contextPath}/resources/image/heart.png/');
        currentImage = '${pageContext.request.contextPath}/resources/image/heart.png/';
    }
}