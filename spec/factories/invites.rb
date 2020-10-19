FactoryBot.define do
  factory :invite do
    match_day { "2020-10-19 11:29:40" }
    place { "MyString" }
    detail { "MyText" }
    status { false }
    user { nil }
    team { nil }
  end
end
