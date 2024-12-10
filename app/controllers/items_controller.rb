class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(user_params)
    if @item.save
      redirect_to user_path, notice
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  # def move_to_index
  # return if user_signed_in?

  # redirect_to action: :index
  # end
end
