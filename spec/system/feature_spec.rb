require 'rails_helper'
RSpec.describe '特徴ラベル機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:feature) { FactoryBot.create(:feature) }
  let!(:feature2) { FactoryBot.create(:feature2) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test1@example.com'
    fill_in 'user[password]', with: 'test01'
    click_on 'sign_in'
  end
  describe '特徴ラベル登録機能' do
    context 'チームを新規登録するとき' do
      it 'チームと一緒に特徴ラベルを登録できる' do
        visit new_team_path
        fill_in 'team_name', with: 'team1名前'
        check 'ポゼッション'
        click_on '登録'
        expect(page).to have_content 'team1名前'
        expect(page).to have_content '登録しました'
        expect(page).to have_content 'ポゼッション'
      end
    end
    context 'チームを新規登録するとき' do
      it 'チームと一緒に複数の特徴ラベルを登録できる' do
        visit new_team_path
        fill_in 'team_name', with: 'team1名前'
        check 'ポゼッション'
        check 'フィジカル'
        click_on '登録'
        expect(page).to have_content 'team1名前'
        expect(page).to have_content '登録しました'
        expect(page).to have_content 'ポゼッション'
        expect(page).to have_content 'フィジカル'
      end
    end
  end
end
