FactoryBot.define do
  factory :feature do
    label { "ポゼッション" }
  end
  factory :feature2, class: Feature do
    label { "フィジカル" }
  end
end
