class ChangePrimaryKeyToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :lean_canvases, :products
    remove_index :lean_canvases, :product_id
    remove_reference :lean_canvases, :product
    remove_column :products, :product_id
    execute "ALTER TABLE products ALTER COLUMN id TYPE character varying;"
    add_column :lean_canvases, :product_id, :string
    add_index :lean_canvases, :product_id
    add_foreign_key :lean_canvases, :products
  end
end
