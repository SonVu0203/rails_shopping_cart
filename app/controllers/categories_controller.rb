class CategoriesController < ApplicationController
  before_action :logged_in_shop, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category= Category.find(params[:id])
    @products = @category.products
  end

  def new
    @category = Category.new
    @shop_id = current_shop.id
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = current_shop.categories.build(category_params)
    if @category.save
      flash[:success] = "New Category success!"
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      flash[:success] = "Category is update"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category is deleted"
    redirect_to categories_path
  end

  def logged_in_shop
    unless logged_in?
      flash[:danger] = "please log in"
      redirect_to shops_login_path
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
