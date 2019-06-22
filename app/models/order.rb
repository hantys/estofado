# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: { in_production: 0, pending: 1,delivered: 2 , ok: 3 }

  belongs_to :user
  belongs_to :client
  belongs_to :product

  has_many :payments

  validates_presence_of(:user_id)
  validates_presence_of(:product_id)
  validates_presence_of(:client_id)
  validates_presence_of(:cost)
  validates :cost, numericality: { greater_than: 0 }
end
