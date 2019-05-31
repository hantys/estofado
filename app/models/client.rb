# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :addresses, as: :addressable
  has_many :phones, as: :phoneable
  has_many :orders

  validates_presence_of(:name)
end
