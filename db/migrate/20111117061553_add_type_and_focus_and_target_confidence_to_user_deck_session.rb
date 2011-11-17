class AddTypeAndFocusAndTargetConfidenceToUserDeckSession < ActiveRecord::Migration
  def change
    add_column :user_deck_sessions, :type, :string
    add_column :user_deck_sessions, :focus, :integer
    add_column :user_deck_sessions, :target_confidence, :integer
  end
end
