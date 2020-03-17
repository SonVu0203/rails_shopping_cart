class CustomersController < ApplicationController
  before_action :logged_in_customer, only: [:index, :show, :edit, :update]

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "User has create success"
      redirect_to @customer
    else
      render 'new'
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:success] = "Profile is update"
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def logged_in_customer
    unless logged_in_customer?
      flash[:danger] = "please log in"
      redirect_to customers_login_path
    end
  end


  private
    def customer_params
      params.require(:customer).permit(:name, :email, :phone, :address, :password, :password_confirmation)
    end

end
