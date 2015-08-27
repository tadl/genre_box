// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function update_genre(record_id){
	var selected = '';
	var target_div = '#record_' + record_id + ' input:checked'
	$(target_div).each(function() {
    	selected = selected + $(this).attr('value') + ',';
	});
	target_url = "update_genre?genres=" + selected + '&record_id=' + record_id
	$.ajax({
    	url: target_url,
    	contentType: 'application/json; charset=utf-8',
    	dataType: 'json',
    	type: 'POST',
    	success: function(data) {
    		if(data.message == 'success'){
    			Turbolinks.visit(document.URl)
    		}else{
    			alert(data.message)
    		}
    	}	 
  	});  
}