class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :code
      t.integer :collection_id
      t.integer :type_id
      t.decimal :price
      t.binary :image
      t.text :description

      t.timestamps null: false
    end
  end
end
