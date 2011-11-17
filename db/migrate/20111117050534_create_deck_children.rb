class CreateDeckChildren < ActiveRecord::Migration
  def change
    create_table :deck_children do |t|
      t.integer :deck_id
      t.integer :parent_deck_id

      t.timestamps
    end
  end
end
