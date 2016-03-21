class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.binary :image
      t.text :description

      t.timestamps null: false
    end
  end
end
