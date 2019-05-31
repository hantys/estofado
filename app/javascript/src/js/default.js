$(function () {
  'use strict'

  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('open')
  })
})


$("#alert").fadeTo(4000, 500).slideUp(500, function(){
  $("#alert").slideUp(500);
});