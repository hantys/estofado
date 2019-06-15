# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :orders

  validates_presence_of(:name)
end
