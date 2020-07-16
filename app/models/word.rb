class Word < ApplicationRecord
  belongs_to :user,      inverse_of: :words # foreign_keyを使ったので念のためオブジェクトの不整合が起きないように記述
  has_many   :comments,  dependent: :destroy
  has_many   :favorites, dependent: :destroy
  has_many   :tag_maps,  dependent: :destroy
  has_many   :tags,      through: :tag_maps

  # 投稿のバリデーション
  validates :name, presence: true
  validates :description, presence: true


  def favorited_by?(user) # 引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。存在していればtrue、存在していなければfalseを返す
    favorites.where(user_id: user.id).exists?
  end

  # tagsに値が入っているときはタグの更新処理を行う
  def save_tags(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # 古いタグを削除
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      word_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << word_tag
    end
  end
end