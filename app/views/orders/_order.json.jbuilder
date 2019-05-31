# frozen_string_literal: true

json.extract! order, :id, :user_id, :client_id, :product_id, :cost, :paid, :payday, :status, :note, :created_at, :updated_at
json.url order_url(order, format: :json)
