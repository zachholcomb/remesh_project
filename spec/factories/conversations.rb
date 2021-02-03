FactoryBot.define do
  factory :conversation do
    title { Faker::Hipster.sentence }
    start_date { Date.today }
  end
end
