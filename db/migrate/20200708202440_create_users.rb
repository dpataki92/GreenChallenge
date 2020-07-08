class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :password_digest
      t.string :country
      t.integer :points
    end
  end
end
