class AddGoalToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :goal, :integer
  end
end
