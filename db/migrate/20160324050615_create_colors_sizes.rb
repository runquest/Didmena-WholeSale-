class CreateColorsSizes < ActiveRecord::Migration
  def change
    create_table :colors_sizes do |t|
      t.integer :size_id, null: false
      t.integer :color_id, null: false

      t.timestamps null: false
    end
  end
end