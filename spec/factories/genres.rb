FactoryBot.define do
  factory :genre do
    genre       {Faker::Lorem.word}
    genre_info  {Faker::Lorem.paragraph}
  end
end
