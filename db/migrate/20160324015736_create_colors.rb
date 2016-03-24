class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :sizes, array: true

      t.timestamps null: false
    end
  end
end
