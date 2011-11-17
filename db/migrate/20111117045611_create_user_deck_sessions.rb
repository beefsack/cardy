class CreateUserDeckSessions < ActiveRecord::Migration
  def change
    create_table :user_deck_sessions do |t|
      t.integer :user_id
      t.integer :deck_id
      t.datetime :finished_at

      t.timestamps
    end
  end
end
