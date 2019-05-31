# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :product

  has_many :payments
end
