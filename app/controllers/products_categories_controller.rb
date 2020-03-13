class ProductsCategoriesController < ApplicationController

  def index
    @categories = Category.joins(:products_categories).distinct(:id)
  end


end
