class Publics::AddressesController < ApplicationController
  before_action :address_find, only: [:edit, :update]

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = current_customer.addresses.new(address_params)
    @address.save
    redirect_to publics_addresses_path
  end

  def edit
  end

  def update
    @address.update(address_params)
    redirect_to publics_addresses_path
  end

  private
  
  def address_params
    params.require(:address).permit(:post_code, :address, :address_name)
  end

  def address_find
    @address = Address.find(params[:id])
  end
end
