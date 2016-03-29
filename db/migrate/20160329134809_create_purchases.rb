class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.text :note

      t.timestamps null: false

      t.check "quantity > 0", name: 'purchase_quantity_chk'
    end

    add_index :purchases, [:order_id, :product_id], :unique => true, name: :ui_purchases
 
    add_foreign_key :purchases, :orders, on_delete: :cascade, name: :fk_purchase_on_order_id
    add_index :purchases, [:order_id], name: :i_purchase_on_order_id
 
    add_foreign_key :purchases, :products, on_delete: :cascade, name: :fk_purchase_on_product_id
    add_index :purchases, [:product_id], name: :i_purchase_on_product_id

  end
end