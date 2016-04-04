class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :code, null: false, limit: 10
      t.string :title, null: false, limit: 100
      t.integer :gender_id, :references => "domain", null: false    # domain_name GENDER
      t.integer :category_id, :references => "domain", null: false    # domain_name CATEGORY
      t.integer :price

      t.text :note

      t.timestamps null: false
    end

    add_index :models, [:code], :unique => true, name: :ui_model_code
 
    # domain_name GENDER
    add_foreign_key :models, :domains, column: :gender_id, name: :fk_models_on_gender_id
    add_index :models, [:gender_id], name: :i_models_on_gender_id
 
    # domain_name CATEGORY
    add_foreign_key :models, :domains, column: :category_id, name: :fk_models_on_category_id
    add_index :models, [:category_id], name: :i_models_on_category_id
 
  end
end