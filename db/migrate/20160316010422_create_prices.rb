class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id, null: false
      t.date :from, null: false			# Day when price set
      t.decimal :price, :decimal, :precision => 10, :scale => 2, null: false
      t.string :currency, null: false, limit: 3  # EUR, USD, CAD, PLZ, RUR, etc.
      t.text :comment

      t.timestamps null: false

      t.check "price > 0", name: 'price_price_chk'
    end

    add_index :prices, [:product_id, :from, :currency], :unique => true, name: :ui_prices_product_from_curr
 
    add_foreign_key :prices, :products, on_delete: :cascade, name: :fk_prices_on_product_id
    add_index :prices, [:product_id], name: :i_prices_on_product_id
 
  end
end
