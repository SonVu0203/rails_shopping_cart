class ShopsController < ApplicationController
  before_action :logged_in_shop, only: [:index, :show, :edit, :update]
  before_action :correct_shop, only: [:edit, :update]


  def index
    @shop = Shop.order(id: :asc).all
  end

  def show
    @shop = Shop.find(params[:id])
    @products = @shop.products
  end

  def new
    @shop = Shop.new
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    # debugger
    if @shop.save
      log_in(@shop)
      ShopMailer.account_activation(@shop).deliver_now
      flash[:info] = "Please check your email to activate your shop."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "Profile is update"
      redirect_to @shop
    else
      render 'edit'
    end
  end

  def logged_in_shop
    unless logged_in?
      flash[:danger] = "please log in"
      redirect_to shops_login_path
    end
  end

  # Confirms the correct user.
  def correct_shop
    @shop = Shop.find(params[:id])
    redirect_to(root_url) unless current_shop?(@shop)
  end

  # get products to shop
  def products
    @products = Shop.find(params[:id]).products.page(params[:page]).per(5)
    @shop = Shop.find(params[:id])
  end

  # get catgories to shop
  def categories
    @categories = Shop.find(params[:id]).categories.page(params[:page]).per(5)
    @shop = Shop.find(params[:id])
  end

  private
    def shop_params
      params.require(:shop).permit(:name, :email, :phone, :address, :description, :tax_code, :password, :password_confirmation)
    end
end
