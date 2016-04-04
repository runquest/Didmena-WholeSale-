class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title, null: false, limit: 200
      t.string :email, null: false, limit: 100
      t.string :status, null: false, limit: 20
      t.integer :domain_id, null: false # with domain_name='COUNTRY'
      # t.string :city, null: false, limit: 30
      t.string :city, limit: 30
      # t.string :street, null: false, limit: 30
      t.string :street, limit: 30
      t.string :postal_code, limit:10
      t.string :phone, limit:100
      t.text :description

      t.timestamps null: false

      t.check "status IN ('active', 'inactive', 'flagged')", name: 'company_status_chk'
    end
    add_index :companies, [:title], :unique => true, name: :ui_companies_title
    add_index :companies, [:email], :unique => true, name: :ui_companies_email

    # add_foreign_key :companies, :domains, on_delete: :cascade, name: :fk_companies_on_domain_id   # COUNTRY
    add_foreign_key :companies, :domains, name: :fk_companies_on_domain_id   # COUNTRY
    add_index :companies, [:domain_id], name: :i_companies_on_domain_id   # COUNTRY
  end
end
