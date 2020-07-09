class CreateCommitments < ActiveRecord::Migration[6.0]
  def change
    create_table :commitments do |t|
      t.string :regularity
      t.integer :challenge_id
      t.integer :user_id
    end
  end
end
