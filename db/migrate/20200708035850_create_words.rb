class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string  :user_id,      null: false # 投稿したユーザID
      t.string  :name,         null: false # 単語名
      t.string  :english_name, null: false # 英語名
      t.text    :description,  null: false # 説明文
      t.boolean :is_published, null: false # 公開中か下書きか判断するカラム
      t.timestamps
    end
    add_foreign_key :words, :users
    add_index  :words, :user_id
    add_index  :words, :name, unique: true
  end
end
