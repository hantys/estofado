# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    note { 'MyText' }
    status { 1 }
  end
end
