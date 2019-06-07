# frozen_string_literal: true

class Order < ApplicationRecord
  enum status: { active: 0, finish: 1 }
  belongs_to :user
  belongs_to :client
  belongs_to :product

  has_many :payments
end
