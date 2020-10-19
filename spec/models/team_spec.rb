require 'rails_helper'

RSpec.describe Team, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  it "チームの名前があれば登録できること" do
  team = Team.new(name: 'Aチーム', user: user)
    expect(team).to be_valid
  end
  it "チームの名前がなければ登録できないこと" do
  team = Team.new(name: nil, user: user)
    expect(team).not_to be_valid
  end
  it "チームの名前が20文字であれば登録できること" do
  team = Team.new(name: 'A' * 20, user: user)
    expect(team).to be_valid
  end
  it "チームの名前が21文字以上であれば登録できないこと" do
  team = Team.new(name: 'A' * 21, user: user)
    expect(team).not_to be_valid
  end
end
