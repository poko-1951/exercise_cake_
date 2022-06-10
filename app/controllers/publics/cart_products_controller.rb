class Publics::CartProductsController < ApplicationController

  def create
    if current_customer.cart_products.exists?(product_id: cart_products_params[:product_id])
      @cart_product = current_customer.cart_products.find_by(product_id: cart_products_params[:product_id])
      @cart_product.product_count += cart_products_params[:product_count].to_i
    else 
      @cart_product = current_customer.cart_products.new(cart_products_params)
    end
    @cart_product.save
    redirect_to publics_cart_products_path
  end

  def index
    @cart_products = CartProduct.all
  end

  private

  def cart_products_params
    params.require(:cart_product).permit(:product_id, :product_count)
  end
end
