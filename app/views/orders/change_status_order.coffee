$("#order-item-<%= @order.id %>").html("<%= escape_javascript(render 'order_item', order: @order) %>")