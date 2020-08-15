require 'rails_helper'

RSpec.describe Word, type: :model do
  describe "新規投稿時のバリデーション" do

    context "user_id" do
      it "user_id、name、description、is_publishedがあれば有効な状態であること" do
        word = build(:word)
        expect(word).to be_valid
      end
      it "user_idがなければ無効であること" do
        word = build(:word, user_id: "")
        expect(word.valid?).to eq(false)
      end
    end

    context "name" do
      it "nameがなければエラーメッセージが表示されること" do
        word = build(:word, name: "")
        word.valid?
        expect(word.errors).to be_added(:name, :blank)
      end
    end

    context "description" do
      it "descriptionがなければエラーメッセージが表示されること" do
        word = build(:word, description: "")
        word.valid?
        expect(word.errors).to be_added(:description, :blank)
      end
    end

  end
end
