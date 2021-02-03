FactoryBot.define do
  factory :thought do
    message
    text { Faker::TvShows::SiliconValley.quote }
  end
end
