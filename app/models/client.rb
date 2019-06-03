# frozen_string_literal: true

class Client < ApplicationRecord
  enum status: { active: 0, finish: 1 }
  paginates_per 5
  has_one :address, as: :addressable
  has_many :phones, as: :phoneable
  has_many :orders

  validates_presence_of(:name)
end
