class CreateColorsModels< ActiveRecord::Migration
  def change
    create_table :colors_models do |t|
      t.integer :model_id, null: false
      t.integer :color_id, null: false

      t.timestamps null: false
    end
  end
end