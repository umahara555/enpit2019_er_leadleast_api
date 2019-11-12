class CreateProductBacklogs < ActiveRecord::Migration[5.2]
  def change
    create_table :product_backlogs do |t|
      t.json :board_texts

      t.timestamps
    end

    add_column :product_backlogs, :product_id, :string
    add_index :product_backlogs, :product_id
    add_foreign_key :product_backlogs, :products
  end
end
