# frozen_string_literal: true

class Phone < ApplicationRecord
  belongs_to :phoneable, polymorphic: true
end
