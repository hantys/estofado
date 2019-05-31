# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    addressable { '' }
    cep { 'MyString' }
    street { 'MyString' }
    number { 'MyString' }
    city { nil }
    state { nil }
  end
end
