const error_cep = () => {
  $('.cep').removeClass('is-valid');
  $('.cep').parent().removeClass('is-valid');
  $('.cep').addClass('is-invalid');
  $('.cep').parent().addClass('is-invalid');
  return $('.cep').after('<small class="error_cep invalid-feedback">CEP não encontrado</small></div>');
};


const clear_cep = () => {
  $('.cep').removeClass('is-invalid');
  $('.cep').parent().removeClass('is-invalid');
  return $('.error_cep').remove();
};

const get_cep = () => {
  return $('.cep').keyup(function() {
    if ($(this).val().length === 9) {
      clear_cep();
      return $.get("/busca/endereco/" + $(this).val(), function(data) {
        let city, i, len, ref;
        clear_cep();
        if (data !== 0) {
          $('.district').val(data.bairro);
          $('.street').val(data.street);
          $('.state').val(data.state);
          $('.city').html('');
          $('.city').append("<option value=\"\">Cidade</option>");
          ref = data.cities;
          for (i = 0, len = ref.length; i < len; i++) {
            city = ref[i];
            $('.city').append("<option value='" + city.id + "'>" + city.name + "</option>");
          }
          $('.city').val(data.city);
        } else {
          error_cep;
        }
        return clear_cep();
      }).fail(function() {
        if ($('.error_cep').length < 1) {
          return error_cep();
        }
      });
    }
  });
};

if ($('.cep').length > 0) {
  get_cep();
}

if ($('.state').length > 0) {
  $('.state').change(function() {
    return $.get("/busca/cidades/" + ($(this).val()), function(data) {
      var city, i, len;
      $('.city').html('');
      $('.city').append("<option value=\"\">Cidade</option>");
      for (i = 0, len = data.length; i < len; i++) {
        city = data[i];
        $('.city').append("<option value='" + city.id + "'>" + city.name + "</option>");
      }
      return $('.city').val(data.city);
    }).done(function() {
      return console.log('second success');
    }).fail(function() {
      return console.log('error');
    }).always(function() {
      return console.log('finished');
    });
  });
}
