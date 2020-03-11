class AccountActivationsController < ApplicationController
  def edit
    shop = Shop.find_by(email: params[:email])
    if shop && !shop.activated? && shop.authenticated?(:activation, params[:id])
      shop.update_attribute(:activated, true)
      shop.update_attribute(:activated_at, Time.zone.now)
      log_in(shop)
      flash[:success] = "Account is activated!"
      redirect_to shop
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
