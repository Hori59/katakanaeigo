class Tag < ApplicationRecord
  has_many :tag_maps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :words, through: :tag_maps
  accepts_nested_attributes_for :tag_maps # タグが保存された時タグマップも更新される
end
