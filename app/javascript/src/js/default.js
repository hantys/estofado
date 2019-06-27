import VMasker from 'vanilla-masker'
const vmaskerMoney = () => {
  const moneys = Array.from(document.querySelectorAll(".money"))

  if (moneys) {
    moneys.map(money => {
      VMasker(money).maskMoney({
        // Decimal precision -> "90"
        precision: 2,
        // Decimal separator -> ",90"
        separator: ',',
        // Number delimiter -> "12.345.678"
        delimiter: '.',
        // Money unit -> "R$ 12.345.678,90"
        unit: 'R$',
        // Force type only number instead decimal,
        // masking decimals with ",00"
        // Zero cents -> "R$ 1.234.567.890,00"
   
      })
    })
  }
}

$(function () {
  'use strict'

  $('[data-toggle="offcanvas"]').on('click', function () {
    $('.offcanvas-collapse').toggleClass('show')
  })
})


$("#alert").fadeTo(4000, 500).slideUp(500, function () {
  $("#alert").slideUp(500);
});

$('#show_object').on('show.bs.modal', function (event) {
  const button = $(event.relatedTarget)
  const link = button.data('link'), modal = $(this)

  return $.get(link, {
    modal: 'true'
  }, (function (data) {
    return modal.find('.modal-body').html(data);
  }), 'html').done(function () { }).fail(function () {
    return modal.find('.modal-body').html("<div class='alert alert-danger text-center'>Ocorreu algum problema! Tente Novamente</div>");
  });
});

$('#form_object').on('show.bs.modal', function (event) {
  const button = $(event.relatedTarget)
  const link = button.data('link'), modal = $(this)
  vmaskerMoney()
  return $.get(link, {
    modal: 'true'
  }, (function (data) {
    return modal.find('.modal-body').html(data);
  }), 'html').done(function () {
    vmaskerMoney()
  }).fail(function () {
    return modal.find('.modal-body').html("<div class='alert alert-danger text-center'>Ocorreu algum problema! Tente Novamente</div>");
  });
});