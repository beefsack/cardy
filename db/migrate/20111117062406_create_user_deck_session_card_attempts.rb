class CreateUserDeckSessionCardAttempts < ActiveRecord::Migration
  def change
    create_table :user_deck_session_card_attempts do |t|
      t.integer :user_deck_session_card_id
      t.integer :card_id
      t.integer :confidence

      t.timestamps
    end
  end
end
