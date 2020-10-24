require 'rails_helper'

RSpec.describe Invite, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:team) { FactoryBot.create(:team, user: user) }
  it "全ての必須入力項目が正しければ登録できること" do
  invite = Invite.new(match_day: '2021-12-20 15:00:00', user: user, team: team)
    expect(invite).to be_valid
  end
  it "30文字以内の会場項目が入力された時に登録できること" do
  invite = Invite.new(match_day: '2021-12-20 15:00:00', place: 'A' * 30, user: user, team: team)
    expect(invite).to be_valid
  end
  it "31文字以上の会場項目が入力された時に登録できないこと" do
  invite = Invite.new(match_day: '2021-12-20 15:00:00', place: 'A' * 31, user: user, team: team)
    expect(invite).not_to be_valid
  end
  it "400文字以内の会場項目が入力された時に登録できること" do
  invite = Invite.new(match_day: '2021-12-20 15:00:00', detail: 'A' * 400, user: user, team: team)
    expect(invite).to be_valid
  end
  it "401文字以上の会場項目が入力された時に登録できないこと" do
  invite = Invite.new(match_day: '2021-12-20 15:00:00', detail: 'A' * 401, user: user, team: team)
    expect(invite).not_to be_valid
  end
  it "未来の日時が入力されたときに登録できること" do
  date_time = DateTime.now + 1
  invite = Invite.new(match_day: date_time, user: user, team: team)
    expect(invite).to be_valid
  end
  it "過去の日時が入力されたときに登録できないこと" do
  date_time = DateTime.now - 1
  invite = Invite.new(match_day: date_time, user: user, team: team)
    expect(invite).not_to be_valid
  end
end
