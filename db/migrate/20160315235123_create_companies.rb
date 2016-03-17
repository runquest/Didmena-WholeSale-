class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false, limit: 200
      t.string :country, null: false, limit: 30
      t.string :city, null: false, limit: 30
      t.string :street, null: false, limit: 30
      t.string :postal_code, null: false, limit:10
      t.string :email, null: false, limit: 100
      t.text :description

      t.timestamps null: false
    end
    add_index :companies, [:name], :unique => true, name: :ui_companies_name
    add_index :companies, [:email], :unique => true, name: :ui_companies_email
  end
end
