require 'rails_helper'

RSpec.describe FeatureTeam, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:team) { FactoryBot.create(:team, user: user) }
  let!(:feature) { FactoryBot.create(:feature) }
  it "存在するチームと特徴を紐付けて登録できること" do
  feature_team = FeatureTeam.new(team: team, feature: feature)
    expect(feature_team).to be_valid
  end
end
