features = ["ポゼッション", "フィジカル", "スタミナ"]
features.each do |feature|
  Feature.create!(
    label: feature
  )
end

10.times do |n|
  name = Faker::Sports::Football.player
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end


users = User.all
users.each do |user|
  name = Faker::Sports::Football.team
  Team.create!(
    name: name,
    user_id:  user.id
  )
  FeatureTeam.create!(
    team_id:  Team.last.id,
    feature_id:  Feature.last.id
  )
end

users.each do |user|
  place = Faker::Address.city
  Invite.create!(
    match_day: '2020-12-31 15:00:00',
    place:  place,
    detail:  "こんにちは。詳細はメッセージでお願いします。",
    user_id: user.id,
    team_id: user.teams.last.id
  )
end

feature_id = Feature.last.id - 1
users.each do |user|
  name = Faker::Sports::Football.team
  Team.create!(
    name: name,
    user_id:  user.id
  )
  FeatureTeam.create!(
    team_id:  Team.last.id,
    feature_id:  feature_id
  )
end

users.each do |user|
  place = Faker::Address.city
  Invite.create!(
    match_day: '2021-12-20 15:00:00',
    place:  place,
    detail:  "こんにちは。詳細はメッセージでお願いします。",
    user_id: user.id,
    team_id: user.teams.last.id
  )
end
