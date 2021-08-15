FactoryBot.define do
  factory :article do
    title           {Faker::Lorem.word}
    article         {Faker::Lorem.sentence}
    reference_info  {Faker::Internet.url}
  end
end
