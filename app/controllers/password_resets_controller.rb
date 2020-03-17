class PasswordResetsController < ApplicationController
  before_action :get_shop, only: [:edit, :update]
  before_action :valid_shop, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def edit
  end

  def create
    @shop = Shop.find_by(email: params[:password_reset][:email].downcase)
    if @shop
      @shop.create_reset_digest
      @shop.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to shops_login_path
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def update
    if params[:shop][:password].empty?
      @shop.errors.add(:password, "Can't be empty")
      render 'edit'
    elsif @shop.update_attributes(shop_params)
      log_in(@shop)
      @shop.update_attribute(:reset_digest, nil)
      flash[:success] = "Password has been reset"
      redirect_to @shop
    else
      render 'edit'
    end
  end

  private

    def shop_params
      params.require(:shop).permit(:password, :password_confirmation)
    end

    # get info shop
    def get_shop
      @shop = Shop.find_by(email: params[:email])
    end

    # validate shop
    def valid_shop
      unless (@shop && @shop.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # check token is expiraion
    def check_expiration
      if @shop.password_reset_expired?
        flash[:danger] = "Password reset has expired"
        redirect_to new_password_reset_url
      end
    end
end
