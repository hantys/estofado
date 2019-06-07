# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    cep { '23432432' }
    street { 'MyString' }
    number { 'MyString' }
    city_id { 12 }
    state_id { 17 }
  end
end
