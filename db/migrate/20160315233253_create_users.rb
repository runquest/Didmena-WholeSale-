class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 100
      t.string :fname, null: false, limit: 31
      t.string :lname, null: false, limit: 31
      t.string :password_digest, limit: 100
      t.string :role, null: false, limit: 10
      t.text :description

      t.timestamps null: false
    end
    add_index :users, [:email], :unique => true, name: :ui_users
  end
end
