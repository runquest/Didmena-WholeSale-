class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 100
      t.string :fname, null: false, limit: 31
      t.string :lname, null: false, limit: 31
      t.string :password_digest, null: false
      t.string :status, null: false, limit: 20
      t.integer :company_id
      t.boolean :apps_manager
      t.string :phone, limit:100
      t.text :description

      t.timestamps null: false

      t.check "status IN ('active', 'inactive', 'flagged')", name: 'user_status_chk'
    end
    add_index :users, [:email], :unique => true, name: :ui_users_email

    # add_foreign_key :users, :companies, column: :company_id, name: :fk_users_on_company_id
    # add_index :users, [:company_id], name: :i_users_on_company_id
  end
end
