//체크박스 전체 선택 시 '구매계속' 버튼 활성화
$(document).ready(function() {

  var numCheckboxes = $('.checkList input[type="checkbox"]').length;

  $('.checkList input[type="checkbox"]').on('change', function() {
    var numChecked = $('.checkList input[type="checkbox"]:checked').length;
    if (numChecked === numCheckboxes) {
      $('#buyContinue').prop('disabled', false);
      $('#buyContinue').css('background-color', '#222');
      $('#buyContinue').css('cursor', 'pointer');
    } else {
      $('#buyContinue').css('background-color', '#ebebeb');
      $('#buyContinue').prop('disabled', true);
    }
  });
});