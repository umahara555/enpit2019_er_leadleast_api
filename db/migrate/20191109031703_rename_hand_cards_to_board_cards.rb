class RenameHandCardsToBoardCards < ActiveRecord::Migration[5.2]
  def change
    rename_table :hand_cards, :board_cards
  end
end
