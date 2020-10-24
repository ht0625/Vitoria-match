require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、Email、パスワードに正しい入力があれば登録できること" do
  user = User.new(name: 'Aチーム', email: 'test1@example.com', password: 'test01', password_confirmation: 'test01')
    expect(user).to be_valid
  end
  it "名前の入力がなければ登録できないこと" do
  user = User.new(email: 'test1@example.com', password: 'test01', password_confirmation: 'test01')
    expect(user).not_to be_valid
  end
  it "Emailの入力がなければ登録できないこと" do
  user = User.new(name: 'Aチーム', password: 'test01', password_confirmation: 'test01')
    expect(user).not_to be_valid
  end
  it "パスワードの入力がなければ登録できないこと" do
  user = User.new(name: 'Aチーム', email: 'test1@example.com')
    expect(user).not_to be_valid
  end
  it "パスワード入力が５文字の場合登録できないこと" do
  user = User.new(name: 'Aチーム', email: 'test1@example.com', password: 'test1', password_confirmation: 'test1')
    expect(user).not_to be_valid
  end
  it "パスワード入力が６文字の場合登録できること" do
  user = User.new(name: 'Aチーム', password: 'test01', password_confirmation: 'test01')
    expect(user).not_to be_valid
  end
end
