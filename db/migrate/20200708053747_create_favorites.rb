class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :word_id, null: false
      t.string :user_id,  null: false
      t.timestamps
    end
    add_foreign_key :favorites, :users
    add_index  :favorites, :user_id
  end
end
