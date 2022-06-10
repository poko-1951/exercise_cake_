class Admins::ProductsController < ApplicationController
  before_action :product_find, only: [:show, :edit, :update]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admins_products_path
  end

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to admins_product_path(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :introduction, :price)
  end

  def product_find
    @product = Product.find(params[:id])
  end
end
