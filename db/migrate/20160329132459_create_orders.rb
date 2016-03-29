class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number, null: false, limit: 20
      t.date :order_date, null: false
      t.integer :representative_id, null: false     # representative as an agent
      t.integer :total_quantity
      t.decimal :total_price, :precision => 10, :scale => 2
      t.decimal :discount, :precision => 10, :scale => 2
      t.integer :domain_id          # domain_name = CURRENCY
      t.string :contact, limit: 100
      t.text :note

      t.timestamps null: false

      t.check "total_quantity > 0", name: 'order_total_quantity_chk'
      t.check "total_price > 0", name: 'order_total_price_chk'
      t.check "discount > 0", name: 'order_discount_chk'
      t.check "total_price > discount", name: 'order_total_price_gt_discount_chk'
    end

    add_index :orders, [:order_number], :unique => true, name: :ui_order_number
 
    add_foreign_key :orders, :representatives, name: :fk_orders_on_rep_id
    add_index :orders, [:representative_id], name: :i_orders_on_rep_id
 
    # domain_name CURRENCY
    add_foreign_key :orders, :domains, name: :fk_orders_on_domain_id
    add_index :orders, [:domain_id], name: :i_orders_on_domain_id
 
  end
end