class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :product_count
      t.integer :price
      t.integer :productio_status

      t.timestamps
    end
  end
end
