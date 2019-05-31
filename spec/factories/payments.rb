# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    user { nil }
    order { nil }
    value { 1.5 }
    payday { '2019-05-31' }
    status { 1 }
    note { 'MyText' }
  end
end
