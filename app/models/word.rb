class Word < ApplicationRecord
  belongs_to :user,      inverse_of: :words # foreign_keyを使ったので念のためオブジェクトの不整合が起きないように記述
  has_many   :comments,  dependent: :destroy
  has_many   :favorites, dependent: :destroy
  has_many   :tag_maps,  dependent: :destroy
  has_many   :tags,      through: :tag_maps

  def favorited_by?(user) # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。存在していればtrue、存在していなければfalseを返す
    favorites.where(user_id: user.id).exists?
  end
end
