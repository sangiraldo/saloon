require 'faker'

FactoryBot.define do
  factory :user do
    full_name "Santiago"
    sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    password "santiago123456"
    cellphone "3014842209"
    address "Calle 88"
    gender "male"
    is_admin true
  end
end
