# frozen_string_literal: true

module ClientsHelper
  def label_status_client(client)
    # waiting: 0, rejected: 1, authorized: 2, billed: 3, delivered: 4
    # client.status_i18n
    status = if client.class == String
               client
             else
               client.status
             end

    text = t "enums.client.status.#{status}"

    case status
    when 'normal'
      "<span class='badge badge-pill badge-info'>#{text}</span>".html_safe
    when 'pending'
      "<span class='badge badge-pill badge-danger'>#{text}</span>".html_safe
    when 'ok'
      "<span class='badge badge-pill badge-success'>#{text}</span>".html_safe
    end
  end
end
