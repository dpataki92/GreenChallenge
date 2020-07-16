class CreateChallengesGroups < ActiveRecord::Migration[6.0]
  def change
    create_join_table :challenges, :groups
  end
end
