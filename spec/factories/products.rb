# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'MyString' }
    note { 'MyText' }
    status { 1 }
  end
end
