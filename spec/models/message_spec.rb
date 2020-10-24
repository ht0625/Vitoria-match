require 'rails_helper'

RSpec.describe Message, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:conversation) { FactoryBot.create(:conversation, sender_id: user.id, recipient_id: user2.id) }
  it "メッセージ内容が入力されている場合に登録できること" do
  message = Message.new(body: "テスト", user: user, conversation: conversation)
    expect(message).to be_valid
  end
  it "メッセージ内容が入力されていない場合に登録できないこと" do
  message = Message.new(body: "", user: user, conversation: conversation)
    expect(message).not_to be_valid
  end
  it "新規でメッセージが登録される場合に既読カラムの値にはfalseが登録されること" do
  message = Message.new(body: "テスト", user: user, conversation: conversation)
    expect(message.read).to eq false
  end
end
