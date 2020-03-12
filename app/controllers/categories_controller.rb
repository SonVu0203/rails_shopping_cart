class CategoriesController < ApplicationController

  def index
    @categories = Shop.find(params[:shop_id]).categories
    @shop = Shop.find(params[:shop_id])
  end

  def show
    @category= Category.find(params[:id])
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

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
