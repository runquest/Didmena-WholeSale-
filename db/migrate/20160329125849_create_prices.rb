class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id, null: false
      t.date :from_date, null: false      # Day when price set
      t.decimal :price, :precision => 10, :scale => 2, null: false
      # t.integer :currency_id, null: false
      t.integer :domain_id, null: false # with domain_name='CURRENCY'
      t.text :note

      t.timestamps null: false

      t.check "price > 0", name: 'price_price_chk'
    end

    # add_index :prices, [:product_id, :from_date, :currency_id], :unique => true, name: :ui_prices_product_from_currency
    add_index :prices, [:product_id, :from_date, :domain_id], :unique => true, name: :ui_prices_product_from_currency
 
    add_foreign_key :prices, :products, on_delete: :cascade, name: :fk_prices_on_product_id
    add_index :prices, [:product_id], name: :i_prices_on_product_id
 
    # domain_name CURRENCY
    # add_foreign_key :prices, :domains, column: :currency_id, name: :fk_prices_on_currency_id
    add_foreign_key :prices, :domains, name: :fk_prices_on_domain_id
    # add_index :prices, [:currency_id], name: :i_prices_on_currency_id
    add_index :prices, [:domain_id], name: :i_prices_on_domain_id
 
   end
end