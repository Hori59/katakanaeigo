require 'rails_helper'

# ログイン・ログアウト関連
## ログイン
RSpec.describe "Users", type: :request do
  describe 'ログインページ' do
    context "ログインページが正しく表示される" do
      before do
        get new_user_session_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("ログイン")
      end
    end
  end
end

# 投稿機能関連
## 新規投稿
RSpec.describe "Words", type: :request do
  describe '新規投稿ページ' do
    context "新規投稿ページが正しく表示される" do
      before do
        get new_word_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("投稿")
      end
    end
  end
end