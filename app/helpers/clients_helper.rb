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

    bootstrap_status(status, text)
  end

  private

  # rubocop:disable Metrics/CyclomaticComplexity
  def bootstrap_status(status, text)
    case status
    when 'waiting'
      "<span class='badge badge-warning' style='font-size:14px;'>#{text}</span>".html_safe
    when 'confirm'
      "<span class='badge badge-info' style='font-size:14px;'>#{text}</span>".html_safe
    when 'rejected'
      "<span class='badge badge-danger' style='font-size:14px;'>#{text}</span>".html_safe
    when 'authorized'
      "<span class='badge badge-success' style='font-size:14px;'>#{text}</span>".html_safe
    when 'billed'
      "<span class='badge badge-primary' style='font-size:14px;'>#{text}</span>".html_safe
    when 'delivered'
      "<span class='badge badge-dark' style='font-size:14px;'>#{text}</span>".html_safe
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
