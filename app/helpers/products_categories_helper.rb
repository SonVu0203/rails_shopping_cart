module ProductsCategoriesHelper

  def get_category(pc)
     @category = Category.find(pc.category_id)
     return @category.name
  end

end
