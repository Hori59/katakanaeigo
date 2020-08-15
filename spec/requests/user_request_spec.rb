require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "ユーザ新規登録" do
    before do
      get new_user_registration_path
    end
    context "新規登録ページが正しく表示される" do
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq(200)
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ユーザ新規登録")
      end
    context "新規登録"
      it '新規登録に成功する' do
        within('form#new_user') do
          fill_in 'user[id]', with: Faker::Internet.username(specifier: 5)
          fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
          fill_in 'user[email]', with: Faker::Internet.email
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button '登録'
        end
        expect(page).not_to have_css('form#new_user')
      end
    end

  end
  describe "ログインページ"
  describe "マイページ"
  describe "編集ページ"
  describe ""
end
