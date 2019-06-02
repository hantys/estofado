# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    cpf { '3453454554' }
    image { 'MyString' }
    status { 1 }
  end
end
