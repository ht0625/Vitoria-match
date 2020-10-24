FactoryBot.define do
  factory :message do
    body { "内容" }
    conversation { １ }
    user
    read { false }
  end
end
