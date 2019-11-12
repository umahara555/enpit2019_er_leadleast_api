class CreateUserStoryMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_story_maps do |t|
      t.json :board_texts

      t.timestamps
    end

    add_column :user_story_maps, :product_id, :string
    add_index :user_story_maps, :product_id
    add_foreign_key :user_story_maps, :products
  end
end
