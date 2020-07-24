class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :user_id
      t.text :completed_challenges

      t.timestamps
    end
  end
end
