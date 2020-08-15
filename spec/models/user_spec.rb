require 'rails_helper'


RSpec.describe User, type: :model do
  describe "新規登録時のバリデーション" do

    context "id" do
      it "id、名前、メールアドレス、パスワードがあれば有効な状態であること" do
        user = build(:user)
        expect(user).to be_valid
      end
      it "idがなければエラーメッセージが表示されること" do
        user = build(:user, id: "")
        user.valid?
        expect(user.errors).to be_added(:id, :blank)
      end
    end

    context "name" do
      it "nameがなければエラーメッセージが表示されること" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors).to be_added(:name, :blank)
      end
    end

    context "email" do
      it "emailがなければエラーメッセージが表示されること" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors).to be_added(:email, :blank)
      end
      it "emailが重複していればエラーメッセージが表示されること" do
        user1 = create(:user,
          id:       "test100",
          name:     "テストアカウント100",
          email:    "test@example.com",
          password: "password",
        )
        user2 = build(:user,
          id:       "test101",
          name:     "テストアカウント101",
          email:    "test@example.com",
          password: "password",
        )
        user2.valid?
        expect(user2.errors).to be_added(:email, :taken, value: "test@example.com")
      end
    end

    context "password" do
      it "passwordがなければエラーメッセージが表示されること" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors).to be_added(:password, :blank)
      end
    end

  end
end
