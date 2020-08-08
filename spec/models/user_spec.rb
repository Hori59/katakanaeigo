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

    context "名前" do
      it "名前がなければエラーメッセージが表示されること" do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors).to be_added(:name, :blank)
      end
    end

    context "メールアドレス" do
      it "メールアドレスがなければエラーメッセージが表示されること" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors).to be_added(:email, :blank)
      end
      it "メールアドレスが重複していればエラーメッセージが表示されること" do
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

    context "パスワード" do
      it "パスワードがなければエラーメッセージが表示されること" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors).to be_added(:password, :blank)
      end
    end

  end

  describe "ログイン時のバリデーション" do
    context "idもしくはメールアドレスとパスワードがあれば有効な状態であること"
    context "idもしくはメールアドレスがなければエラーメッセージが表示されること"
    context "パスワードがなければエラーメッセージが表示されること"
  end

end
