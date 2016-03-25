class CreateOrderproducts < ActiveRecord::Migration
  def change
    create_table :orderproducts do |t|
      t.integer :order_id, null: false
      t.integer :model_id, null: false
      t.integer :size_id, null: false
      t.integer :color_id, null: false
      t.integer :quantity, null: false
      t.text :comment

      t.timestamps null: false

      t.check 'quantity > 0', name: 'ord_prod_quantity_chk'
    end

  end
end
