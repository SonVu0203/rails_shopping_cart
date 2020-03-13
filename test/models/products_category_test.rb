# == Schema Information
#
# Table name: products_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  product_id  :bigint
#
# Indexes
#
#  index_products_categories_on_category_id  (category_id)
#  index_products_categories_on_product_id   (product_id)
#

require 'test_helper'

class ProductsCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
