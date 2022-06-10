class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      # t.string :genre_id, null: false
      t.string :product_name, null: false
      # t.string :product_image, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      # t.boolean :product_status, default: false, null:false

      t.timestamps
    end
  end
end
