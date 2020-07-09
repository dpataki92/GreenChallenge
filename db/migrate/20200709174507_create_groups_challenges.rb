class CreateGroupsChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_challenges do |t|
      t.integer :group_id
      t.integer :challenge_id
    end
  end
end
