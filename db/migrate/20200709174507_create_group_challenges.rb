class CreateGroupChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :group_challenges do |t|
      t.integer :group_id
      t.integer :challenge_id
    end
  end
end
