class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_prototypes, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  def index
 
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end
  
  def update
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit
      end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :situation_id, :postage_id, :prefecture_id,
                                 :shipment_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @item.order.presence || !(user_signed_in? && current_user.id == @item.user_id) 
      redirect_to action: :index
    end
  end

  def set_prototypes
    @item = Item.find(params[:id])
  end

end
