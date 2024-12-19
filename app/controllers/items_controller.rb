class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
    if user_signed_in? && @item.order.present?
      redirect_to root_path   
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    return if current_user.id == @item.user.id

    redirect_to item_path
  end

  def item_params
    params.require(:item).permit(:product_name, :image, :product_description, :category_id, :product_condition_id, :shipping_fee_id, :shipping_origin_region_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  # return if user_signed_in?

  # redirect_to action: :index
  # end
end
