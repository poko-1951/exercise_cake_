class Publics::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_products = CartProduct.all
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    @order.order_status = 0
    @order.total_price = @cart_products.inject(0) {|sum, item| sum + item.sum_price }
    if params[:order][:address_select] == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.address_name = current_customer.first_name_kanji + current_customer.family_name_kanji
    elsif params[:order][:address_select] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.address_name = @address.address_name
    end
  end

  def create
    cart_products = CartProduct.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_products.each do |product|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.product_id = product.product_id
        order_detail.product_count = product.product_count
        order_detail.price = product.product.price
        order_detail.productio_status = 0
        order_detail.save
        # cart_products.destroy_all
        redirect_to publics_complete_path
      end
    end
  end

  def index
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :address_name, :total_price, :postage, :order_status)
  end
end
