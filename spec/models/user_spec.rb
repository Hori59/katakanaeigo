require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザモデルのバリデーション" do
    let (:user) { build(:user) }
    subject { test_user.valid? }
    context "idカラム" do
      let(:test_user) { user }
      it "空欄であれば無効であること" do
        test_user.id = ""
        is_expected.to eq false;
      end
      it "1文字以上であれば有効であること" do
        test_user.id = "1"
        is_expected.to eq true;
      end
      it "15文字以下であれば有効であること" do
        test_user.id = "123456789012345"
        is_expected.to eq true;
      end
      it "16文字以上であれば無効であること" do
        test_user.id = "1234567890123456"
        is_expected.to eq false;
      end
    end

    context "nameカラム" do
      let(:test_user) { user }
      it "空欄であれば無効であること" do
        test_user.name = ""
        is_expected.to eq false;
      end
    end
    it "emailがなければ無効であること"
    it "emailが重複していれば無効であること"
    it "passwordがなければ無効であること"
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
