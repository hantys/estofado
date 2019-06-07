# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :phoneable, polymorphic: true
  validates_presence_of(:number)
end
