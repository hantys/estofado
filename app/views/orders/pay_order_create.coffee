<% if @payment.errors.present? %>
  $(".modal-body").find(".new_form_remote").html("<%= escape_javascript(render 'pay_order') %>")
<% else %>
  # Create a DOM Option and pre-select by default
  $("#order-item-<%= @order.id %>").html("<%= escape_javascript(render 'order_item', order: @order) %>")
  $(".modal-body").find(".new_form_remote").html("<div class='alert alert-success text-center'>Conta Paga com sucesso!</div>")
  window.setTimeout (->
    $('#form_object').modal('hide')
  ), 2000
<% end %>
