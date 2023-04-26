$(document).ready(function(){
	var tab = $(".tab_category");
	var tab_count = $(".tab_count");
	var tab_title = $(".tab_title");
	
	function setTab(index) {
		tab.css('border-bottom', '1px solid #d3d3d3');
		tab.eq(index).css('border-bottom', '2px solid #222');
		
		tab_count.css('color', '#222');
		tab_count.eq(index).css('color', '#f15746');
		
		tab_count.css('font-weight', 'normal');
		tab_count.eq(index).css('font-weight', 'bold');
		
		tab_title.css('font-weight', 'normal');
		tab_title.eq(index).css('font-weight', 'bold');
	}
	
	tab.eq(0).click(function() {
		setTab(0);
	});
	
	tab.eq(1).click(function() {
		setTab(1);
	});
	
	tab.eq(2).click(function() {
		setTab(2);
	});
});