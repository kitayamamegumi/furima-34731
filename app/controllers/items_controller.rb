class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]
  before_action :redirect_to_show, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
    else
      render :edit
    end
  end

  private

  def redirect_to_show
      redirect_to root_path unless current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :discribe, :category_id, :condition_id, :delivery_pay_id, :prefecture_id,
                                 :delivery_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
