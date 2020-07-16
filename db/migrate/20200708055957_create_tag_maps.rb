class CreateTagMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_maps do |t|
      t.integer :word_id, null: false
      t.integer :tag_id,  null: false

      t.timestamps
    end
    add_index :tag_maps, :word_id
    add_index :tag_maps, :tag_id
    add_index :tag_maps, [:word_id, :tag_id], unique: true
  end
end
