require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  it "テーブルに存在しない送信者と受信者の組み合わせの場合に登録できること" do
  conversation = Conversation.new(sender: user, recipient: user2)
    expect(conversation).to be_valid
  end
end
