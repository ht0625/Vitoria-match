features = ["ポゼッション", "フィジカル", "スタミナ"]
features.each do |feature|
  Feature.create!(
    label: feature
  )
end

5.times do |n|
  name = Faker::Sports::Football.player
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
  2.times do |n|
    name = Faker::Sports::Football.team
    Team.create!(
      name: name,
      user_id:  User.last.id
    )
    FeatureTeam.create!(
      team_id:  Team.last.id,
      feature_id:  Feature.last.id
    )
  end
  place = Faker::Address.city
  Invite.create!(
    match_day: '2020-12-20 15:00:00',
    place:  place,
    detail:  "1#{n}人参加予定です。詳細は連絡でお願いします。",
    user_id: User.last.id,
    team_id: Team.last.id
  )
end
