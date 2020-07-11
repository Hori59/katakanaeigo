class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :words,     dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :favorites, dependent: :destroy

  #新規登録時のバリデーション
  validates :id, presence: true, length: { in: 1..15 }
  validates :name, presence: true

end
