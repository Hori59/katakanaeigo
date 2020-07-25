class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments # foreign_keyを使ったので念のためオブジェクトの不整合が起きないように記述
  belongs_to :word

  # コメントのバリデーション
  validates :body, :presence => {:message => 'コメントを入力してください'}
end
