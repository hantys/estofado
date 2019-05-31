# frozen_string_literal: true

json.extract! payment, :id, :user_id, :order_id, :value, :payday, :status, :note, :created_at, :updated_at
json.url payment_url(payment, format: :json)
