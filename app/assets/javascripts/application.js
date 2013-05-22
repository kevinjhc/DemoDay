// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(document).foundation();


$('.follow').on('click', function(e) {
  e.preventDefault();

  var self = $(this);
  var angellist_id = self.data('angellist_id');
  var startup_id = self.data('startup_id');

  self.html('Loading...');

  $.ajax({
    url: '/angellist_follows?angellist_id=' + angellist_id,
    data: { startup_id: startup_id },
    type: 'POST'
  }).done(function() {
    self.html('Following');
    self.removeClass('follow');
    self.addClass('following');
  });

});

$('.email-ceo').on('click', function(e) {
  e.preventDefault();

  var self = $(this);
  var startup_id = self.data('startup_id');

  self.html('Loading...');

  $.ajax({
    url: '/email_contacts?id=' + startup_id,
    data: { startup_id: startup_id },
    type: 'POST'
  }).done(function() {
    self.html('Contacted');
    self.removeClass('follow');
    self.addClass('following');
  });

});
