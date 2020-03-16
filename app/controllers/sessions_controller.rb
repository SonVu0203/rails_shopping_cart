class SessionsController < ApplicationController
  def new
  end

  def create
    shop = Shop.find_by(email: params[:session][:email].downcase)
    user = User.find_by(email: params[:session][:email].downcase)

    if shop && shop.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in(shop)
      redirect_to shop
    elsif user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
