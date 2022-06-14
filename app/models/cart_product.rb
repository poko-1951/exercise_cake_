class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  def sum_price
    product.price * product_count
  end
end
