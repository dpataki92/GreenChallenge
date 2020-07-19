class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :likes, default: 0
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
