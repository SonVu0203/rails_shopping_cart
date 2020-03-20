class ProductsController < ApplicationController
  before_action :logged_in_shop, only: [:edit, :update, :destroy]

  def index
    @products = Product.all.page(params[:page]).per(6)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.images.build
    @shop_id = current_shop.id
    @categories = current_shop.categories
    @product_id = Product.last.id + 1
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_shop.products.build(product_params)
    if @product.valid?
      @product.save
      flash[:success] = "New Product success!"
      redirect_to products_path
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
    redirect_to products_path
  end

  def logged_in_shop
    unless logged_in?
      flash[:danger] = "please log in"
      redirect_to shops_login_path
    end
  end

  def images
    @images = Product.find(params[:id]).images
    @product = Product.find(params[:id])
    @image = Image.new
  end

  def add_img
    @product = Product.find(params[:id])
    Image.create(:img_src => params[:image][:img_src], :imageable_id => params[:image][:imageable_id], :imageable_type => params[:image][:imageable_type] )
    # abort
    redirect_to @product
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_ids, images_attributes: [:id, :img_src, :imageable_id, :imageable_type])
  end
end
