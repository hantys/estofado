# frozen_string_literal: true

module OrdersHelper
  def label_status_order(order)
    # waiting: 0, rejected: 1, authorized: 2, billed: 3, delivered: 4
    # order.status_i18n
    status = if order.class == String
               order
             else
               order.status
             end

    text = t "enums.order.status.#{status}"
    case status
    when 'in_production'
      "<span class='badge badge-pill badge-info'>#{text}</span>".html_safe
    when 'delivered'
      "<span class='badge badge-pill badge-dark'>#{text}</span>".html_safe
    when 'pending'
      "<span class='badge badge-pill badge-danger'>#{text}</span>".html_safe
    when 'ok'
      "<span class='badge badge-pill badge-success'>#{text}</span>".html_safe
    when 'paid'
      "<span class='badge badge-pill badge-primary'>#{text}</span>".html_safe
    end
  end
end
