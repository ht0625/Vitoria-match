require 'rails_helper'
RSpec.describe 'チーム管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test1@example.com'
    fill_in 'user[password]', with: 'test01'
    click_on 'commit'
  end
  describe 'チーム新規登録機能' do
    context 'チームを新規登録した場合' do
      it '登録したチームがチーム詳細画面に表示される' do
        visit new_team_path
        fill_in 'team_name', with: 'team1名前'
        click_on '登録'
        expect(page).to have_content 'team1名前'
      end
    end
  end
  describe 'チーム詳細画面表示機能' do
    context 'チーム詳細画面に遷移した場合' do
      it '登録したチームがチーム詳細画面に表示される' do
        FactoryBot.create(:team, user: user)
        visit team_path(Team.last.id)
        expect(page).to have_content 'team1名前'
      end
    end
  end
  describe 'チーム編集機能' do
    context 'チーム情報を編集した場合' do
      it '編集したチーム情報がチーム詳細画面に表示される' do
        FactoryBot.create(:team, user: user)
        visit edit_team_path(Team.last.id)
        fill_in 'team_name', with: '編集後名前'
        click_on '登録'
        expect(page).to have_content '編集後名前'
      end
    end
  end
  describe 'チーム削除機能' do
    context 'チームを削除した場合' do
      it '削除したチームが存在しないこと' do
        FactoryBot.create(:team, user: user)
        FactoryBot.create(:team2, user: user)
        visit edit_team_path(Team.last.id)
        page.accept_confirm do
          click_on '削除'
        end
        expect(Team.last.name).not_to eq 'team1名前'
      end
    end
  end
end
