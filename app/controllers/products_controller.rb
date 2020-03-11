class ProductsController < ApplicationController

  def products
    @products = Product.all
  end

  def index
    @products = Shop.find(params[:shop_id]).products
    @shop = Shop.find(params[:shop_id])
    # debugger
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_shop.products.build(product_params)
    # debugger
    if @product.save
      flash[:success] = "New Product success!"
      redirect_to shop_products_url(current_shop.id)
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product is update"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product is deleted"
    redirect_to shop_products_url(current_shop.id)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
