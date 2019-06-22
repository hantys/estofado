# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user_id { rand(1..2) }
    client_id { rand(1..20) }
    product_id { rand(1..10) }
    cost { 1.5 }
    paid { 1.5 }
    payday { Date.today + (rand(1..6)).day }
    status { rand(0..4) }
    note { 'MyText' }
  end
end
