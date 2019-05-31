# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user { nil }
    client { nil }
    product { nil }
    cost { 1.5 }
    paid { 1.5 }
    payday { '2019-05-31' }
    status { 1 }
    note { 'MyText' }
  end
end
