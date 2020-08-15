require 'rails_helper'

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
