class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid # 論理削除
  attachment :profile_image
  has_many :words,     dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_words, through: :favorites, source: :word

  # 新規登録時のバリデーション
  validates :id, presence: true, length: { in: 1..15 }, uniqueness: true
  validates :name, presence: true
  validates :self_introduction, length: { maximum: 200 }

  def self.user_destroy
    time = Time.current
    users = User.User.only_deleted # 論理削除済のユーザのみ取得
    users.each do |user|
      # もしユーザ退会後１週間以上経過していたらパッチ処理で完全削除
      if ( time - user.deleted_at ) > 1.weeks
        user.really_destroy!
      end
    end
  end
end
