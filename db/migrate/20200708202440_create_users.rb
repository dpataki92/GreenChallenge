class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :country, default: ""
      t.integer :points, default: 0
      t.string :avatar, default: "/images/a1.png"

      t.timestamps
    end
  end
end
