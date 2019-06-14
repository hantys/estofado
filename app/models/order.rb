# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: { active: 0, finish: 1 }
  belongs_to :user
  belongs_to :client
  belongs_to :product

  has_many :payments
  validates_presence_of(:user_id)
  validates_presence_of(:product_id)
  validates_presence_of(:client_id)
  validates_presence_of(:cost)
end
