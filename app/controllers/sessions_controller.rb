class SessionsController < ApplicationController
  def new
  end

  def create
    shop = Shop.find_by(email: params[:session][:email].downcase)
    if shop && shop.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in(shop)
      redirect_to shop
    else
      flash[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to shops_login_path
  end
end
