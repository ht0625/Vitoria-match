require 'rails_helper'

RSpec.describe Feature, type: :model do
  it "特徴ラベルがあれば登録できること" do
  feature = Feature.new(label: '特徴１')
    expect(feature).to be_valid
  end
  it "特徴ラベルがなければ登録できないこと" do
  feature = Feature.new(label: nil)
    expect(feature).not_to be_valid
  end
  it "特徴ラベルが10文字であれば登録できること" do
  feature = Feature.new(label: 'A' * 10)
    expect(feature).to be_valid
  end
  it "特徴ラベルが11文字以上であれば登録できないこと" do
  feature = Feature.new(label: 'A' * 11)
    expect(feature).not_to be_valid
  end
end
