require 'rails_helper'
RSpec.describe 'メッセージ機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user2) }
  let!(:team) { FactoryBot.create(:team, user: user) }
  let!(:invite) { FactoryBot.create(:invite,match_day: '2021-12-20 15:00:00', team: team, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test2@example.com'
    fill_in 'user[password]', with: 'test02'
    click_on 'commit'
  end
  describe 'メッセージ送信機能' do
    context 'メッセージを新規で送信した場合' do
      it '送信したメッセージがメッセージ一覧画面に表示される' do
        conversation = FactoryBot.create(:conversation, sender_id: user.id, recipient_id: user2.id)
        visit conversation_messages_path(conversation)
        fill_in 'message[body]', with: 'メッセージ内容'
        click_on 'メッセージを送る'
        expect(page).not_to have_field 'message[body]', with: 'メッセージ内容'
        expect(page).to have_content 'メッセージ内容'
      end
    end
  end
  describe 'メッセージ画面へのページ遷移' do
    before do
      FactoryBot.create(:conversation, sender_id: user.id, recipient_id: user2.id)
    end
    context '募集詳細画面のメッセージボタンを押した場合' do
      it '該当ユーザーとのメッセージ一覧画面が表示される' do
        visit invite_path(Invite.last.id)
        click_on 'メッセージ'
        expect(current_path).to eq conversation_messages_path(Conversation.last.id)
      end
    end
    context '会話一覧画面のメッセージボタンを押した場合' do
      it '該当ユーザーとのメッセージ一覧画面が表示される' do
        FactoryBot.create(:message, conversation: Conversation.last, user: user2 )
        visit user_path(User.last.id)
        click_on 'メッセージ'
        click_on 'test1名前'
        click_on 'メッセージ'
        expect(current_path).to eq conversation_messages_path(Conversation.last.id)
      end
    end
  end
end
