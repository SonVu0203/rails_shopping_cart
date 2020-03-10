class ShopsController < ApplicationController

  def index
    @shop = Shop.order(id: :asc).all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def edit
  end

  def create
    @shop = Shop.new(shop_params)
    # debugger
    if @shop.save
      flash[:success] = "Welcome to the Shop Cart"
      redirect_to @shop
    else
      render "new"
    end
  end

  private
    def shop_params
      params.require(:shop).permit(:name, :email, :phone, :address, :description, :tax_code, :password, :password_confirmation)
    end
end
