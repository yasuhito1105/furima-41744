class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

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
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :product_description, :category_id, :product_condition_id, :shipping_fee_id, :shipping_origin_region_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  # def move_to_index
  # return if user_signed_in?

  # redirect_to action: :index
  # end
end
