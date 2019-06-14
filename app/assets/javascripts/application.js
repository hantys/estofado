// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require select2/dist/js/select2
//= require select2/dist/js/i18n/pt-BR
//= require air-datepicker/dist/js/datepicker.min
//= require air-datepicker/dist/js/i18n/datepicker.pt-BR
//= require_tree .

$(document).ready(function(){
  $('.select2').select2({
    theme: 'bootstrap4',
    allowClear: true
  });

  $('.calendar').datepicker({language: 'pt-BR'})
})