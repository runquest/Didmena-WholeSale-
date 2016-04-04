class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :model_id, null: false
      t.integer :color_id, :references => "domain", null: false   # domain_name COLOR
      t.integer :size_id, :references => "domain", null: false    # domain_name SIZE
      t.text :note

      t.timestamps null: false
    end

    add_index :products, [:model_id, :color_id, :size_id], :unique => true, name: :ui_products_model_color_size

    add_foreign_key :products, :models, name: :fk_products_on_model_id
    add_index :products, [:model_id], name: :i_products_on_model_id

    # domain_name COLOR
    add_foreign_key :products, :domains, column: :color_id, name: :fk_products_on_color_id
    add_index :products, [:color_id], name: :i_products_on_color_id

    # domain_name SIZE
    add_foreign_key :products, :domains, column: :size_id, name: :fk_products_on_size_id
    add_index :products, [:size_id], name: :i_products_on_size_id
 
  end
end