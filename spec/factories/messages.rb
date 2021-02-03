FactoryBot.define do
  factory :message do
    conversation
    text { Faker::Hipster.paragraph}
  end
end
