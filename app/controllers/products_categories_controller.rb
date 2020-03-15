class ProductsCategoriesController < ApplicationController

  def index
    # @categories = current_shop.categories.joins(:products_categories).distinct(:id)
    @categories = Category.all
  end

  def search
    if params[:search].blank?
      redirect_to root_path
    else
      @categories = Category.find(1)
    end
  end


end
