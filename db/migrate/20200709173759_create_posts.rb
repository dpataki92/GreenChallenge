class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :likes
      t.integer :user_id
      t.integer :group_id
    end
  end
end
