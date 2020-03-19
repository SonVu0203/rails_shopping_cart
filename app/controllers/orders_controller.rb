class OrdersController < ApplicationController
  before_action :logged_in_customer

  def index
    @orders= Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @customer = @current_customer
  end

  def create
    @order = Order.new(order_params)
    @current_cart.total = Cart.find(session[:cart_id]).sub_total
    # abort @current_cart

    @current_cart.cart_items.each do |i|
      @order.cart_items << i
      @order.tax_code = Faker::Number.number(digits: 6)
      # i.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to @order
  end

  def logged_in_customer
    unless logged_in_customer?
      flash[:danger] = "please log in"
      redirect_to customers_login_path
    end
  end

  private
    def order_params
      params.require(:order).permit( :name, :email, :phone, :address)
    end
end
