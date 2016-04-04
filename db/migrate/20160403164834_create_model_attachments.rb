class CreateModelAttachments < ActiveRecord::Migration
  def change
    create_table :model_attachments do |t|
      t.integer :model_id
      t.string :avatar

      t.timestamps null: false
    end
  end
end
