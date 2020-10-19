require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  describe 'ユーザー登録' do
    context 'ユーザーを新規作成した場合' do
      it '「アカウント登録が完了しました。」と表示される' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'テスト１'
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: 'test01'
        fill_in 'user_password_confirmation', with: 'test01'
        click_on 'commit'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
    context 'ユーザがログインせずチーム登録画面に飛ぼうとしたとき' do
      it 'ログイン画面に遷移する' do
        visit new_team_path
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end
  describe 'セッション機能' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@example.com'
      fill_in 'user[password]', with: 'test01'
      click_on 'commit'
    end
    context '登録したユーザーでログインした場合' do
      it 'ログインできること' do
        expect(page).to have_content 'ログインしました。'
      end
    end
    context '登録したユーザーでログインしている時' do
      it '自分の詳細ページに飛べること' do
        visit user_path(@user.id)
        expect(page).to have_content 'test1名前'
      end
    end
    context 'ログインしている時' do
      it 'ログアウトできること' do
        click_on 'ログアウト'
        expect(current_path).to eq new_user_session_path
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end
end
