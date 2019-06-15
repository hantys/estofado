# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    user_id {  rand(1..2) }
    order_id { rand(1..15) }
    value { 1.5 }
    payday { Date.today + (rand(1..6)).day }
    status { rand(0..1) }
    note { 'MyText' }
  end
end
