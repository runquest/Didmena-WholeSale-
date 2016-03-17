class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_number, null: false, limit: 20
      t.date :order_date, null: false
      t.integer :agent_id, :references => "representative", null: false
      t.integer :contact_id, :references => "representative", null: false
      t.integer :quantity
      t.decimal :price, :decimal, :precision => 10, :scale => 2
      t.string :currency, limit: 3		# EUR, USD, CAD, PLZ, RUR, etc.
      t.decimal :discount, :decimal, :precision => 10, :scale => 2
      t.text :comment

      t.timestamps null: false

      t.check 'quantity > 0', name: 'order_quantity_chk'
      t.check 'price > 0', name: 'order_price_chk'
      t.check 'discount > 0', name: 'order_discount_chk'
      t.check 'price > discount', name: 'order_price_gt_discount_chk'
    end

    add_index :orders, [:order_number], :unique => true, name: :ui_order_number
 
    # add_foreign_key :orders, :representatives, name: :fk_orders_on_agent_id
    add_index :orders, [:agent_id], name: :i_orders_on_agent_id
 
    # add_foreign_key :orders, :representatives, name: :fk_orders_on_contact_id
    add_index :orders, [:contact_id], name: :i_orders_on_contact_id
 
  end
end
