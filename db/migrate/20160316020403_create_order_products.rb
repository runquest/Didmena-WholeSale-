class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, null: false
      t.text :comment

      t.timestamps null: false

      t.check 'quantity > 0', name: 'ord_prod_quantity_chk'
    end

    add_index :order_products, [:order_id, :product_id], :unique => true, name: :ui_order_products
 
    add_foreign_key :order_products, :orders, on_delete: :cascade, name: :fk_ord_prod_on_order_id
    add_index :order_products, [:order_id], name: :i_ord_prod_on_order_id
 
    add_foreign_key :order_products, :products, on_delete: :cascade, name: :fk_ord_prod_on_product_id
    add_index :order_products, [:product_id], name: :i_ord_prod_on_product_id

  end
end
