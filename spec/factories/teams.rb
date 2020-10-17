FactoryBot.define do
  factory :team do
    name { 'team1名前' }
  end
  factory :team2, class: Team do
    name { 'team2名前' }
  end
end
