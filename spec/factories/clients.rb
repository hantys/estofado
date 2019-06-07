# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::Name.name }
    cpf { '3453454554' }
    image { 'MyString' }
    after(:create) do |client|
      create(:phone, phoneable: client)
      create(:address, addressable: client)
    end
  end
end
