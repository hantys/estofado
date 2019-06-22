# frozen_string_literal: true

class Payment < ApplicationRecord
  enum status: { active: 0, finish: 1 }
  belongs_to :user
  belongs_to :order

  validates :value, numericality: { greater_than: 0 }
  validates_presence_of(:value)
  validates_presence_of(:payday)
  validates_presence_of(:user_id)

  after_save :update_values_order
  before_destroy :delete_values_order

  private

  def update_values_order
    o = Order.find order_id
    if o.payments.count > 1
      o.paid = (o.cost - o.payments.sum(:value))
      o.status = if o.paid <= 0
                   4
                 else
                   3
                 end
      o.save
    end
  end

  def delete_values_order
    o = Order.find order_id
    o.paid = (o.cost - o.payments.sum(:value) + value)
    o.status = if o.paid <= 0
                 4
               else
                 3
               end
    o.save
  end
end
