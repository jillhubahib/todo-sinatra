//= require jquery3
//= require popper
//= require bootstrap-sprockets

$('#logout').click(function() {
	$.ajax({
		method: "DELETE",
		url: '/sessions'
	})
		.done(function( msg ) {
			window.location = "/sessions/new";
		});
});