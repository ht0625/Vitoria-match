FactoryBot.define do
  factory :user do
    name { 'test1名前' }
    email { 'test1@example.com' }
    password { 'test01' }
    password_confirmation { 'test01' }
  end
end
