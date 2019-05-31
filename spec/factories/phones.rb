# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    phoneable { '' }
    number { 'MyString' }
  end
end
