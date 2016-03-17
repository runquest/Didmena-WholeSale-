class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code, null: false, limit: 10
      t.string :title, null: false, limit: 100
      t.string :color, null: false, limit: 20
      t.string :size, null: false, limit: 10
      t.string :category, null: false, limit: 20
      t.text :comment

      t.timestamps null: false
    end
    add_index :products, [:code, :size], :unique => true, name: :ui_products_code_size
    add_index :products, [:title, :color, :size], :unique => true, name: :ui_products_tcs
  end
end
