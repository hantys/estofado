$(function () {
  'use strict'

  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('show')
  })
})


$("#alert").fadeTo(4000, 500).slideUp(500, function(){
  $("#alert").slideUp(500);
});

$('#show_object').on('show.bs.modal', function(event) {
  var button, link, modal;
  button = $(event.relatedTarget);
  link = button.data('link');
  modal = $(this);
  return $.get(link, {
    modal: 'true'
  }, (function(data) {
    return modal.find('.modal-body').html(data);
  }), 'html').done(function() {}).fail(function() {
    return modal.find('.modal-body').html("<div class='alert alert-danger text-center'>Ocorreu algum problema! Tente Novamente</div>");
  });
});