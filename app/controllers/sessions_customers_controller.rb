class SessionsCustomersController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)
    if customer && customer.authenticate(params[:session][:password])
      log_in_customer(customer)
      if session[:shop_id]
        session[:shop_id] = nil
      end
      redirect_to customer
    else
      flash[:danger] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    log_out_customer
    redirect_to customers_login_path
  end

end
