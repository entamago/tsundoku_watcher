FactoryBot.define do
  factory :user do
    nickname              {Faker::Lorem.characters(number: 10)}
    purpose               {Faker::Lorem.characters(number: 13)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end