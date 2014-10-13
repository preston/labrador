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
//= require jquery-ui
//= require twitter/bootstrap
//= require_tree .





$(document).ready(function() {
	// alert('hi');
	
	// Tab hover animations.
	$('#tabs li a').hover(function(eventObject) {
		// console.log("Hovering " + this);
		$(this).animate({
		   paddingLeft : '+=8',
		   paddingRight : '+=8'
		 }, {queue : false, duration : 'fast'}, function() {
		   // Animation complete.
		 });
	}, function(eventObject) {
		$(this).animate({
		   paddingLeft : '-=8',
		   paddingRight : '-=8'
		 }, 200, function() {
		   // Animation complete.
		 });
	});
	
	// Button hover animations.
	$('.button').hover(function(eventObject) {
		// console.log("Hovering " + this);
		$(this).animate({
		   width : '+=4'
		 }, {queue : false, duration : 'fast'}, function() {
		   // Animation complete.
		 });
	}, function(eventObject) {
		$(this).animate({
			 width : '-=4' 
		 }, 200, function() {
		   // Animation complete.
		 });
	});
	
	// Content block highlighting.
	$('aside section').hover(function(eventObject) {
		console.log("Content block hover.");
		$(this).animate({
		   backgroundColor : '#dddddd'
		   // opacity : .9
		 }, {queue : false, duration : 'fast'}, function() {
		   // Animation complete.
		 });
	}, function(eventObject) {
		$(this).animate({
		   backgroundColor : '#f8f8f8'
		   // opacity : 1
		 }, 200, function() {
		   // Animation complete.
		 });
	});
	
});





// AJAX table row deletion.
function ajaxDeleteRow(id, element, url) {
	console.log('AJAX delete of ' + element.attr('id') + ' fired.');
	$.ajax({
	  url: url,
		type: 'DELETE',
    beforeSend      : function(request) { request.setRequestHeader("Accept", "text/javascript"); },
	  success: function(data, textStatus, jqXHR){
			console.log("Success! Removing element from UI.");
			// element.fadeOut('slow');
			// $('#experiment_<%= row.id %>').animate({height : '=0'}, 1000 function() {});
			element.effect('explode', {}, 500, function() {
				element.remove();
			});
	  },
	  error: function(jqXHR, textStatus, errorThrown){
			var msg = "The server refused to delete the record. Are you still online and logged in?"
			console.log(msg);
			alert(msg);
		}
	});
	return false;
}
