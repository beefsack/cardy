// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require json2.js
//= require jquery-1.7.js
//= require jquery.mobile-1.0rc3.js
//= require_tree .

function toast(message, options) {
	if (options === undefined) options = {};
	if (options.parent === undefined) {
		if (options.force_page) options.parent = $('[data-role="page"]').last();
		else options.parent = $('[data-role="page"], [data-role="dialog"]').last();
	}
	if (options.delay === undefined) options.delay = 1600;
	$( "<div class='ui-loader ui-overlay-shadow ui-body-e ui-corner-all'><h1>"+ message +"</h1></div>" )
		.css({ "display": "block", "opacity": 0.96, "top": $(window).scrollTop() + 100 })
		.appendTo( options.parent )
		.delay( options.delay )
		.fadeOut( 400, function() {
			$( this ).remove();
		});	
}
