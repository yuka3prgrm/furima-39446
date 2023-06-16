class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to item_path(@address.item) 
    else
      @item = @address.item
      @addresses = @item.addresses
      render "items/show"
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number).merge(order_id: params[:order_id])
  end
end
