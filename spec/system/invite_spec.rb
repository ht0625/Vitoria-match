require 'rails_helper'
RSpec.describe '募集管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:team) { FactoryBot.create(:team, user: user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test1@example.com'
    fill_in 'user[password]', with: 'test01'
    click_on 'commit'
  end
  describe '募集新規登録機能' do
    context '募集を新規登録した場合' do
      it '登録した募集が募集一覧画面に表示される' do
        visit new_invite_path
        choose('team1名前')
        fill_in 'invite[place]', with: '会場１'
        fill_in 'invite[detail]', with: '詳細１'
        click_on '登録'
        expect(page).to have_content 'team1名前'
        expect(page).to have_content '詳細１'
        expect(page).to have_content '募集を登録しました！'
      end
    end
  end
  describe '募集詳細画面表示機能' do
    context '募集詳細画面に遷移した場合' do
      it '登録した募集情報が詳細画面に表示される' do
        FactoryBot.create(:invite, place: '詳細画面の表示確認', user: user, team: team)
        visit invite_path(Invite.last.id)
        expect(page).to have_content '詳細画面の表示確認'
      end
    end
  end
  describe '募集編集機能' do
    context '募集情報を編集した場合' do
      it '編集した募集情報が募集詳細画面に表示される' do
        FactoryBot.create(:invite, detail: '編集前', user: user, team: team)
        visit edit_invite_path(Invite.last.id)
        fill_in 'invite[detail]', with: '編集後'
        click_on '登録'
        expect(page).to have_content '編集後'
      end
    end
  end
  describe 'チーム削除機能' do
    context 'チームを削除した場合' do
      it '削除したチームが存在しないこと' do
        FactoryBot.create(:invite, detail: '1つ目の登録', user: user, team: team)
        FactoryBot.create(:invite, detail: '2つ目の登録', user: user, team: team)
        visit edit_invite_path(Invite.last.id)
        page.accept_confirm do
          click_on '削除'
        end
        expect(page).to have_content '1つ目の登録'
        expect(Invite.last.detail).not_to eq '2つ目の登録'
      end
    end
  end
end
