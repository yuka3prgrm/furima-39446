class OrdersController < ApplicationController
  def index
    @order = Order.new(order_params)
    @item = @order.item
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
