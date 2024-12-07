class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index]

  def index
  end

  # def new
  # @item = Item.new
  # end

  # def create
  # @user = User.new(user_params)
  # if @user.save
  # redirect_to user_path(@user), notice
  # else
  # render :new, status: :unprocessable_entity
  # end
  # end

  def destroy
  end

  # def move_to_index
  # return if user_signed_in?

  # redirect_to action: :index
  # end
end
