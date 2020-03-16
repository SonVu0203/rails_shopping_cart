class ProductsCategoriesController < ApplicationController

  def index
    # @categories = current_shop.categories.joins(:products_categories).distinct(:id)
    @categories = Category.all
  end

  def search
    if params[:search].blank?
      redirect_to(root_path)
      flash[:warning] = "Empty field"
    else
      @name = params[:search].downcase
      @products = Product.all.where("LOWER(name) LIKE :search", search: "%#{@name}%").page(params[:page]).per(5)
      if @products.length <=0
        flash[:warning] = "Product your find not exits!"
      end
    end
  end
end
