class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :word_id, null: false
      t.string  :user_id, null: false
      t.text    :body,    null: false
      t.timestamps
    end
    add_foreign_key :comments, :users
    add_index  :comments, :user_id
  end
end
