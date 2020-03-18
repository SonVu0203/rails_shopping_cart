class CartsController < ApplicationController

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroyrai
    session[:cart_id] = nil
    redirect_to root_path
  end
end
