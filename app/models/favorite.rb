class Favorite < ApplicationRecord
  belongs_to :user, inverse_of: :words # foreign_keyを使ったので念のためオブジェクトの不整合が起きないように記述
  belongs_to :word
end
