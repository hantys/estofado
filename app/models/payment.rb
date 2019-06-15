# frozen_string_literal: true

class Payment < ApplicationRecord
  enum status: { active: 0, finish: 1 }
  belongs_to :user
  belongs_to :order

  validates :value, numericality: { greater_than: 0 }
  validates_presence_of(:value)
  validates_presence_of(:payday)
  validates_presence_of(:user_id)
  validates_presence_of(:order_id)
end
