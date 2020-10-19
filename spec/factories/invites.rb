FactoryBot.define do
  factory :invite do
    match_day { "2020-10-19 11:29:40" }
    place { "会場１" }
    detail { "詳細１" }
    status { true }
  end
end
