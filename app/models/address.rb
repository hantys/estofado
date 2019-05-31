# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :city
  belongs_to :state
  belongs_to :addressable, polymorphic: true
end
