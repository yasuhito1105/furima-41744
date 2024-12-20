class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :redirect_if_ordered, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_delivery_address_form = OrderDeliveryAddressForm.new
  end

  def create
    @order_delivery_address_form = OrderDeliveryAddressForm.new(order_params)
    if @order_delivery_address_form.valid?
      pay_item

      @order_delivery_address_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private
  

  

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_delivery_address_form).permit(:postal_code, :shipping_origin_region_id, :city, :street_address,
                                                        :building_name, :phone_number)
          .merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: params[:token],
      currency: 'jpy'
    )
  end

  def redirect_if_ordered
    if @item.order.present? && current_user != @item.order
      redirect_to root_path
    end
  end
  
end
