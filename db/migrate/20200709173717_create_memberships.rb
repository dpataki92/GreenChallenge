class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.string :membership_type, default: "simple"
      t.integer :user_id
      t.integer :group_id
    end
  end
end
