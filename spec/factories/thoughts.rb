FactoryBot.define do
  factory :thoughts do
    text { Faker::Hipster.paragraph }
  end
end
