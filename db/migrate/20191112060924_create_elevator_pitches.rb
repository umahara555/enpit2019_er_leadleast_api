class CreateElevatorPitches < ActiveRecord::Migration[5.2]
  def change
    create_table :elevator_pitches do |t|
      t.json :board_texts

      t.timestamps
    end

    add_column :elevator_pitches, :product_id, :string
    add_index :elevator_pitches, :product_id
    add_foreign_key :elevator_pitches, :products
  end
end
