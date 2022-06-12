class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :total_price
      t.string :post_code
      t.string :address
      t.string :address_name
      t.integer :postage
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
