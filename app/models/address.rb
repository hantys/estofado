# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :addressable, polymorphic: true

  validates_presence_of(:cep)
  validates_presence_of(:state_id)
  validates_presence_of(:city_id)
end
