class CreateLeanCanvases < ActiveRecord::Migration[5.2]
  def change
    create_table :lean_canvases do |t|
      t.json :board_texts
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
