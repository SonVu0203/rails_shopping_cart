class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include SessionsCustomersHelper

  before_action :current_cart

  def current_cart
    if session[:shop_id].nil?
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id].nil?
        @current_cart = Cart.create
        @current_cart.total = @current_cart.sub_total
        session[:cart_id] = @current_cart.id
      end
    end
  end
end
