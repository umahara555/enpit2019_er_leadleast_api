class CreateHandCards < ActiveRecord::Migration[5.2]
  def change
    create_table :hand_cards do |t|
      t.string :text
    end
  end
end
