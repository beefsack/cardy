class CreateUserDeckSessionCards < ActiveRecord::Migration
  def change
    create_table :user_deck_session_cards do |t|
      t.integer :user_deck_session_id
      t.integer :card_id
      t.integer :confidence
      t.datetime :last_attempted_at

      t.timestamps
    end
  end
end
